package com.finlit.finlitiso.services;

import com.finlit.finlitiso.entity.*;
import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.repositories.authenticationrepos.JWTTokenRepository;
import com.finlit.finlitiso.repositories.userrepos.UserRepository;
import com.finlit.finlitiso.security.dto.response.AuthenticationResponse;
import com.finlit.finlitiso.security.services.JWTService;
import com.finlit.finlitiso.services.serviceinterfaces.OtherLoginHandlingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OtherLoginHandlingServiceImpl implements OtherLoginHandlingService {

//    @Autowired
//    private DirectLoginUserRepository directLoginUserRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JWTService jwtService;

    @Autowired
    private JWTTokenRepository jwtTokenRepository;


    @Override
    public AuthenticationResponse authenticate(DirectLoginRequest loginRequest) {
        String jwtToken;
        try {

            User user = User.builder()
                    .firstName(loginRequest.getFirstName())
                    .lastName(loginRequest.getLastName())
                    .email(loginRequest.getEmail())
                    .password("google_authenticated" + loginRequest.getEmail())
                    .verified(true)
                    .emailToken(null)
                    .build();

            userRepository.save(user);

            jwtToken = jwtService.generateToken(user);
            revokeAllUserTokens(user);
            saveUserToken(user, jwtToken);
            return new AuthenticationResponse(jwtToken, jwtService.generateRefreshToken(user));
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }


    private void revokeAllUserTokens(User user) {
        var validUserTokens = jwtTokenRepository.findAllValidTokenByUser(user.getId());
        if (validUserTokens.isEmpty())
            return;
        jwtTokenRepository.expireAndRevokeTokensByUser(user.getId());
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


//    public OAuth2User displayUserDetails(OAuth2User oauth2User) {
//
//        if (oauth2User == null) {
//            return null;
//        }
//        String email = oauth2User.getAttribute("email");
//
//        DirectLoginUser user = directLoginUserRepository.findByEmail(email);
//        if (user == null) {
//            user = new DirectLoginUser();
//            user.setEmail(email);
//            user.setName(oauth2User.getAttribute("name"));
//            directLoginUserRepository.save(user);
//        }
//
//        return new FinLitOauth2User(oauth2User, oauth2User.getAuthorities(), "sub");
//    }
//
//    @Override
//    public String getUserName(OAuth2User oAuth2User) {
//        if (oAuth2User == null) {
//            return "User no found";
//        }
//        String email = oAuth2User.getAttribute("email");
//
//        DirectLoginUser user = directLoginUserRepository.findByEmail(email);
//        return user.getName();
//    }

}
