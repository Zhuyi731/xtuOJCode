package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** 学生控制器
 * Created by Ilovezilian on 2017/4/18.
 */
@Controller
@RequestMapping(value = "/" + Pages.STUDENT)
public class StudentController {

    /**
     * 学生主框架页面
     * @return
     */
    @RequestMapping(value = "/" + Pages.MAIN_PAGE, method = RequestMethod.GET)
    public String showMain() {
        OUT.prt("request", Pages.MAIN_PAGE);
        String res = Pages.STUDENT + "/" + Pages.MAIN_PAGE;
        return res;
    }

    /**
     * 显示学生菜单界面
     * @return
     */
    @RequestMapping(value = "/" + Pages.MENU, method = RequestMethod.GET)
    public String showMenu(){
        OUT.prt("request", Pages.MENU);
        String res = Pages.STUDENT + "/" + Pages.MENU;
        return res;
    }

}
