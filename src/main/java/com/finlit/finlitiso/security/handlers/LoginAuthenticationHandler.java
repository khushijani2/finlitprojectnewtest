package com.finlit.finlitiso.security.handlers;

import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import java.io.IOException;

public class LoginAuthenticationHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response, Authentication authentication) throws IOException, jakarta.servlet.ServletException {
        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
        request.getSession().setAttribute("oauth2User", oAuth2User);
        response.sendRedirect("/login");
    }
}
