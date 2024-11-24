package com.finlit.finlitiso.controllers;

import com.finlit.finlitiso.dbmodels.creds.UserDetails;
import com.finlit.finlitiso.dbmodels.login.EmailDetails;
import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.exceptions.UnauthorizedException;
import com.finlit.finlitiso.services.serviceinterfaces.UserService;
import com.finlit.finlitiso.utils.FinlitConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/profile")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/personaldetails")
    public ResponseEntity<String> updateDetails(@RequestBody UserDetails userDetails) {
        try {
            userService.updateUserDetails(userDetails);
            return ResponseEntity.ok(FinlitConstants.USR_DETAILS_UPDATED);
        } catch (UnauthorizedException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}
