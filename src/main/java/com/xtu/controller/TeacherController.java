package com.xtu.controller;

import com.xtu.DB.ProblemsRepository;
import com.xtu.DB.TestdatasRepository;
import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** 教师控制器
 * Created by Ilovezilian on 2017/4/18.
 */
@Controller
@RequestMapping(value = "/" + Pages.TEACHER)
public class TeacherController {

    @Autowired
    ProblemsRepository problemsRepository;
    @Autowired
    TestdatasRepository testdatasRepository;

    /**
     * 主框架界面
     * @return
     */
    @RequestMapping(value = "/" + Pages.MAIN_PAGE, method = RequestMethod.GET)
    public String showMain() {
        OUT.prt("request", Pages.MAIN_PAGE);
        String res = Pages.TEACHER + "/" + Pages.MAIN_PAGE;
        return res;
    }

    /**
     * 显示老师按钮界面
     * @return
     */
    @RequestMapping(value = "/" + Pages.MENU, method = RequestMethod.GET)
    public String showMenu() {
        OUT.prt("request", Pages.MENU);
        String res = Pages.TEACHER + "/" + Pages.MENU;
        return res;
    }
}
