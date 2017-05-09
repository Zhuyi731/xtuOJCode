package com.xtu.DB.entity;

import lombok.Data;

/**
 * 比赛过题情况表实体对象
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ContestDetailEntity {
    /**
     * 用户ID
     */
    private int userId;
    /**
     * 比赛ID
     */
    private int contestId;
    /**
     * 比赛题目序号
     */
    private byte no;
    /**
     * 最早AC时间，为NULL表示没有AC
     */
    private int acceptedTime;
    /**
     * 罚时次数
     */
    private short penaltyTimes;
    /**
     * 得分
     */
    private short score;
    /**
     * FB标志，0否1是
     */
    private byte firstBlood;
    /**
     * 封板阶段提交次数
     */
    private byte frozenSubmitTimes;
    /**
     * 气球发放标志(0否1是）
     */
    private byte balloon;
}
