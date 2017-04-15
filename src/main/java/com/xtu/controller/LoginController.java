package com.xtu.controller;

import com.xtu.constant.Constant;
import com.xtu.entity.UsersEntity;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Ilovezilian on 2017/4/13.
 */
@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model) {
        OUT.prt("login get", "");
        model.addAttribute(new UsersEntity());
        return "login";
    }

    @RequestMapping(value = {"/login", "/info"}, method = RequestMethod.POST)
    public String showUserInfo(
            @NotNull @Valid UsersEntity usersEntiy,
            Errors errors) {
        OUT.prt("info", usersEntiy);

        if (errors.hasErrors()) {
            return "login";
        }

        usersEntiy = new UsersEntity();
        // TODO: 2017/4/13 select form DB
        Map<String, Object> model = new HashMap<>();
        if (null == usersEntiy) {
            model.put("message", "wrong use id or password");
            return "login";
        }
        // TODO: 2017/4/13 add user infomation
        usersEntiy.setRoleId(Constant.STUDENT);

        usersEntiy.setName("panshuai");
        usersEntiy.setId("2013551830");
        model.put("usersEntity", usersEntiy);
//        return getRoleType(usersEntiy.getRoleId()) + "/info";
        return "info";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String processRegistration(
            @NotNull @Valid UsersEntity usersEntity,
            Errors errors) {
        OUT.prt("register user", usersEntity);
        if (errors.hasErrors()) {
            return "register";
        }
//        // TODO: 2017/4/12  save user profile to db
//        usersRepository.save(usersEntity);
        usersEntity.setRoleId(Constant.STUDENT);

        return "redirect:/" + getRoleType(usersEntity.getRoleId()) + "/info";
    }

    private String getRoleType(int role_id) {
        String res;
        if (role_id == Constant.ADMIN) {
            res = "admin";
        } else if (role_id == Constant.TEACHER) {
            res = "teacher";
        } else {
            res = "student";
        }
        return res;
    }

}
