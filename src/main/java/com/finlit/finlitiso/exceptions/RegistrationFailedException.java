package com.finlit.finlitiso.exceptions;

public class RegistrationFailedException extends RuntimeException {
    String message;
    public RegistrationFailedException() {}
    public RegistrationFailedException(String message){
        super(message);
        this.message = message;
    }
}
