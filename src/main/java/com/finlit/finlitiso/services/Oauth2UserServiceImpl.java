package com.finlit.finlitiso.services;

import com.finlit.finlitiso.entity.DirectLoginUser;
import com.finlit.finlitiso.repositories.authenticationrepos.DirectLoginUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class Oauth2UserServiceImpl extends DefaultOAuth2UserService {
    @Autowired
    private DirectLoginUserRepository directLoginUserRepository;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) {
        OAuth2User oAuth2User = super.loadUser(userRequest);

        String email = oAuth2User.getAttribute("email");
        String name = oAuth2User.getAttribute("name");
        String oauth2Id = oAuth2User.getAttribute("sub"); // This works for google

        DirectLoginUser user = directLoginUserRepository.findByOauth2Id(oauth2Id);
        if (user == null) {
            user = new DirectLoginUser();
            user.setEmail(email);
            user.setName(name);
            user.setOauth2Id(oauth2Id);
            directLoginUserRepository.save(user);
        } else {
            user.setEmail(email);
            user.setName(name);
            directLoginUserRepository.save(user);
        }

        return oAuth2User;
    }
}

