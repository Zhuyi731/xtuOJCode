package com.xtu.controller;

import com.xtu.constant.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.Min;

/**
 * Created by Ilovezilian on 2017/4/13.
 */
@Controller
@RequestMapping(value = "/ranklist")
public class RankListController {
    @RequestMapping(method = RequestMethod.GET)
    public String showRankList(
            @RequestParam(value = "start", defaultValue = Constant.PAGE_START) @Min(0) long start,
            @RequestParam(value = "size", defaultValue = Constant.PAGE_SIZE) @Min(0) long size) {
        // TODO: 2017/4/13   query the page of ranklist messages
        return "ranklist";
    }
}
