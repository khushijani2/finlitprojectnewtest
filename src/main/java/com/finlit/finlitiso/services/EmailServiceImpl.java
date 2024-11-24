package com.finlit.finlitiso.services;

import com.finlit.finlitiso.services.serviceinterfaces.EmailService;
import com.finlit.finlitiso.utils.FinlitConstants;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.MailException;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {

    private final JavaMailSender javaMailSender;

    @Async
    public void sendRegistrationToken(String email, String token) throws MailException {
        sendEmail(email, FinlitConstants.REGISTRATION_SUBJECT, String.format(FinlitConstants.REGISTRATION_EMAIL_BODY, token));
    }

    @Async
    public void sendResetPasswordToken(String email, String token) throws MailException {
        sendEmail(email, FinlitConstants.PWD_RESET_SUBJECT, String.format(FinlitConstants.PWD_RESET_EMAIL_BODY, String.format(FinlitConstants.PWD_RESET_LINK, token)));
    }

    public void sendLoginCode(String email, String code) {
        sendEmail(email, FinlitConstants.LOGIN_WITH_CODE_SUBJECT, String.format(FinlitConstants.LOGIN_WITH_CODE_EMAIL_BODY, code));
    }

    private void sendEmail(String email, String subject, String text) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(email);
        mailMessage.setSubject(subject);
        mailMessage.setText(text);
        javaMailSender.send(mailMessage);
    }
}
