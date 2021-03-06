package com.xtu.DB.entity;

import lombok.Data;

/**
 * 评测表实体对象
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class JudgeEntity {
    private int runsId;
    private int problemId;
    private short no;
    private int runTime;
    private int runMemory;
    private byte resultCode;
}
