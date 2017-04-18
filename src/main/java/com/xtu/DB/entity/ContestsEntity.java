package com.xtu.DB.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ContestsEntity {
    private int contestId;
    private String title;
    private Timestamp startTime;
    private Timestamp frozenStartTime;
    private Timestamp endTime;
    private byte type;
    private byte online;
    private byte status;
    private Timestamp registerStartTime;
    private Timestamp registerEndTime;
    private String description;
    private String anouncement;
    private int owner;
    private Timestamp createTime;
    private Timestamp lastUpdateTime;
}
