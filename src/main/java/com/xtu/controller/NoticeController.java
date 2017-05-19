package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 通知、通告控制器
 * Created by Ilovezilian on 2017/4/19.
 */
@Controller
@RequestMapping(value = "/" + Pages.NOTICE)
public class NoticeController {

    /**
     * 添加通告、公告界面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/" + Pages.ADD_NOTICE, method = RequestMethod.GET)
    public String addNotice(
            Model model) {
        OUT.prt("requst", Pages.ADD_NOTICE);
        String res = Pages.NOTICE + "/" + Pages.ADD_NOTICE;
        return res;
    }

    /**
     * 添加公告请求
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/" + Pages.ADD_NOTICE, method = RequestMethod.POST)
    public String addNoticePost(String content
            ,Model model) {
        OUT.prt("post", Pages.ADD_NOTICE);
        String res = Pages.NOTICE + "/" + Pages.ADD_NOTICE;
        return res;
    }

    /**
     * 显示公告界面
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.SHOW_NOTICE, method = RequestMethod.GET)
    public String showNotice() {
        OUT.prt("request", Pages.SHOW_NOTICE);
        String res = Pages.NOTICE + "/" + Pages.SHOW_NOTICE;
        return res;
    }

    /**
     * 显示公告详情
     *
     * @return
     */
    @RequestMapping(value = {"/" + Pages.SHOW_NOTICE_DETAIL, "/" + Pages.SHOW_NOTICE + "/{id}"}, method = RequestMethod.GET)
    public String showNoticeDetail() {
        OUT.prt("request", Pages.SHOW_NOTICE_DETAIL);
        String res = Pages.NOTICE + "/" + Pages.SHOW_NOTICE_DETAIL;
        return res;
    }
}
