package com.xtu.DB.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ProblemSetsEntity {
    private int problemSetId;
    private int owner;
    private String title;
    private byte type;
    private String password;
    private String description;
    private Timestamp createTime;
    private Timestamp lastUpdateTime;
}
