package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Ilovezilian on 2017/4/19.
 */
@Controller
@RequestMapping(value = "/" + Pages.ADMIN)
public class AdminController {

    @RequestMapping(value = "/" + Pages.MAIN_PAGE, method = RequestMethod.GET)
    public String showMain(){
        OUT.prt("request", Pages.MAIN_PAGE);
//        return Pages.ADMIN + "/" + Pages.MAIN_PAGE;
        return "admin/main";
    }

    @RequestMapping(value = "/" + Pages.MENU, method = RequestMethod.GET)
    public String showMenu(){
        OUT.prt("request", Pages.MENU);
        String res =  Pages.ADMIN + "/" + Pages.MENU;
        return res;
    }

    @RequestMapping(value = "/" + Pages.MODIFY_PASSWORD, method = RequestMethod.GET)
    public String modifyPassword(){
        OUT.prt("request", Pages.MODIFY_PASSWORD);
        String res =  Pages.MODIFY_PASSWORD;
        return res;
    }
}
