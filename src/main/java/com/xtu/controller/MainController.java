package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Ilovezilian on 2017/4/13.
 */
@Controller
public class MainController {

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index() {
        OUT.prt("request:", "index");
        return Pages.INDEX;
    }
}
