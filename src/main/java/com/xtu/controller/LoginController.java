package com.xtu.controller;

import com.xtu.DB.UsersRepository;
import com.xtu.DB.entity.UsersEntity;
import com.xtu.constant.Constant;
import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 * Created by Ilovezilian on 2017/4/13.
 */
@Controller
public class LoginController {

    @Autowired
    private UsersRepository usersRepository;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model) {
        OUT.prt("login get", "");
        model.addAttribute(new UsersEntity());
        return Pages.LOGIN;
    }

    @RequestMapping(value = {"/login", "/info"}, method = RequestMethod.POST)
    public String loginPost(
            @NotNull @Valid UsersEntity usersEntiy,
            Errors errors,
            RedirectAttributes model) {
        OUT.prt("info", usersEntiy);

        if (errors.hasErrors()) {
            return Pages.LOGIN;
        }

        if (model.containsAttribute("usersEntity")) {
            return Pages.INFO;
        }
        // TODO: 2017/4/13 select form DB
        if (null == usersEntiy) {
            model.addAttribute("message", "wrong use id or password");
            return Pages.LOGIN;
        }
        // TODO: 2017/4/13 add user infomation
        usersEntiy.setRoleId(Constant.STUDENT);

        int cont = usersRepository.count().intValue();
        usersEntiy.setId("2013551830");
        usersEntiy.setName("panshuai+" + cont);
        usersEntiy.setUserId(cont);
        OUT.prt("count", cont);
        model.addFlashAttribute("usersEntity", usersEntiy);
//        return getRoleType(usersEntiy.getRoleId()) + "/info";
        return "redirect:/" + Pages.INFO;
    }

    @RequestMapping(value = "info", method = RequestMethod.GET)
    public String showUsersInfo(
            @NotNull @Valid UsersEntity usersEntiy,
            Errors errors,
            Model model) {
        if (!model.containsAttribute("usersEntity")) {
            return Pages.LOGIN;
        }
        return Pages.INFO;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return Pages.REGISTER;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String processRegistration(
            @NotNull @Valid UsersEntity usersEntity,
            Errors errors) {
        OUT.prt("register user", usersEntity);
        if (errors.hasErrors()) {
            return Pages.REGISTER;
        }
//        // TODO: 2017/4/12  save user profile to db
//        usersRepository.save(usersEntity);
        usersEntity.setRoleId(Constant.STUDENT);

        return "redirect:/" + getRoleType(usersEntity.getRoleId()) + "/" + Pages.INFO;
    }

    private String getRoleType(int role_id) {
        String res;
        if (role_id == Constant.ADMIN) {
            res = Pages.ADMIN;
        } else if (role_id == Constant.TEACHER) {
            res = Pages.TEACHER;
        } else {
            res = Pages.STUDENT;
        }
        return res;
    }

}
