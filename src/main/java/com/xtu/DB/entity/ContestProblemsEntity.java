package com.xtu.DB.entity;

import lombok.Data;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ContestProblemsEntity {
    private int contestId;
    private byte no;
    private int problemId;
    private short score;
    private String balloonColor;
}
