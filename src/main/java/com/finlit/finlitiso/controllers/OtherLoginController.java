package com.finlit.finlitiso.controllers;

import com.finlit.finlitiso.entity.DirectLoginRequest;
import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.services.serviceinterfaces.OtherLoginHandlingService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/othersignin")
public class OtherLoginController {

    @Autowired
    private OtherLoginHandlingService otherLoginHandlingService;

    //TODO - Restrict access to this to only the frontEnd Application
    @PostMapping("/loginwithgoogle")
    public ResponseEntity<Object> googleLogin(@RequestBody DirectLoginRequest loginRequest) {
        try {
            return ResponseEntity.ok(otherLoginHandlingService.authenticate(loginRequest));
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }
    }

    @GetMapping("/loginwithgoogle")
    public String redirectToNewUrl() {
        return "redirect:/oauth2/authorization/google";
    }

//    @GetMapping("/oauthsuccess")
//    public String loginSuccess(HttpServletRequest request, Model model) {
//        OAuth2User oAuth2User = (OAuth2User) request.getSession().getAttribute("oauth2User");
//        otherLoginHandlingService.displayUserDetails(oAuth2User);
//        model.addAttribute("user_name", otherLoginHandlingService.getUserName(oAuth2User));
//        return "dashboard";
//    }

//    @GetMapping("/login")
//    public String showLoginForm(Model model) {
//        return "login";
//    }
}
