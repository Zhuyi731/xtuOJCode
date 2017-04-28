package com.xtu.exception;

import com.xtu.constant.Pages;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/** 通用应用异常处理配置
 * Created by Ilovezilian on 2017/4/17.
 */
@ControllerAdvice
public class AppWideExceptionHandler {

    @ExceptionHandler(NotFoundException.class)
    public String handleNotFound()
    {
        return Pages.NOT_FOUND_ERROR;
    }
}
