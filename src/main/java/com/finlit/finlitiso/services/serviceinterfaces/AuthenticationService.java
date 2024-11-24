package com.finlit.finlitiso.services.serviceinterfaces;

import com.finlit.finlitiso.dbmodels.login.EmailDetails;
import com.finlit.finlitiso.security.dto.request.LoginRequest;
import com.finlit.finlitiso.security.dto.response.AuthenticationResponse;
import jakarta.servlet.http.HttpServletRequest;

public interface AuthenticationService {

    boolean register(EmailDetails emailDetails);

    boolean verifyEmail(String token);

    boolean sendPasswordReset(String email);

    boolean verifyResetPasswordToken(String reset_token);

    boolean resetPassword(String reset_token, String newPassword);

    AuthenticationResponse authenticate(LoginRequest request);

    AuthenticationResponse refreshToken(HttpServletRequest request);
}
