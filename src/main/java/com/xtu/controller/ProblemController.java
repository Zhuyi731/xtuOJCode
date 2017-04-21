package com.xtu.controller;

import com.xtu.DB.ProblemsRepository;
import com.xtu.DB.TestdatasRepository;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ProblemsEntity;
import com.xtu.DB.entity.TestdatasEntity;
import com.xtu.DB.vo.TotalProblemsVO;
import com.xtu.constant.Pages;
import com.xtu.tools.OUT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
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

    @RequestMapping(value = "/" + Pages.PROBLEMS_INDEX, method = RequestMethod.GET)
    public String showTotalProblems(
            ProblemsDTO problemsDTO,
            Model model) {
        OUT.prt("request", Pages.PROBLEMS_INDEX);
        // TODO: 2017/4/17 select problems from db 
        // TODO: 2017/4/17 add pagination
        List<ProblemsEntity> entityList = problemsRepository.queryPage(problemsDTO);
        List<TotalProblemsVO> voList = new ArrayList<>();
        for(ProblemsEntity entity: entityList){
            TotalProblemsVO vo = new TotalProblemsVO();
            vo.setProblemId(entity.getProblemId());
            vo.setTitle(entity.getTitle());
            vo.setAcProblemsNum(100);
            vo.setSubmitProblemsNum(101);
            vo.setRatio(100*100/101);
            voList.add(vo);
        }
        model.addAttribute("entityList", voList);
        OUT.prt("entitylist", voList);

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

    /**
     * 添加题目
     *
     * @param uploadFile
     * @param problemsEntity
     * @param errors
     * @param model
     * @return
     */
    @Transactional
    @RequestMapping(value = "/" + Pages.ADD_PROBLEM, method = RequestMethod.POST)
    public String addProblemPost(
            @RequestPart("uploadFile") @NotNull MultipartFile uploadFile,
            @NotNull @Valid ProblemsEntity problemsEntity,
            Errors errors,
            Model model) {
        OUT.prt("post", Pages.ADD_PROBLEM);
        if (errors.hasErrors()) {
            String res = Pages.ERROR;
            return res;
        }

        String context = problemsEntity.getInputDes() + "{{{(>_<)}}}" +
                problemsEntity.getInputDes() + "{{{(>_<)}}}" +
                problemsEntity.getInputDes() + "{{{(>_<)}}}" +
                problemsEntity.getInputDes() + "{{{(>_<)}}}" +
                problemsEntity.getInputDes();
        problemsEntity.setContext(context);
        problemsRepository.save(problemsEntity);
        TestdatasEntity testdatasEntity = new TestdatasEntity();

        testdatasEntity.setProblemId(problemsEntity.getProblemId());
        testdatasEntity.setOwner(problemsEntity.getOwner());
        addTestdatas(uploadFile, testdatasEntity);

        String res = Pages.PROBLEM + "/" + Pages.ADD_PROBLEM;
        return res;
    }

    /**
     * 修改题目
     *
     * @param id
     * @param uploadFile
     * @param problemsEntity
     * @param errors
     * @param model
     * @return
     */
    @Transactional
    @RequestMapping(value = "/" + Pages.MODIFY_PROBLEM + "/{id}", method = RequestMethod.POST)
    public String modifyProblemPost(
            @PathVariable("id") int id,
            @RequestPart("uploadFile") MultipartFile uploadFile,
            @NotNull @Valid ProblemsEntity problemsEntity,
            Errors errors,
            RedirectAttributes model) {
        OUT.prt("post", Pages.ADD_PROBLEM);
        if (errors.hasErrors()) {
            String res = Pages.ERROR;
            return res;
        }

        String context = problemsEntity.getProblemDes() + "{{{(>_<)}}}" +
                problemsEntity.getInputDes() + "{{{(>_<)}}}" +
                problemsEntity.getOutputDes() + "{{{(>_<)}}}" +
                problemsEntity.getSampleInput() + "{{{(>_<)}}}" +
                problemsEntity.getSampleOutput();
        problemsEntity.setContext(context);
        problemsRepository.save(problemsEntity);
        if (null != uploadFile || !uploadFile.isEmpty()) {
            TestdatasEntity testdatasEntity = new TestdatasEntity();

            testdatasEntity.setProblemId(problemsEntity.getProblemId());
            testdatasEntity.setOwner(problemsEntity.getOwner());
            addTestdatas(uploadFile, testdatasEntity);
        }

        ProblemsEntity entity = problemsRepository.findOne(problemsEntity.getProblemId());
        model.addFlashAttribute("entity", entity);
        String res = "redirect:/" + Pages.PROBLEM + "/" + Pages.PROBLEM_DETAIL + "/{id}";
        return res;
    }

    /**
     * 将上传的zip解压并且添加到testdatas数据库里面
     *
     * @param uploadFile
     * @param testdatasEntity
     */
    private void addTestdatas(
            @RequestPart("uploadFile") MultipartFile uploadFile,
            TestdatasEntity testdatasEntity) {
        try (InputStream is = uploadFile.getInputStream();
             ZipInputStream zis = new ZipInputStream(is)) {
            int size = 0;
            short order = 1;
            boolean mark = false;
            for (ZipEntry ze = zis.getNextEntry(); null != ze; ze = zis.getNextEntry(), mark = !mark) {
                OUT.prt("zip entry name", ze.getName());
                if (ze.isDirectory()) {
                    continue;
                }
                size = (int) ze.getSize();
                byte[] tmpByte = new byte[size];
                OUT.prt("size", size);
                if (size < 0) {
                    continue;
                }
                // TODO: 2017/4/20 add bufferReader
                zis.read(tmpByte, 0, size);
                OUT.prt(ze.getName(), new String(tmpByte));
                if (mark) {
                    testdatasEntity.setOutput(tmpByte);
                    testdatasEntity.setNo(order++);
                    testdatasRepository.save(testdatasEntity);
                } else {
                    testdatasEntity.setInput(tmpByte);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = {"/" + Pages.PROBLEM_DETAIL + "/{id}"}, method = RequestMethod.GET)
    public String showProblemDetails(
            @PathVariable("id") int id,
            Model model) {
        OUT.prt("request", Pages.PROBLEM_DETAIL);

        ProblemsEntity entity = problemsRepository.findOne(id);
        String[] contexts = entity.getContext().split("\\{\\{\\{\\(>_<\\)\\}\\}\\}");
        entity.setProblemDes(contexts[0]);
        entity.setInputDes(contexts[1]);
        entity.setOutputDes(contexts[2]);
        entity.setSampleInput(contexts[3]);
        entity.setSampleOutput(contexts[4]);
        model.addAttribute("entity", entity);
        OUT.prt("entity", entity);
        String res = Pages.PROBLEM + "/" + Pages.PROBLEM_DETAIL;
        return res;
    }

    @RequestMapping(value = {"/" + Pages.MODIFY_PROBLEM + "/{id}"}, method = RequestMethod.GET)
    public String showModifyProblem(
            @PathVariable("id") int id,
            Model model) {
        OUT.prt("request", Pages.MODIFY_PROBLEM);

        ProblemsEntity entity = problemsRepository.findOne(id);
        String[] contexts = entity.getContext().split("\\{\\{\\{\\(>_<\\)\\}\\}\\}");
        entity.setProblemDes(contexts[0]);
        entity.setInputDes(contexts[1]);
        entity.setOutputDes(contexts[2]);
        entity.setSampleInput(contexts[3]);
        entity.setSampleOutput(contexts[4]);
        model.addAttribute("entity", entity);
        OUT.prt("entity", entity);
        String res = Pages.PROBLEM + "/" + Pages.MODIFY_PROBLEM;
        return res;
    }

    @RequestMapping(value = "/" + Pages.PROBLEM_MANAGER, method = RequestMethod.GET)
    public String problemManage(
            ProblemsDTO problemsDTO,
            Model model) {
        OUT.prt("request", Pages.PROBLEM_MANAGER);
        // TODO: 2017/4/17 select problems from db
        // TODO: 2017/4/17 add pagination
        List<ProblemsEntity> entityList = problemsRepository.queryPage(problemsDTO);
        model.addAttribute("entityList", entityList);
        String res = Pages.PROBLEM + "/" + Pages.PROBLEM_MANAGER;
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
        String res = Pages.PROBLEM + "/" + Pages.PROBLEM_MANAGER;
        return res;
    }

    @RequestMapping(value = "/" + Pages.SUBMIT + "/{id}", method = RequestMethod.GET)
    public String submit(
            @PathVariable("id") @NotNull int id,
            Model model) {
        OUT.prt("requst", Pages.SUBMIT);
        model.addAttribute("id", id);
        // TODO: 2017/4/17 select from DB
        String res = Pages.PROBLEM + "/" + Pages.SUBMIT;
        return res;
    }
}
