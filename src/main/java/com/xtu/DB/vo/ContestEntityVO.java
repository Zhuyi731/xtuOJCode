package com.xtu.DB.vo;

import lombok.Data;

import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/27.
 */
@Data
public class ContestEntityVO {
    /**
     * 比赛ID
     */
    private int contestId;
    /**
     * 比赛名称
     */
    private String title;
    /**
     * 开始时间
     */
    private Timestamp startTime;
    /**
     * 封榜时间
     */
    private Timestamp frozenStartTime;
    /**
     * 结束时间
     */
    private Timestamp endTime;
    /**
     * 比赛类型（0公开；1可公开看榜，看题，非注册不可交题；2注册私有；3密码私有；4名单导入私有）
     */
    private byte type;
    /**
     * 线下表示（0线下1线上）
     */
    private byte online;
    /**
     * 比赛状态（0不可见，1可见）
     */
    private byte status;
    /**
     * 注册开始时间（类型为0,3,4时为NULL）
     */
    private Timestamp registerStartTime;
    /**
     * 注册结束时间（类型为0,3,4时为NULL）
     */
    private Timestamp registerEndTime;
    /**
     * 比赛描述日志
     */
    private String description;
    /**
     * 比赛公告
     */
    private String announcement;
    /**
     * 比赛建立者
     */
    private int owner;
    /**
     * 比赛建立时间
     */
    private Timestamp createTime;
    /**
     * 比赛最后一次更新时间
     */
    private Timestamp lastUpdateTime;
}
