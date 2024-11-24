package com.finlit.finlitiso.utils;

import com.finlit.finlitiso.entity.User;
import com.finlit.finlitiso.repositories.userrepos.UserRepository;
import com.finlit.finlitiso.security.services.JWTService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;

@Component
public class CustomSecurityUtil {

    @Autowired
    private JWTService jwtService;

    @Autowired
    private UserRepository userRepository;

    public boolean validateToken(HttpServletRequest request) {
        final String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        return (authHeader != null && authHeader.startsWith("Bearer "));
    }

    public User getUserFromRequest(HttpServletRequest request) {
        final String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            throw new RuntimeException("Invalid authorization");
        }

        final String refreshToken = authHeader.substring(7);
        final String userEmail = jwtService.extractUsername(refreshToken);
        User user = null;
        if (userEmail != null) {
            user = userRepository.findByEmailIgnoreCase(userEmail).orElseThrow();
        }
        return user;
    }
}
