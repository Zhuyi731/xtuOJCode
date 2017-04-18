package com.xtu.DB.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class JudgeEntityPK implements Serializable {
    private int runsId;
    private int problemId;
    private short no;
}
