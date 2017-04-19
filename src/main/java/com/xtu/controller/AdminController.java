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

    @RequestMapping(value = "/" + Pages.NAVIGATION, method = RequestMethod.GET)
    public String showNavigation(){
        OUT.prt("request", Pages.NAVIGATION);
        String res =  Pages.ADMIN + "/" + Pages.NAVIGATION;
        return res;
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

//    @RequestMapping(value = "/" + Pages.ADMIN_INFO, method = RequestMethod.GET)
//    public String modifyInfo(){
//        OUT.prt("request", Pages.ADMIN_INFO);
//        String res =  Pages.ADMIN + "/" + Pages.ADMIN_INFO;
//        return res;
//    }

    @RequestMapping(value = "/" + Pages.SHOW_STUDENT_INFO, method = RequestMethod.GET)
    public String showStudent(){
        OUT.prt("request", Pages.SHOW_STUDENT_INFO);
        String res =  Pages.ADMIN + "/" + Pages.SHOW_STUDENT_INFO;
        return res;
    }

    @RequestMapping(value = "/" + Pages.ADD_STUDENT, method = RequestMethod.GET)
    public String addStudent()
    {
        OUT.prt("request", Pages.ADD_STUDENT);
        String res =  Pages.ADMIN + "/" + Pages.ADD_STUDENT;
        return res;
    }
    // TODO: 2017/4/18 add a post method of adding student

    @RequestMapping(value = "/" + Pages.ADD_PROBLEM, method = RequestMethod.GET)
    public String addProblem(){
        OUT.prt("request", Pages.ADD_PROBLEM);
        String res =  Pages.ADMIN + "/" + Pages.ADD_PROBLEM;
        return res;
    }
    // TODO: 2017/4/18 add a post method of adding problem

    @RequestMapping(value = "/" + Pages.PROBLEM_MANAGER, method = RequestMethod.GET)
    public String managerProblem(){
        OUT.prt("request", Pages.PROBLEM_MANAGER);
        String res =  Pages.ADMIN + "/" + Pages.PROBLEM_MANAGER;
        return res;
    }
}
