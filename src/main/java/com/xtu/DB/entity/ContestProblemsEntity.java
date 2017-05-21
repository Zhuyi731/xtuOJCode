package com.xtu.DB.entity;

import com.sun.istack.internal.NotNull;
import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

/**
 * 比赛题目集表实体对象
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ContestProblemsEntity {
    /**
     * 比赛ID
     */
    @NotNull
    @Min(0)
    private int contestId;
    /**
     * 比赛题目序号
     */
    @Min(0)
    @NotNull
    private byte no;
    /**
     * 题目ID
     */
    @NotNull
    @Min(0)
    private int problemId;
    /**
     * 题目分值
     */
    @NotNull
    @Min(0)
    private short score;
    /**
     * 气球颜色，格式为22FF33
     */
    @Size(min = 6, max = 6)
    private String balloonColor;
}
