package com.finlit.finlitiso.utils;

import java.util.Map;

public final class FinlitConstants {

    public static final String SUCCESS_MSG = "Success";

    public static final String EXCEPTION_MSG = "Unexpected error encountered. Please try again after some time";

    public static final String REGISTRATION_SUBJECT = "Verify your email and complete registration";
    public static final String REGISTRATION_EMAIL_BODY = "To verify your email, please use this 4-digit pin : %s";
    public static final String EMAIL_EXISTS_MSG = "There is already an account registered with this email. Try registering with a new one";
    public static final String MAIL_SERVICE_UNAVAILABLE_MSG = "Mail service unavailable. Please try again later.";
    public static final String REGISTRATION_VERIFICATION_SUCCESSFUL_MSG = "Email verification successful";

    public static final String VERIFY_EMAIL_TITLE = "Verify Email";
    public static final String VERIFY_EMAIL_MSG = "Enter the 4-digit pin that we have sent via the email address %s";
    public static final String VERIFY_EMAIL_INVALID = "Invalid token!";


    public static final String EMAIL_DOESNOT_EXIST = "No account exists with this email";
    public static final String EMAIL_DOESNOT_EXIST_MSG = "No account was registered with the given email";

    public static final String PWD_RESET_SUBJECT = "Set new password";
    public static final String PWD_RESET_EMAIL_BODY = "Reset your password by clicking on the this link %s";
    public static final String PWD_RESET_LINK = "https://localhost:8080/auth/verify-reset-password?reset_token=%s";

    public static final String LOGIN_WITH_CODE_SUBJECT = "Code to Login to your FinEd Account";
    public static final String LOGIN_WITH_CODE_EMAIL_BODY = "Login to your FinEd Account by using this code %s";
    public static final String LOGIN_WITH_CODE_SUCCESS = "A code has been sent to your email. Login to your account using the code";
    public static final String LOGIN_WITH_CODE_FAILED = "Failed to send login code";

    public static final String LOGIN_WITH_CODE_INVALID = "Failed to login. The code entered is incorrect.";

    public static final String PWD_RESET_SENT = "Password Reset Link Sent";
    public static final String PWD_RESET_VERIFIED = "Password reset code has been verified. You can now set your new password";
    public static final String PWD_RESET_SUCCESSFUL = "Password reset successful!";

    public static final String USR_NOT_FOUND = "User Not Found";
    public static final String USR_NOT_VERIFIED = "Please verify your email before continuing to login";

    public static final String USR_DETAILS_UPDATED = "";
    public static final String USR_NAME_EXISTS = "Username already exists. Choose a different one";

    public static final String TOKEN_EXPIRED = "The entered code has expired";
    public static final String TOKEN_INVALID_MSG = "Entered reset code is invalid";

    public static final String QUIZZES_NOT_FOUND = "Couldn't find any quizzes of the given difficulty level";
    public static final String QUIZ_TOPICS_NOT_FOUND = "Couldn't find topics in this module";
    public static final String QUIZ_TOPIC_EXAMPLES_ERROR = "Encountered issue trying to fetch examples for the topic";
    public static final String QUIZ_TOPIC_KEYTERMS_ERROR = "Encountered issue trying to fetch key terms for the topic";
    public static final String QUIZ_NOT_FOUND = "Couldn't find the quiz";

    public static final long MAX_WADS_OF_CASH_PER_TOPIC = 3;
    public static final long REPLENISH_CASH_INTERVAL_MINUTES = 30;
    public static final String NO_CASH_LEFT_MSG = "No cash left to deplete";



    public static final Integer MAX_QUESTIONS_PER_TOPIC = 4;

    public enum ProficiencyLevel {
        BEGINNER,
        INTERMEDIATE,
        ADVANCED,
        ERROR
    }

    public enum LearningStyle {
        AUDITORY,
        VISUAL,
        KINESTHETIC,
        ERROR
    }

    public enum DifficultyLevel {
        EASY,
        INTERMEDIATE,
        ADVANCED
    }

    public enum LEARNING_QUESTION_TYPE {
        TRUE_FALSE,
        MULTIPLE_CHOICE,
        FILL_IN_THE_BLANK
    }

    public static final Map<String, String> PERSONALIZATION_QUESTION_TYPE_MAP = Map.of(
            "multiple-choice", "1",
            "true-false", "2",
            "fill-in-the-blank", "3",
            "short-answer", "4"
    );

    public static final Map<String, String> PERSONALIZATION_DIFFICULTY_LEVEL_MAP = Map.of(
            "easy", "1",
            "intermediate", "2",
            "advanced", "3"
    );
}