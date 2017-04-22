package com.xtu.DB.vo;

import lombok.Data;

/**
 * Created by Ilovezilian on 2017/4/21.
 */
@Data
public class ProblemsEntityVO {
    /**
     * 题目ID
     */
    private int problemId;
    /**
     * 题目名称
     */
    private String title;
    /**
     * AC的题目数量
     */
    private int acProblemsNum;
    /**
     * 提交的题目数量
     */
    private int submitProblemsNum;
    /**
     * 通过率
     */
    private int ratio;
}
