package com.finlit.finlitiso.services.serviceinterfaces;

import com.finlit.finlitiso.entity.DirectLoginRequest;
import com.finlit.finlitiso.security.dto.response.AuthenticationResponse;
import org.springframework.security.oauth2.core.user.OAuth2User;

public interface OtherLoginHandlingService {
    AuthenticationResponse authenticate(DirectLoginRequest request);
//    OAuth2User displayUserDetails(OAuth2User oauth2User);
//    String getUserName(OAuth2User oAuth2User);
}
