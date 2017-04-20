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
public class SuccessController {
    @RequestMapping(value = "/" + Pages.SUCCESS, method = RequestMethod.GET)
    public String showSuccess() {
        OUT.prt("request", Pages.SUCCESS);
        String res = Pages.SUCCESS;
        return res;
    }
}
