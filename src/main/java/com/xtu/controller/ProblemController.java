package com.xtu.controller;

import com.xtu.DB.ProblemsRepository;
import com.xtu.DB.TestdatasRepository;
import com.xtu.DB.entity.ProblemsEntity;
import com.xtu.DB.entity.TestdatasEntity;
import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Created by Ilovezilian on 2017/4/17.
 */
@Controller
@RequestMapping(value = "/" + Pages.PROBLEM)
public class ProblemController {
    @Autowired
    ProblemsRepository problemsRepository;
    @Autowired
    TestdatasRepository testdatasRepository;

    @RequestMapping(method = RequestMethod.GET)
    public String showTotalProblems() {
        OUT.prt("request", Pages.PROBLEMS_INDEX);
        // TODO: 2017/4/17 select problems from db 
        // TODO: 2017/4/17 add pagination

        String res = Pages.PROBLEM + "/" + Pages.PROBLEMS_INDEX;
        return res;
    }

    @RequestMapping(value = "/" + Pages.ADD_PROBLEM, method = RequestMethod.GET)
    public String AddProblem() {
        OUT.prt("request", Pages.ADD_PROBLEM);
        // TODO: 2017/4/17 select problems from db
        // TODO: 2017/4/17 add pagination

        String res = Pages.PROBLEM + "/" + Pages.ADD_PROBLEM;
        return res;
    }

    @RequestMapping(value = "/" + Pages.ADD_PROBLEM, method = RequestMethod.POST)
    public String addProblemPost(
            @com.sun.istack.internal.NotNull @Valid ProblemsEntity problemsEntity,
            Error error,
            Model model) {
        OUT.prt("post", Pages.ADD_PROBLEM);

        // TODO: 2017/4/20 ajust
        problemsRepository.save(problemsEntity);
        String res = Pages.PROBLEM + "/" + Pages.ADD_PROBLEM;
        return res;
    }

    @RequestMapping(value = "/" + Pages.PROBLEM_DETAIL + "/{id}", method = RequestMethod.GET)
    public String showProblemDetails(
            @PathVariable("id") @Min(1) @NotNull int id,
            Model model) {
        OUT.prt("request", Pages.PROBLEM_DETAIL);
        OUT.prt("id", id);
        OUT.prt("model", model);
        model.addAttribute("id", id);

        // TODO: 2017/4/17 select from db
        String res = Pages.PROBLEM + "/" + Pages.PROBLEM_DETAIL;
        return res;
    }

    @RequestMapping(value = "/" + Pages.PROBLEM_MANAGER, method = RequestMethod.GET)
    public String problemManage() {
        OUT.prt("request", Pages.PROBLEM_MANAGER);
        // TODO: 2017/4/17 select problems from db
        // TODO: 2017/4/17 add pagination

        String res = Pages.PROBLEM + "/" + Pages.PROBLEM_MANAGER;
        return res;
    }

    @RequestMapping(value = "/" + Pages.PROBLEM_MANAGER, method = RequestMethod.POST)
    public String managerProblemPost(
            @com.sun.istack.internal.NotNull @Valid TestdatasEntity testdatasEntity,
            Error error,
            @RequestPart("uploadFile") @com.sun.istack.internal.NotNull MultipartFile uploadFile,
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
        String res = Pages.PROBLEM + "/" + Pages.PROBLEM_MANAGER;
        return res;
    }

    @RequestMapping(value = "/" + Pages.SUBMIT + "/{id}", method = RequestMethod.GET)
    public String submit(
            @PathVariable("id") @javax.validation.constraints.NotNull int id,
            Model model) {
        OUT.prt("requst", Pages.SUBMIT);
        model.addAttribute("id", id);
        // TODO: 2017/4/17 select from DB
        String res = Pages.PROBLEM + "/" + Pages.SUBMIT;
        return res;
    }
}
