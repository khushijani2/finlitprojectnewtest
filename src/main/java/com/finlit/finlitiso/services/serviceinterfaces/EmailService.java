package com.finlit.finlitiso.services.serviceinterfaces;

public interface EmailService {
    void sendRegistrationToken(String email, String token);

    void sendResetPasswordToken(String email, String token);

    void sendLoginCode(String email, String code);
}
