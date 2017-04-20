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
@RequestMapping(value = "/" + Pages.COMMON)
public class CommonController {

    @RequestMapping(value = "/" + Pages.SHOW_STUDENT_INFO, method = RequestMethod.GET)
    public String showStudent() {
        OUT.prt("request", Pages.SHOW_STUDENT_INFO);
        String res = Pages.COMMON + "/" + Pages.SHOW_STUDENT_INFO;
        return res;
    }

    @RequestMapping(value = "/" + Pages.ADD_STUDENT, method = RequestMethod.GET)
    public String addStudent() {
        OUT.prt("request", Pages.ADD_STUDENT);
        String res = Pages.COMMON + "/" + Pages.ADD_STUDENT;
        return res;
    }

}
