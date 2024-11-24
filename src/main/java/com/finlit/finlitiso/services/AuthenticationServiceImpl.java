package com.finlit.finlitiso.services;

import com.finlit.finlitiso.entity.*;
import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.dbmodels.login.EmailDetails;
import com.finlit.finlitiso.repositories.authenticationrepos.EmailTokenRepository;
import com.finlit.finlitiso.repositories.authenticationrepos.JWTTokenRepository;
import com.finlit.finlitiso.repositories.authenticationrepos.PasswordResetTokenRepository;
import com.finlit.finlitiso.repositories.userrepos.UserRepository;
import com.finlit.finlitiso.security.dto.request.LoginRequest;
import com.finlit.finlitiso.security.dto.response.AuthenticationResponse;
import com.finlit.finlitiso.security.services.JWTService;
import com.finlit.finlitiso.services.serviceinterfaces.AuthenticationService;
import com.finlit.finlitiso.services.serviceinterfaces.EmailService;
import com.finlit.finlitiso.utils.FinlitConstants;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.mail.MailException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Random;

import static com.finlit.finlitiso.utils.FinlitConstants.*;

@Service
@RequiredArgsConstructor
public class AuthenticationServiceImpl implements AuthenticationService {

    private final EmailService emailService;
    private final JWTService jwtService;

    private final UserRepository userRepository;
    private final JWTTokenRepository jwtTokenRepository;
    private final EmailTokenRepository emailTokenRepository;
    private final PasswordResetTokenRepository resetPasswordRepository;

    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;

    public AuthenticationResponse authenticate(LoginRequest loginRequest) {
        var user = userRepository.findByEmailIgnoreCase(loginRequest.getEmail()).orElseThrow(() -> new CustomException(USR_NOT_FOUND, "4XX"));
        if (!user.isVerified()) {
            throw new CustomException(USR_NOT_VERIFIED, "4XX");
        }
        String jwtToken;
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            loginRequest.getEmail(),
                            loginRequest.getPassword()
                    )
            );

            jwtToken = jwtService.generateToken(user);
            revokeAllUserTokens(user);
            saveUserToken(user, jwtToken);
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
        return new AuthenticationResponse(jwtToken, jwtService.generateRefreshToken(user));
    }


    private void saveUserToken(User user, String jwtToken) {
        var token = Token.builder()
                .user(user)
                .token(jwtToken)
                .tokenType(TokenType.BEARER)
                .expired(false)
                .revoked(false)
                .build();
        jwtTokenRepository.save(token);
    }

    public AuthenticationResponse refreshToken(HttpServletRequest request) {

        final String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            throw new RuntimeException("Invalid authorization");
        }

        final String refreshToken = authHeader.substring(7);
        final String userEmail = jwtService.extractUsername(refreshToken);
        if (userEmail != null) {
            var user = this.userRepository.findByEmailIgnoreCase(userEmail).orElseThrow();
            if (jwtService.isTokenValid(refreshToken, user)) {
                var accessToken = jwtService.generateToken(user);
                revokeAllUserTokens(user);
                saveUserToken(user, accessToken);
                return new AuthenticationResponse(accessToken, refreshToken);

            } else {
                throw new CustomException("Invalid refresh token");
            }
        } else {
            throw new CustomException("Invalid User!");
        }
    }

    private void revokeAllUserTokens(User user) {
        var validUserTokens = jwtTokenRepository.findAllValidTokenByUser(user.getId());
        if (validUserTokens.isEmpty())
            return;
        jwtTokenRepository.expireAndRevokeTokensByUser(user.getId());
    }

    @Override
    @Transactional
    public boolean register(EmailDetails emailDetails) throws CustomException {
        if (userRepository.existsByEmailIgnoreCase(emailDetails.getEmail())) {
            throw new CustomException(FinlitConstants.EMAIL_EXISTS_MSG, "4XX");
        }

        try {
            Random random = new Random();
            String random_token = String.format("%04d", random.nextInt(10000));

            EmailToken emailToken = new EmailToken(random_token, LocalDateTime.now());

            User newUser = User.builder()
                    .email(emailDetails.getEmail())
                    .password(passwordEncoder.encode(emailDetails.getPassword()))
                    .build();
            emailToken.setUser(newUser);
            emailToken.setExpirationDate(LocalDateTime.now().plusMinutes(20));
            newUser.setEmailToken(emailToken);
            userRepository.save(newUser);

            emailService.sendRegistrationToken(newUser.getEmail(), newUser.getEmailToken().getRegistrationToken());
        } catch (MailException e) {
            throw new CustomException(MAIL_SERVICE_UNAVAILABLE_MSG, "5XX");
        } catch (Exception e) {
            throw new CustomException(EXCEPTION_MSG, "5XX");
        }
        return true;
    }

    @Override
    public boolean verifyEmail(String received_token) {

        if (received_token == null || received_token.isEmpty()) {
            throw new CustomException(VERIFY_EMAIL_INVALID, "4XX");
        }

        User user = userRepository.findUserByEmailToken(received_token);
        if (user != null) {
            if (user.getEmailToken() == null || user.getEmailToken().isExpired()) {
                throw new CustomException(TOKEN_EXPIRED, "4XX");
            }
            emailTokenRepository.delete(user.getEmailToken());
            user.setVerified(true);
            userRepository.save(user);
            return true;
        } else {
            throw new CustomException(VERIFY_EMAIL_INVALID, "4XX");
        }
    }

    public boolean sendPasswordReset(String email) throws MailException {
        User user = userRepository.findByEmailIgnoreCase(email).orElseThrow(() -> new CustomException(EMAIL_DOESNOT_EXIST_MSG, "4XX"));
        PasswordResetToken resetToken = new PasswordResetToken(String.format("%04d", new Random().nextInt(10000)), LocalDateTime.now());
        resetToken.setUser(user);
        resetPasswordRepository.save(resetToken);
        emailService.sendResetPasswordToken(email, resetToken.getResetToken());
        return true;
    }

    public boolean verifyResetPasswordToken(String received_token) {
        PasswordResetToken resetToken = resetPasswordRepository.findByResetToken(received_token).orElseThrow(() -> new CustomException(TOKEN_INVALID_MSG, "4XX"));

        if (resetToken.isExpired()) {
            throw new CustomException(TOKEN_EXPIRED, "4XX");
        }
        return true;
    }

    public boolean resetPassword(String reset_token, String password) {
        PasswordResetToken resetToken = resetPasswordRepository.findByResetToken(reset_token).orElseThrow(() -> new CustomException(TOKEN_INVALID_MSG, "4XX"));
        if (resetToken.isExpired()) {
            throw new CustomException(TOKEN_EXPIRED, "4XX");
        }
        User user = resetToken.getUser();
        if (user == null) {
            throw new CustomException(TOKEN_INVALID_MSG, "4XX");
        }
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);
        resetPasswordRepository.delete(resetToken);
        return true;
    }
}
