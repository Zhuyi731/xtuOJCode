package com.xtu.DB.vo;

import lombok.Data;

import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/27.
 */
@Data
public class AllContestEntityVO {
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
     * 比赛建立者
     */
    private int owner;
    /**
     * ID
     */
    private String id;
    /**
     * 姓名
     */
    private String name;
}
