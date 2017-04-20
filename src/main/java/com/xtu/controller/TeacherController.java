package com.xtu.controller;

import com.sun.istack.internal.NotNull;
import com.xtu.DB.ProblemsRepository;
import com.xtu.DB.TestdatasRepository;
import com.xtu.DB.entity.ProblemsEntity;
import com.xtu.DB.entity.TestdatasEntity;
import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Controller
@RequestMapping(value = "/" + Pages.TEACHER)
public class TeacherController {

    @Autowired
    ProblemsRepository problemsRepository;
    @Autowired
    TestdatasRepository testdatasRepository;

    @RequestMapping(value = "/" + Pages.MAIN_PAGE, method = RequestMethod.GET)
    public String showMain() {
        OUT.prt("request", Pages.MAIN_PAGE);
        return Pages.TEACHER + "/" + Pages.MAIN_PAGE;
    }

    @RequestMapping(value = "/" + Pages.NAVIGATION, method = RequestMethod.GET)
    public String showNavigation() {
        OUT.prt("request", Pages.NAVIGATION);
        String res = Pages.TEACHER + "/" + Pages.NAVIGATION;
        return res;
    }

    @RequestMapping(value = "/" + Pages.MENU, method = RequestMethod.GET)
    public String showMenu() {
        OUT.prt("request", Pages.MENU);
        String res = Pages.TEACHER + "/" + Pages.MENU;
        return res;
    }

    @RequestMapping(value = "/" + Pages.MODIFY_PASSWORD, method = RequestMethod.GET)
    public String modifyPassword() {
        OUT.prt("request", Pages.MODIFY_PASSWORD);
        String res = Pages.MODIFY_PASSWORD;
        return res;
    }

    @RequestMapping(value = "/" + Pages.TEACHER_INFO, method = RequestMethod.GET)
    public String modifyInfo() {
        OUT.prt("request", Pages.TEACHER_INFO);
        String res = Pages.TEACHER + "/" + Pages.TEACHER_INFO;
        return res;
    }

    @RequestMapping(value = "/" + Pages.SHOW_STUDENT_INFO, method = RequestMethod.GET)
    public String showStudent() {
        OUT.prt("request", Pages.SHOW_STUDENT_INFO);
        String res = Pages.TEACHER + "/" + Pages.SHOW_STUDENT_INFO;
        return res;
    }

    @RequestMapping(value = "/" + Pages.ADD_STUDENT, method = RequestMethod.GET)
    public String addStudent() {
        OUT.prt("request", Pages.ADD_STUDENT);
        String res = Pages.TEACHER + "/" + Pages.ADD_STUDENT;
        return res;
    }
    // TODO: 2017/4/18 add a post method of adding student

    @RequestMapping(value = "/" + Pages.ADD_PROBLEM, method = RequestMethod.GET)
    public String addProblem() {
        OUT.prt("request", Pages.ADD_PROBLEM);
        String res = Pages.TEACHER + "/" + Pages.ADD_PROBLEM;
        return res;
    }

    @RequestMapping(value = "/" + Pages.ADD_PROBLEM, method = RequestMethod.POST)
    public String addProblemPost(
            @NotNull @Valid ProblemsEntity problemsEntity,
            Error error,
            Model model) {
        OUT.prt("post", Pages.ADD_PROBLEM);

        // TODO: 2017/4/20 ajust
        problemsRepository.save(problemsEntity);
        String res = Pages.TEACHER + "/" + Pages.ADD_PROBLEM;
        return res;
    }

    @RequestMapping(value = "/" + Pages.PROBLEM_MANAGER, method = RequestMethod.GET)
    public String managerProblem() {
        OUT.prt("request", Pages.PROBLEM_MANAGER);
        String res = Pages.TEACHER + "/" + Pages.PROBLEM_MANAGER;
        return res;
    }

    @RequestMapping(value = "/" + Pages.PROBLEM_MANAGER, method = RequestMethod.POST)
    public String managerProblemPost(
            @NotNull @Valid TestdatasEntity testdatasEntity,
            Error error,
            @RequestPart("uploadFile") @NotNull MultipartFile uploadFile,
            Model model) {
        OUT.prt("request", Pages.PROBLEM_MANAGER);
        int size = 0;
        try (InputStream is = uploadFile.getInputStream();
             ZipInputStream zis = new ZipInputStream(is)) {
            boolean mark = false;
            for (ZipEntry ze = zis.getNextEntry(); null != ze;
                 ze = zis.getNextEntry(), mark ^= mark) {
                OUT.prt("uploadFile", ze.getName());
                if (ze.isDirectory()) {
                    continue;
                }
                size = (int) ze.getSize();
                byte[] tmpByte = new byte[size];
                OUT.prt("size", size);
                if (size < 0) {
                    continue;
                }
                zis.read(tmpByte, 0, size);
                // TODO: 2017/4/20 add bufferReader
                OUT.prt("content", new String(tmpByte));
                if (mark) {
                    testdatasEntity.setOutput(tmpByte);
                    testdatasRepository.save(testdatasEntity);
                } else {
                    testdatasEntity.setInput(tmpByte);
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String res = Pages.TEACHER + "/" + Pages.PROBLEM_MANAGER;
        return res;
    }

    @RequestMapping(value = "/" + Pages.SHOW_TEST_PAGE, method = RequestMethod.GET)
    public String showTest() {
        String res = Pages.TEACHER + "/" + Pages.SHOW_TEST_PAGE;
        return res;
    }
}
