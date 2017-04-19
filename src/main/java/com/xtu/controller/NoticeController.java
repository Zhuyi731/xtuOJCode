package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Ilovezilian on 2017/4/19.
 */
@Controller
@RequestMapping(value = "/" + Pages.NOTICE)
public class NoticeController {

    @RequestMapping(value = "/" + Pages.ADD_NOTICE, method = RequestMethod.GET)
    public String addNotice(Model model) {
        OUT.prt("requst", Pages.ADD_NOTICE);
        String res = Pages.NOTICE + "/" + Pages.ADD_NOTICE;
        return res;
    }

    @RequestMapping(value = "/" + Pages.ADD_NOTICE, method = RequestMethod.POST)
    public String addNoticePost(Model model) {
        OUT.prt("post", Pages.ADD_NOTICE);
        String res = Pages.NOTICE + "/" + Pages.ADD_NOTICE;
        return res;
    }

    @RequestMapping(value = "/" + Pages.SHOW_NOTICE, method = RequestMethod.GET)
    public String showNotice() {
        OUT.prt("request", Pages.SHOW_NOTICE);
        String res = Pages.NOTICE + "/" + Pages.SHOW_NOTICE;
        return res;
    }
}
