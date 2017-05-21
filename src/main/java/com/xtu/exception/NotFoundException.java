package com.xtu.exception;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/** 资源不存在错误
 * Created by Ilovezilian on 2017/4/17.
 */


@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="Not Found")
public class NotFoundException extends RuntimeException {

}

