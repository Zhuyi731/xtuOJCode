package com.xtu.DB.entity;

import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

/**
 * 题目集题目列表
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ProblemSetDetailEntity {
    /**
     * 题目集ID
     */
    @Min(0)
    private int problemSetId;
    /**
     * 题目序号
     */
    @Min(0)
    private short no;
    /**
     * 题目ID
     */
    @Min(0)
    private int problemId;
    /**
     * 备注
     */
    @Size(max = 500)
    private String notice;
}
