package com.finlit.finlitiso.services.serviceinterfaces;

import com.finlit.finlitiso.dbmodels.creds.UserDetails;

import jakarta.servlet.http.HttpServletRequest;

public interface UserService {
    void updateUserDetails(UserDetails userDetails);
}
