package com.xtu.DB.vo;

import lombok.Data;

/**
 * Created by Ilovezilian on 2017/4/21.
 */
@Data
public class TotalProblemsVO {
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
    private int acCount;
    /**
     * 提交的题目数量
     */
    private int submitCount;
}
