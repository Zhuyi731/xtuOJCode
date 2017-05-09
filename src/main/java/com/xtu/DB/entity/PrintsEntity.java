package com.xtu.DB.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * 打印表实体对象
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class PrintsEntity {
    private int contestId;
    private int userId;
    private short no;
    private String context;
    private Timestamp createTime;
    private Timestamp printTime;
    private byte status;
}
