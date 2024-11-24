package com.finlit.finlitiso.controllers;

import com.finlit.finlitiso.dbmodels.learning.LearningTopic;
import com.finlit.finlitiso.exceptions.CustomException;
import com.finlit.finlitiso.exceptions.UnauthorizedException;
import com.finlit.finlitiso.security.services.JWTService;
import com.finlit.finlitiso.services.serviceinterfaces.LearningService;
import com.finlit.finlitiso.utils.FinlitConstants;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/learning")
public class LearningController {

    @Autowired
    private LearningService learningService;

    @GetMapping("/quiz")
    public ResponseEntity<Object> generateQuiz(@RequestParam Long quiz_id) {
        try {
            return ResponseEntity.ok(learningService.getTopics(quiz_id));
        } catch (UnauthorizedException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }
    }

    @GetMapping("/quiznames")
    public ResponseEntity<Object> quizNames(@RequestParam String quiz_level) {
        try {
            return ResponseEntity.ok(learningService.getAllQuizNames(quiz_level));
        } catch (UnauthorizedException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }
    }

    @GetMapping("/topicsinmodule")
    public ResponseEntity<Object> topicsListInModule(@RequestParam Long quiz_id) {
        try {
            return ResponseEntity.ok(learningService.getTopicsInQuiz(quiz_id));
        } catch (UnauthorizedException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }
    }


    @GetMapping("/checkquizattempt")
    public ResponseEntity<String> checkQuizAttempt(HttpServletRequest request, @RequestParam Long quizId) {
        try {
            return ResponseEntity.ok(learningService.canAttemptQuiz(request, quizId));
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping("/depletecash")
    public ResponseEntity<String> depleteQuizCash(HttpServletRequest request, @RequestParam Long quizId, @RequestParam Integer numOfIncorrectQuestions) {
        try {
            learningService.loseCash(request, quizId, numOfIncorrectQuestions);
            return ResponseEntity.ok().body(FinlitConstants.SUCCESS_MSG);
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PostMapping("/updateuserpoints")
    public ResponseEntity<String> userXPPoints(HttpServletRequest request, @RequestBody List<Long> correctlyAnsweredQuestions) {
        try {
            learningService.updateSolvedQuestions(request, correctlyAnsweredQuestions);
            return ResponseEntity.ok().body(FinlitConstants.SUCCESS_MSG);
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }


    @GetMapping("/topicprogress")
    public ResponseEntity<Object> userProgress(HttpServletRequest request, @RequestParam Long quizId) {
        try {
            return ResponseEntity.ok(learningService.getUserTopicProgress(request, quizId));
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

}