package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 管理员相关页面控制器
 * Created by Ilovezilian on 2017/4/19.
 */
@Controller
@RequestMapping(value = "/" + Pages.ADMIN)
public class AdminController {

    /**
     * 主界面框架
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.MAIN_PAGE, method = RequestMethod.GET)
    public String showMain() {
        OUT.prt("request", Pages.MAIN_PAGE);
        String res = Pages.ADMIN + "/" + Pages.MAIN_PAGE;
        return res;
    }

    /**
     * 请求菜单页面
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.MENU, method = RequestMethod.GET)
    public String showMenu() {
        OUT.prt("request", Pages.MENU);
        String res = Pages.ADMIN + "/" + Pages.MENU;
        return res;
    }

    /**
     * 修改密码界面
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.MODIFY_PASSWORD, method = RequestMethod.GET)
    public String modifyPassword() {
        OUT.prt("request", Pages.MODIFY_PASSWORD);
        String res = Pages.MODIFY_PASSWORD;
        return res;
    }
}
