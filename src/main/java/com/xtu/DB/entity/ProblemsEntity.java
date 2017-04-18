package com.xtu.DB.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ProblemsEntity {
    private int problemId;
    private String title;
    private byte status;
    private short validatorId;
    private short timeLimit;
    private short memoryLimit;
    private String author;
    private String source;
    private int owner;
    private String context;
    private Timestamp createTime;
    private Timestamp lastUpdateTime;
}
