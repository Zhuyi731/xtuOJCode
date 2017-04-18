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
@RequestMapping(value = "/" + Pages.TEACHER)
public class TeacherController {

    @RequestMapping(value = "/" + Pages.MAIN_PAGE, method = RequestMethod.GET)
    public String showMain() {
        OUT.prt("request", Pages.MAIN_PAGE);
        return Pages.TEACHER + "/" + Pages.MAIN_PAGE;
    }

    @RequestMapping(value = "/" + Pages.NAVIGATION, method = RequestMethod.GET)
    public String showNavigation(){
        OUT.prt("request", Pages.NAVIGATION);
        return Pages.TEACHER + "/" + Pages.NAVIGATION;
    }

    @RequestMapping(value = "/" + Pages.MENU, method = RequestMethod.GET)
    public String showMenu(){
        OUT.prt("request", Pages.MENU);
        return Pages.TEACHER + "/" + Pages.MENU;
    }

    @RequestMapping(value = "/" + Pages.MODIFY_PASSWORD, method = RequestMethod.GET)
    public String modifyPassword(){
        OUT.prt("request", Pages.MODIFY_PASSWORD);
        return Pages.MODIFY_PASSWORD;
    }

    @RequestMapping(value = "/" + Pages.TEACHER_INFO, method = RequestMethod.GET)
    public String modifyInfo(){
        OUT.prt("request", Pages.TEACHER_INFO);
        return Pages.TEACHER + "/" + Pages.TEACHER_INFO;
    }

    @RequestMapping(value = "/" + Pages.SHOW_STUDENT_INFO, method = RequestMethod.GET)
    public String showStudent(){
        OUT.prt("request", Pages.SHOW_STUDENT_INFO);
        return Pages.TEACHER + "/" + Pages.SHOW_STUDENT_INFO;
    }

    @RequestMapping(value = "/" + Pages.ADD_STUDENT, method = RequestMethod.GET)
    public String addStudent()
    {
        OUT.prt("request", Pages.ADD_STUDENT);
        return Pages.TEACHER + "/" + Pages.ADD_STUDENT;
    }
    // TODO: 2017/4/18 add a post method of adding student

    @RequestMapping(value = "/" + Pages.ADD_PROBLEM, method = RequestMethod.GET)
    public String addProblem(){
        OUT.prt("request", Pages.ADD_PROBLEM);
        return Pages.TEACHER + "/" + Pages.ADD_PROBLEM;
    }
    // TODO: 2017/4/18 add a post method of adding problem

    @RequestMapping(value = "/" + Pages.PROBLEM_MANAGER, method = RequestMethod.GET)
    public String managerProblem(){
        OUT.prt("request", Pages.PROBLEM_MANAGER);
        return Pages.TEACHER + "/" + Pages.PROBLEM_MANAGER;
    }
}
