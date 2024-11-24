package com.finlit.finlitiso.controllers;

import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.exceptions.UnauthorizedException;
import com.finlit.finlitiso.services.serviceinterfaces.PersonalizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;

import java.util.Map;

// TODO: All the APIs should verify the jwt tokens to authenticate users
@RestController
@RequestMapping("/personalization")
public class PersonalizationController {

    @Autowired
    private PersonalizationService personalizationService;

    @GetMapping("/questions")
    public ResponseEntity<Object> personalizationQuestions() {
        try {
            return ResponseEntity.ok(personalizationService.getRandomQuestions());
        } catch (UnauthorizedException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PostMapping("/proficiency")
    public ResponseEntity<String> proficiencyCalculator(@RequestBody Map<Long, String> responses) {
        try {
            return ResponseEntity.ok(personalizationService.getProficiencyLevel(responses).name());
        } catch (UnauthorizedException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping("/learningstylequestions")
    public ResponseEntity<Object> learningStyleQuestions() {
        try {
            return ResponseEntity.ok(personalizationService.getLearningStyleQuestions());
        } catch (UnauthorizedException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PostMapping("/learningstyle")
    public ResponseEntity<String> learningStyleFinder(@RequestBody Map<Long, String> responses) {
        try {
            return ResponseEntity.ok(personalizationService.getLearningStyle(responses).name());
        } catch (UnauthorizedException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}
