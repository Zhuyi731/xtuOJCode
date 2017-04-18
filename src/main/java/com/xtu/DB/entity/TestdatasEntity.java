package com.xtu.DB.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class TestdatasEntity {
    private int problemId;
    private short no;
    private byte score;
    private byte[] input;
    private byte[] output;
    private Timestamp createTime;
    private Timestamp lastUpdateTime;
    private int owner;
}
