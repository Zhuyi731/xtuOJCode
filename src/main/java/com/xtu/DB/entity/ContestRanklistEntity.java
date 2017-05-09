package com.xtu.DB.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * 比赛榜单表实体对象
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ContestRanklistEntity {
    /**
     * 比赛ID
     */
    private int contestId;
    /**
     * 用户ID
     */
    private int userId;
    /**
     * 座位信息，线下比赛not null
     */
    private String slotInformation;
    /**
     * 注册时间
     */
    private Timestamp registerTime;
    /**
     * 最后登录时间
     */
    private Timestamp lastLoginTime;
    /**
     * 最后登录IP
     */
    private String lastLoginIp;
    /**
     * 总得分
     */
    private short totScore;
    /**
     * 总AC题数
     */
    private byte acProblemsNum;
    /**
     * 总罚时
     */
    private int penalty;
}
