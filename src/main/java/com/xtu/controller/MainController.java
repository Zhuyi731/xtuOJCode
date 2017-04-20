package com.xtu.controller;

import com.sun.istack.internal.NotNull;
import com.xtu.DB.entity.UsersEntity;
import com.xtu.constant.Pages;
import com.xtu.tools.FileUtils;
import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * Created by Ilovezilian on 2017/4/13.
 */
@Controller
public class MainController {

    @RequestMapping(value = {"/", "/" + Pages.INDEX}, method = RequestMethod.GET)
    public String index() {
        OUT.prt("request:", Pages.INDEX);
        return Pages.INDEX;
    }


    @RequestMapping(value = "/" + Pages.NAVIGATION)
    public String showNavigation() {
        OUT.prt("request:", Pages.NAVIGATION);
        String res = Pages.NAVIGATION;
        return res;
    }

    @RequestMapping(value = "/" + Pages.RANK_LIST, method = RequestMethod.GET)
    public String showRankList() {
        OUT.prt("request", Pages.RANK_LIST);
        // TODO: 2017/4/17 add pagination
        String res = Pages.RANK_LIST;
        return res;
    }

    @RequestMapping(value = "/" + Pages.STATUS, method = RequestMethod.GET)
    public String showStatus(
            Model model) {
        OUT.prt("request", Pages.STATUS);
        // TODO: 2017/4/17 add filter condition
        // TODO: 2017/4/17 add pagination
        String res = Pages.STATUS;
        return res;
    }


    @RequestMapping(value = "/uploadFile", method = RequestMethod.GET)
    public String uploadsFiles(
            Model model) {
        OUT.prt("request:", "uploadFile");
        model.addAttribute("usersEntity", new UsersEntity());
        return "uploadFile";
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String uploadsFilesPost(
//            @RequestPart("picture") byte[] picture,
//            @RequestPart("picture") MultipartFile picture,
//            @RequestPart("picture") Part picture1,
            @RequestPart("zip") @NotNull MultipartFile zip,
            Error error,
            Model model) {
        OUT.prt("post:", "uploadFile");
        try {
            FileUtils.unzipFile(zip.getInputStream());
//            zip.transferTo(new File("D:/uploadstmp/" + (System.currentTimeMillis() / 100)+ zip.getOriginalFilename().substring(zip.getOriginalFilename().lastIndexOf("\\") + 1)));
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("usersEntity", new UsersEntity());
        return "uploadFile";
    }

    @RequestMapping(value = "/" + Pages.PROBLEM_MANAGER, method = RequestMethod.GET)
    public String managerProblem() {
        OUT.prt("request", Pages.PROBLEM_MANAGER);
        String res = Pages.TEACHER + "/" + Pages.PROBLEM_MANAGER;
        return res;
    }

    @RequestMapping(value = "/" + Pages.SHOW_TEST_PAGE, method = RequestMethod.GET)
    public String showTest() {
        String res = Pages.TEACHER + "/" + Pages.SHOW_TEST_PAGE;
        return res;
    }
}
