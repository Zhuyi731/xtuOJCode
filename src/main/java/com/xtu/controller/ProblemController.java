package com.xtu.controller;

import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 * Created by Ilovezilian on 2017/4/17.
 */
@Controller
public class ProblemController {

    @RequestMapping(value = "/" + Pages.PROBLEMS_INDEX, method = RequestMethod.GET)
    public String showTotalProblems(
            Model model) {
        OUT.prt("request", Pages.PROBLEMS_INDEX);
        // TODO: 2017/4/17 select problems from db 
        // TODO: 2017/4/17 add pagination

        return Pages.PROBLEMS_INDEX;
    }

    @RequestMapping(value = "/" + Pages.PROBLEM_DETAIL + "/{id}", method = RequestMethod.GET)
//    @RequestMapping(value = "/" + Pages.PROBLEM_DETAIL, method = RequestMethod.GET)
    public String showProblemDetails(
            @PathVariable("id") @Min(1) @NotNull int id,
            Model model) {
        OUT.prt("request", Pages.PROBLEM_DETAIL);
        OUT.prt("id", id);
        OUT.prt("model", model);
        model.addAttribute("id", id);

        // TODO: 2017/4/17 select from db 
        return Pages.PROBLEM_DETAIL;//+ "/{id}";
    }

    @RequestMapping(value = "/" + Pages.RANK_LIST, method = RequestMethod.GET)
    public String showRankList(
            Model model) {
        OUT.prt("request", Pages.RANK_LIST);
        // TODO: 2017/4/17 add pagination
        return Pages.RANK_LIST;
    }

    @RequestMapping(value = "/" + Pages.SUBMIT + "/{id}", method = RequestMethod.GET)
    public String submit(
            @PathVariable("id") @NotNull int id,
            Model model) {
        OUT.prt("requst", Pages.SUBMIT);
        model.addAttribute("id", id);
        // TODO: 2017/4/17 select from DB
        return Pages.SUBMIT;
    }

    @RequestMapping(value = "/" + Pages.STATUS, method = RequestMethod.GET)
    public String showStatus(
            Model model) {
        OUT.prt("request", Pages.STATUS);
        // TODO: 2017/4/17 add filter condition
        // TODO: 2017/4/17 add pagination
        return Pages.STATUS;
    }
}
