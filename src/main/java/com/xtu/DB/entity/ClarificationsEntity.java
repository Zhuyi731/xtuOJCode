package com.xtu.DB.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * 比赛问答表实体对象
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ClarificationsEntity {
    private int clarId;
    private int contestId;
    private int owner;
    private String title;
    private String question;
    private Timestamp submitTime;
    private String answer;
    private Timestamp answerTime;
    private byte status;
}
