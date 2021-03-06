package com.xtu.controller;

import com.xtu.DB.UsersRepository;
import com.xtu.DB.dto.UsersDTO;
import com.xtu.DB.entity.UsersEntity;
import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

/**
 * 管理员相关页面控制器
 * Created by Ilovezilian on 2017/4/19.
 */
@Controller
@RequestMapping(value = "/" + Pages.ADMIN)
public class AdminController {
    @Autowired
    UsersRepository usersRepository;

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

    /**
     * 显示所有用户
     */
    @RequestMapping(value = {"/" + Pages.SHOW_USERS_PAGE, "/" + Pages.SHOW_USERS_PAGE + "/{start}"})
    public String showUsers(
            @PathVariable("start") int start,
            @Valid UsersDTO dto,
            Model model) {
        OUT.prt("request", Pages.SHOW_USERS_PAGE);
        OUT.prt("UsersDTO", dto);
        String res = "/" + Pages.ADMIN + "/" + Pages.SHOW_USERS_PAGE;
        List<UsersEntity> usersEntityList = usersRepository.queryList(start, dto);

        model.addAttribute("vo", usersEntityList);
        OUT.prt("vo", usersEntityList);
        return res;
    }

    /**
     * 添加用户
     */
    @RequestMapping(value = "/" + Pages.CREATE_NEW_USERS, method = RequestMethod.GET)
    public String createNewUsers() {
        String res = "/" + Pages.ADMIN + "/" + Pages.CREATE_NEW_USERS;
        return res;
    }

    /**
     * 添加用户
     * 单个用户占一行，单行内容的顺序为id,name,class,role，用一个'\'符号分开
     *
     * @param usersFile
     * @return
     */
    @RequestMapping(value = "/" + Pages.CREATE_NEW_USERS, method = RequestMethod.POST)
    @Transactional
    public String createNewUsersPost(
            @RequestPart("usersFile") MultipartFile usersFile) {
        try {
            addUsersFromFile(usersFile.getInputStream());
        } catch (IOException e) {
            OUT.prt("file", usersFile.getOriginalFilename() + "文件出错");
            e.printStackTrace();
        }
        String res = "redirect:/" + Pages.ADMIN + "/" + Pages.SHOW_USERS_PAGE + "/0";
        return res;
    }

    /**
     * 修改用户信息
     */
    @RequestMapping(value = "/" + Pages.MODIFY_USER_INFO, method = RequestMethod.POST)
    public String modifyUsers(
            UsersEntity usersEntity) {
        OUT.prt("post", "admin/modify users info page");
        OUT.prt("userEntity", usersEntity);
        usersRepository.save(usersEntity);
        String res = "/" + Pages.ADMIN + "/" + Pages.SHOW_USERS_PAGE + "/0";
        return res;
    }

    public String addUsersFromFile(InputStream inputStream) {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream,"UTF-8"))) {
            StringBuilder sb = new StringBuilder();
            String line = null;

            while ((line = reader.readLine()) != null) {
                UsersEntity usersEntity = new UsersEntity();
                String[] users = line.split("\\|");
                usersEntity.setId(users[0]);
                usersEntity.setPassword(users[0]);
                usersEntity.setName(users[1]);
                usersEntity.setClassId(users[2]);
                usersEntity.setRoleId(Integer.parseInt(users[3]));
                usersRepository.save(usersEntity);
                OUT.prt("add user", usersEntity);
            }
//            System.out.println(sb.toString());

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "";
    }
}
