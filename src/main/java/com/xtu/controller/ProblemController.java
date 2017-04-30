package com.xtu.controller;

import com.xtu.DB.ProblemsRepository;
import com.xtu.DB.RunsRepository;
import com.xtu.DB.TestdatasRepository;
import com.xtu.DB.UsersRepository;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.dto.ProblemsMangerDTO;
import com.xtu.DB.dto.SubmitContestDTO;
import com.xtu.DB.entity.ProblemsEntity;
import com.xtu.DB.entity.TestdatasEntity;
import com.xtu.DB.entity.UsersEntity;
import com.xtu.DB.vo.ModifyProblemsVO;
import com.xtu.DB.vo.ProblemsEntityVO;
import com.xtu.DB.vo.ProblemsVO;
import com.xtu.constant.Constant;
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
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * 题目控制器
 * Created by Ilovezilian on 2017/4/17.
 */
@Controller
@RequestMapping(value = "/" + Pages.PROBLEM)
public class ProblemController {
    @Autowired
    UsersRepository usersRepository;
    @Autowired
    ProblemsRepository problemsRepository;
    @Autowired
    TestdatasRepository testdatasRepository;
    @Autowired
    RunsRepository runsRepository;

    /**
     * 显示所有题目
     *
     * @param start
     * @param problemsDTO
     * @param model
     * @return
     */
    @RequestMapping(value = "/" + Pages.PROBLEMS_INDEX + "/{start}")
    public String showTotalProblems(
            @PathVariable("start") int start,
            ProblemsDTO problemsDTO,
            Model model) {
        OUT.prt("request", Pages.PROBLEMS_INDEX);
        OUT.prt("problemsDTO", problemsDTO);
        ProblemsVO vo = problemsRepository.queryPage(start, problemsDTO);
        model.addAttribute("vo", vo);
        OUT.prt("vo", vo);

        String res = Pages.PROBLEM + "/" + Pages.PROBLEMS_INDEX;
        return res;
    }

    /**
     * 添加题目界面
     *
     * @return
     */
    @RequestMapping(value = "/" + Pages.ADD_PROBLEM, method = RequestMethod.GET)
    public String AddProblem() {
        OUT.prt("request", Pages.ADD_PROBLEM);
        String res = Pages.PROBLEM + "/" + Pages.ADD_PROBLEM;
        return res;
    }

    /**
     * 添加题目请求
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
            Model model,
            Principal principal) {
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

        UsersEntity usersEntity = usersRepository.findOne(principal.getName());
        problemsEntity.setOwner(usersEntity.getUserId());
        problemsEntity.setAuthor(principal.getName());
        problemsRepository.save(problemsEntity);
        TestdatasEntity testdatasEntity = new TestdatasEntity();

        testdatasEntity.setProblemId(problemsEntity.getProblemId());
        testdatasEntity.setOwner(problemsEntity.getOwner());
        addTestdatas(uploadFile, testdatasEntity);

        String res = "redirect:/" + Pages.PROBLEM + "/" + Pages.PROBLEM_MANAGER;
        return res;
    }

    /**
     * 修改题目请求
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
            RedirectAttributes model,
            Principal principal) {
        OUT.prt("post", Pages.ADD_PROBLEM);
        OUT.prt("problemsEntity", problemsEntity);
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

        UsersEntity usersEntity = usersRepository.findOne(principal.getName());
        problemsEntity.setOwner(usersEntity.getUserId());
        problemsEntity.setAuthor(principal.getName());
        problemsRepository.save(problemsEntity);
        OUT.prt("problemsEntity", problemsEntity);
        if (null != uploadFile || !uploadFile.isEmpty()) {
            TestdatasEntity testdatasEntity = new TestdatasEntity();

            testdatasEntity.setProblemId(problemsEntity.getProblemId());
            testdatasEntity.setOwner(problemsEntity.getOwner());
            addTestdatas(uploadFile, testdatasEntity);
        }

        ProblemsDTO dto = new ProblemsDTO();
        dto.setProblemId(problemsEntity.getProblemId());
        ProblemsEntity entity = problemsRepository.findOne(dto);
        model.addFlashAttribute("entity", entity);
        String res = "redirect:/" + Pages.PROBLEM + "/" + Pages.PROBLEM_MANAGER;
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

    /**
     * 显示题目详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = {"/" + Pages.PROBLEM_DETAIL + "/{id}"}, method = RequestMethod.GET)
    public String showProblemDetails(
            @PathVariable("id") int id,
            Model model) {
        OUT.prt("request", Pages.PROBLEM_DETAIL);

        ProblemsDTO dto = new ProblemsDTO();
        dto.setProblemId(id);
        dto.setTitle("^_^");
        ProblemsEntity entity = problemsRepository.findOne(dto);
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


    /**
     * 修改题目界面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = {"/" + Pages.MODIFY_PROBLEM + "/{id}"}, method = RequestMethod.GET)
    public String showModifyProblem(
            @PathVariable("id") int id,
            Model model) {
        OUT.prt("request", Pages.MODIFY_PROBLEM);

        ProblemsDTO dto = new ProblemsDTO();
        dto.setProblemId(id);
        dto.setTitle("^_^");
        ProblemsEntity entity = problemsRepository.findOne(dto);
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

    /**
     * 题目管理界面
     *
     * @param model
     * @param principal
     * @return
     */
    @RequestMapping(value = "/" + Pages.PROBLEM_MANAGER + "/{start}", method = RequestMethod.GET)
    public String problemManage(
            @PathVariable("start") @NotNull @Min(0) int start,
            Model model,
            Principal principal) {
        OUT.prt("request", Pages.PROBLEM_MANAGER);
        String id = principal.getName();
        OUT.prt("id", id);
        UsersEntity usersEntity = usersRepository.findOne(id);
        ProblemsMangerDTO problemsMangerDTO = new ProblemsMangerDTO();
        if (usersEntity.getRoleId() == Constant.TEACHER) {
            problemsMangerDTO.setOwner(usersEntity.getUserId());
        }

        ModifyProblemsVO vo = problemsRepository.queryModifyPage(start, problemsMangerDTO);
        model.addAttribute("vo", vo);
        OUT.prt("vo", vo);
        String res = Pages.PROBLEM + "/" + Pages.PROBLEM_MANAGER;
        return res;
    }

    /**
     * 题目管理请求
     *
     * @param start
     * @param problemsMangerDTO
     * @param model
     * @return
     */
    @RequestMapping(value = "/" + Pages.PROBLEM_MANAGER + "/{start}", method = RequestMethod.POST)
    public String managerProblemPost(
            @PathVariable("start") int start,
            @NotNull @Valid ProblemsMangerDTO problemsMangerDTO,
            Model model,
            Principal principal) {
        OUT.prt("request", Pages.PROBLEM_MANAGER);
        OUT.prt("problemsMangerDTO", problemsMangerDTO);
        String res = Pages.PROBLEM + "/" + Pages.PROBLEM_MANAGER;

        UsersEntity usersEntity = usersRepository.findOne(principal.getName());
        if (usersEntity.getRoleId() == Constant.ADMIN
                && null != problemsMangerDTO.getAuthor()
                && !"".equals(problemsMangerDTO.getAuthor())) {
            UsersEntity user = usersRepository.findOne(problemsMangerDTO.getAuthor());
            problemsMangerDTO.setOwner(user.getUserId());
        } else if (usersEntity.getRoleId() == Constant.TEACHER) {
            problemsMangerDTO.setOwner(usersEntity.getUserId());
        }

        ModifyProblemsVO vo = problemsRepository.queryModifyPage(start, problemsMangerDTO);
        model.addAttribute("vo", vo);

        return res;
    }

    /**
     * 提交代码界面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/" + Pages.SUBMIT + "/{id}", method = RequestMethod.GET)
    public String submit(
            @PathVariable("id") @NotNull int id,
            Model model) {
        OUT.prt("requst", Pages.SUBMIT);
        ProblemsEntityVO entity = new ProblemsEntityVO();
        entity.setProblemId(id);
        model.addAttribute("id", id);
        OUT.prt("entity", entity);
        String res = Pages.PROBLEM + "/" + Pages.SUBMIT;
        return res;
    }


    /**
     * 提交代码请求
     *
     * @param submitContestDTO
     * @param model
     * @param principal
     * @return
     */
    @RequestMapping(value = "/" + Pages.SUBMIT + "/{id}", method = RequestMethod.POST)
    public String submitPost(
            @NotNull @Valid SubmitContestDTO submitContestDTO,
            Model model,
            Principal principal) {
        OUT.prt("post", Pages.SUBMIT);
        OUT.prt("submitContestDTO", submitContestDTO);
        String id = principal.getName();
        submitContestDTO.setId(id);
        UsersEntity usersEntity = usersRepository.findOne(id);
        submitContestDTO.setUserId(usersEntity.getUserId());
        runsRepository.save(submitContestDTO);
        String res = "redirect:/" + Pages.STATUS;
        return res;
    }
}
