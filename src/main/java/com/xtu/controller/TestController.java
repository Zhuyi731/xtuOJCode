package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Controller
@RequestMapping(value = "/" + Pages.TEST)
public class TestController {

    @RequestMapping(value = "/" + Pages.TEST, method = RequestMethod.GET)
    public String showTest() {
        OUT.prt("request", Pages.TEST);
        // TODO: 2017/4/18 select from db
        return Pages.TEST + "/" + Pages.TEST;
    }

    @RequestMapping(value = "/" + Pages.TOTAL_TEST, method = RequestMethod.GET)
    public String showTotalTest() {
        OUT.prt("request", Pages.TOTAL_TEST);
        // TODO: 2017/4/18 select from db
        return Pages.TEST + "/" + Pages.TOTAL_TEST;
    }

    @RequestMapping(value = "/" + Pages.CREATE_TEST, method = RequestMethod.GET)
    public String createTest(
//            TODO: CreateEntity entity
            Model model) {
        OUT.prt("post", Pages.CREATE_TEST);
        // TODO: 2017/4/18 insert into db
        return Pages.TEST + "/" + Pages.CREATE_TEST;
    }

    @RequestMapping(value = "/" + Pages.JOIN_TEST, method = RequestMethod.GET)
    public String joinTest(
            // TODO: 2017/4/18 create entity
            Model model){
        OUT.prt("request", Pages.JOIN_TEST);
        // TODO: 2017/4/18 insert into db
        return Pages.TEST + "/" + Pages.JOIN_TEST;
    }
}
