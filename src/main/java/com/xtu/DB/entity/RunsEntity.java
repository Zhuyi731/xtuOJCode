package com.xtu.DB.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class RunsEntity {
    private int runId;
    private int userId;
    private int problemId;
    private Integer contestId;
    private Byte no;
    private String code;
    private String language;
    private int runTime;
    private int runMemory;
    private byte resultCode;
    private String resultMsg;
    private Timestamp submitTime;
    private byte open;
}
