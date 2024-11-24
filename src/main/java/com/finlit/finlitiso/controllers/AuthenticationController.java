package com.finlit.finlitiso.controllers;

import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.dbmodels.login.EmailDetails;
import com.finlit.finlitiso.security.dto.request.LoginRequest;
import com.finlit.finlitiso.services.serviceinterfaces.AuthenticationService;
import com.finlit.finlitiso.utils.FinlitConstants;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor(onConstructor_ = {@Autowired})
public class AuthenticationController {

    private final AuthenticationService authenticationService;

    @PostMapping("/login")
    public ResponseEntity<Object> login(@RequestBody LoginRequest request) {
        try {
            return ResponseEntity.ok(authenticationService.authenticate(request));
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }
    }



    @PostMapping("/signup")
    public ResponseEntity<String> createAccount(@RequestBody EmailDetails emailDetails) {
        try {
            authenticationService.register(emailDetails);
            return ResponseEntity.ok(String.format(FinlitConstants.VERIFY_EMAIL_MSG, emailDetails.getEmail()));
        } catch (CustomException e) {
            if ("4XX".equals(e.getErrorCode())) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
            }
        }
    }

    @PostMapping("/refresh-token")
    public ResponseEntity<Object> refreshToken(HttpServletRequest request) throws IOException {
        try {
            return ResponseEntity.ok(authenticationService.refreshToken(request));
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping("/verify-email")
    public ResponseEntity<String> verifyEmail(@RequestParam String token) {
        try {
            authenticationService.verifyEmail(token);
            return ResponseEntity.ok(FinlitConstants.REGISTRATION_VERIFICATION_SUCCESSFUL_MSG);
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping("/reset-password/request")
    public ResponseEntity<Object> sendPasswordReset(@RequestParam String email) {
        try {
            authenticationService.sendPasswordReset(email);
            return ResponseEntity.ok(FinlitConstants.PWD_RESET_SENT);
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        } catch (MailException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(FinlitConstants.MAIL_SERVICE_UNAVAILABLE_MSG);
        }
    }

    @GetMapping("/verify-reset-password")
    public ResponseEntity<Object> verifyResetPassword(@RequestParam String reset_token) {
        try {
            authenticationService.verifyResetPasswordToken(reset_token);
            return ResponseEntity.ok(FinlitConstants.PWD_RESET_VERIFIED);
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    //TODO - Restrict access to this when verify-reset-password is successful
    @GetMapping("/reset-password")
    public ResponseEntity<Object> resetPassword(@RequestParam String reset_token, @RequestParam String password) {
        try {
            authenticationService.resetPassword(reset_token, password);
            return ResponseEntity.ok(FinlitConstants.PWD_RESET_SUCCESSFUL);
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @ExceptionHandler(value = Exception.class)
    public ResponseEntity<Object> handleLoginFailedExceptions(Exception ex) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(FinlitConstants.EXCEPTION_MSG);
    }
}
