package com.xtu.controller;

import com.xtu.DB.UsersRepository;
import com.xtu.DB.dto.ModifyPasswordDTO;
import com.xtu.DB.dto.ModifyUserInfoDTO;
import com.xtu.DB.entity.UsersEntity;
import com.xtu.constant.Constant;
import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.security.Principal;

/**
 * 登录控制器
 * Created by Ilovezilian on 2017/4/13.
 */
@Controller
public class LoginController {

    @Autowired
    private UsersRepository usersRepository;

    /**
     * 用户信息界面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/" + Pages.USER_INFO + "/{id}", method = RequestMethod.GET)
    public String showUserInfo(
            @PathVariable("id") String id,
            Model model) {
        OUT.prt("request", Pages.USER_INFO);
        UsersEntity usersEntity = usersRepository.findOne(id);
        usersEntity.setPassword("(^_^)");
        model.addAttribute("entity", usersEntity);
        OUT.prt("usersEntity", usersEntity);
        String res = Pages.USER_INFO;
        return res;
    }

    /**
     * 登录界面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/" + Pages.LOGIN, method = RequestMethod.GET)
    public String login(Model model) {
        OUT.prt("login get", Pages.LOGIN);
        model.addAttribute(new UsersEntity());
        String res = Pages.LOGIN;
        return res;
    }

    /**
     * 登录界面提交
     *
     * @param usersEntiy
     * @param errors
     * @param model
     * @return
     */
    @RequestMapping(value = {"/" + Pages.LOGIN}, method = RequestMethod.POST)
    public String loginPost(
            @NotNull @Valid UsersEntity usersEntiy,
            Errors errors,
            RedirectAttributes model) {
        OUT.prt("request", Pages.LOGIN + "," + Pages.INFO);
        OUT.prt("userEntity", usersEntiy);

        String res;
        if (errors.hasErrors()) {
            res = Pages.LOGIN;
            return res;
        }

        if (model.containsAttribute("usersEntity")) {
            res = Pages.INFO;
            return res;
        }
        UsersEntity usersEntityDB = usersRepository.findOne(usersEntiy.getId());

        if (null == usersEntityDB) {
            model.addAttribute("message", "wrong use id or password");
            res = Pages.LOGIN;
            return res;
        }
        if (!usersEntiy.getPassword().equals(usersEntityDB.getPassword())) {
            model.addAttribute("message", "password error");
            res = Pages.LOGIN;
            return res;
        }

//        int cont = usersRepository.count().intValue();
        model.addFlashAttribute("usersEntity from db", usersEntityDB);
        res = "redirect:/" + getRoleType(usersEntityDB.getRoleId()) + "/" + Pages.MAIN_PAGE;
        return res;
    }

    /**
     * 显示用户信息界面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/" + Pages.INFO, method = RequestMethod.GET)
    public String showUsersInfo(
            Model model) {
        OUT.prt("request", Pages.INFO);
        String res;
        res = Pages.INFO;
        return res;
    }

    /**
     * 注册界面
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.REGISTER, method = RequestMethod.GET)
    public String register() {
        OUT.prt("request", Pages.REGISTER);
        String res = Pages.REGISTER;
        return res;
    }

    /**
     * 注册界面提交
     *
     * @param usersEntity
     * @param errors
     * @return
     */
    @RequestMapping(value = "/" + Pages.REGISTER, method = RequestMethod.POST)
    public String processRegistration(
            @NotNull @Valid UsersEntity usersEntity,
            Errors errors) {
        OUT.prt("request", Pages.REGISTER);
        OUT.prt("register user", usersEntity);
        String res;
        if (errors.hasErrors()) {
            res = Pages.REGISTER;
            return res;
        }
//        // TODO: 2017/4/12  save user profile to db
//        usersRepository.save(usersEntity);
        usersEntity.setRoleId(Constant.STUDENT);

        res = "redirect:/" + Pages.INFO;
        return res;
    }

    /**
     * 忘记密码界面
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.FORGET_PASSWORD, method = RequestMethod.GET)
    public String forgetPassword() {
        OUT.prt("request", Pages.FORGET_PASSWORD);
        String res = Pages.FORGET_PASSWORD;
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

    /**
     * 修改密码请求
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.MODIFY_PASSWORD, method = RequestMethod.POST)
    public String modifyPasswordPost(
            @NotNull @Valid ModifyPasswordDTO dto,
            Errors errors,
            Principal principal) {
        OUT.prt("post", Pages.MODIFY_PASSWORD);
        String res = Pages.MODIFY_PASSWORD;
        if (errors.hasErrors()) {
            return res;
        }
        if (!dto.getPassword().equals(dto.getRepPassword())) {
            return res;
        }
        if (dto.getOldPassword().equals(dto.getPassword())) {
            return res;
        }
        UsersEntity usersEntity = usersRepository.findOne(principal.getName());
        if (usersEntity.getPassword().equals(dto.getOldPassword())) {
            usersEntity.setPassword(dto.getPassword());
            usersRepository.save(usersEntity);
            res = Pages.SUCCESS;
        }
        return res;
    }

    /**
     * 修改用户信息
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.MODIFY_USER_INFO, method = RequestMethod.GET)
    public String modifyUserInfo(
            Model model,
            Principal principal) {
        OUT.prt("request", Pages.MODIFY_USER_INFO);

        UsersEntity usersEntity = usersRepository.findOne(principal.getName());
        model.addAttribute("entity", usersEntity);
        String res = Pages.MODIFY_USER_INFO;
        return res;
    }

    /**
     * 修改用户信息请求
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.MODIFY_USER_INFO, method = RequestMethod.POST)
    public String modifyUserInfoPost(
            ModifyUserInfoDTO modifyUserInfoDTO,
            Errors errors,
            Principal principal) {
        OUT.prt("request", Pages.MODIFY_USER_INFO);

        String res = Pages.MODIFY_USER_INFO;
        if (errors.hasErrors()) {
            return res;
        }
        UsersEntity usersEntity = usersRepository.findOne(principal.getName());
        OUT.prt("usersEntity", usersEntity);
        BeanUtils.copyProperties(modifyUserInfoDTO, usersEntity);
        usersRepository.save(usersEntity);
        OUT.prt("usersEntity", usersEntity);
        res = Pages.SUCCESS;
        return res;
    }

    /**
     * 获取用户类型
     *
     * @param roleId
     * @return
     */
    private String getRoleType(int roleId) {
        String res;
        if (roleId == Constant.ADMIN) {
            res = Pages.ADMIN;
        } else if (roleId == Constant.TEACHER) {
            res = Pages.TEACHER;
        } else {
            res = Pages.STUDENT;
        }
        return res;
    }

}
