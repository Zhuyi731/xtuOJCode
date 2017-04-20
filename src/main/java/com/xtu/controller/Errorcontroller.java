package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Ilovezilian on 2017/4/20.
 */
@Controller
public class Errorcontroller {
    @RequestMapping(value = "/" + Pages.ERROR, method = RequestMethod.GET)
    public String showError() {
        OUT.prt("request:", Pages.ERROR);
        String res = Pages.ERROR;
        return res;
    }

    @RequestMapping(value = "/" + Pages.NOT_FOUND_ERROR, method = RequestMethod.GET)
    public String showNotFoundError() {
        OUT.prt("request:", Pages.NOT_FOUND_ERROR);
        String res = Pages.NOT_FOUND_ERROR;
        return res;
    }

    @RequestMapping(value = "/" + Pages.LOGIN_ERROR, method = RequestMethod.GET)
    public String showLoginError() {
        OUT.prt("request:", Pages.LOGIN_ERROR);
        String res = Pages.LOGIN_ERROR;
        return res;
    }
}
