package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Controller
@RequestMapping(value = "/" + Pages.STUDENT)
public class StudentController {

    @RequestMapping(value = "/" + Pages.MAIN_PAGE, method = RequestMethod.GET)
    public String showMain() {
        OUT.prt("request", Pages.MAIN_PAGE);
        return Pages.STUDENT + "/" + Pages.MAIN_PAGE;
    }

    @RequestMapping(value = "/" + Pages.NAVIGATION, method = RequestMethod.GET)
    public String showNavigation(){
        OUT.prt("request", Pages.NAVIGATION);
        return Pages.STUDENT + "/" + Pages.NAVIGATION;
    }

    @RequestMapping(value = "/" + Pages.MENU, method = RequestMethod.GET)
    public String showMenu(){
        OUT.prt("request", Pages.MENU);
        return Pages.STUDENT + "/" + Pages.MENU;
    }

    @RequestMapping(value = "/" + Pages.MODIFY_PASSWORD, method = RequestMethod.GET)
    public String modifyPassword(){
        OUT.prt("request", Pages.MODIFY_PASSWORD);
        return Pages.MODIFY_PASSWORD;
    }

    @RequestMapping(value = "/" + Pages.STUDENT_INFO, method = RequestMethod.GET)
    public String modifyInfo(){
        OUT.prt("request", Pages.STUDENT_INFO);
        return Pages.STUDENT + "/" + Pages.STUDENT_INFO;
    }

}
