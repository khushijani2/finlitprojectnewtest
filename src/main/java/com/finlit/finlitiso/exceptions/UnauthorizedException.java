package com.finlit.finlitiso.exceptions;

public class UnauthorizedException extends RuntimeException {
    String message;
    public UnauthorizedException() {}
    public UnauthorizedException(String message){
        super(message);
        this.message = message;
    }
}
