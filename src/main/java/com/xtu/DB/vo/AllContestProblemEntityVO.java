package com.xtu.DB.vo;

import lombok.Data;

/**
 * 比赛、作业中单项题目信息视图
 * Created by Ilovezilian on 2017/4/27.
 */
@Data
public class AllContestProblemEntityVO {
    /**
     * 比赛ID
     */
    private int contestId;
    /**
     * 比赛题目序号
     */
    private byte no;
    /**
     * 题目ID
     */
    private int problemId;
    /**
     * 题目名称
     */
    private String title;
    /**
     * 题目分值
     */
    private short score;
    /**
     * 气球颜色，格式为22FF33
     */
    private String balloonColor;
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
