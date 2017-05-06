package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 错误类型页面控制器
 * Created by Ilovezilian on 2017/4/20.
 */
@Controller
public class Errorcontroller {
    /**
     * 通用出错页面
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.ERROR, method = RequestMethod.GET)
    public String showError() {
        OUT.prt("request:", Pages.ERROR);
        String res = Pages.ERROR;
        return res;
    }

    /**
     * 404错误
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.NOT_FOUND_ERROR, method = RequestMethod.GET)
    public String showNotFoundError() {
        OUT.prt("request:", Pages.NOT_FOUND_ERROR);
        String res = Pages.NOT_FOUND_ERROR;
        return res;
    }

    /**
     * 登录出错
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.LOGIN_ERROR, method = RequestMethod.GET)
    public String showLoginError() {
        OUT.prt("request:", Pages.LOGIN_ERROR);
        String res = Pages.LOGIN_ERROR;
        return res;
    }
}
