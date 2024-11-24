package com.finlit.finlitiso.dbmodels.creds;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.Collection;

public class FinLitOauth2User extends DefaultOAuth2User {

    private OAuth2User oauth2User;

    public FinLitOauth2User(OAuth2User oauth2User, Collection<? extends GrantedAuthority> authorities,
                            String nameAttributeKey) {
        super(authorities, oauth2User.getAttributes(), nameAttributeKey);
        this.oauth2User = oauth2User;
    }

    public String getEmail() {
        return oauth2User.<String>getAttribute("email");
    }

    public String getName() {
        return oauth2User.<String>getAttribute("name");
    }
}
