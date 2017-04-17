package com.xtu.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * Created by Ilovezilian on 2017/4/17.
 */
@ControllerAdvice
public class AppWideExceptionHandler {

    @ExceptionHandler(NotFoundException.class)
    public String handleNotFound()
    {
        return "error";
    }
}
