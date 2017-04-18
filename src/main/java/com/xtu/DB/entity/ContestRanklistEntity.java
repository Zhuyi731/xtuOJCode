package com.xtu.DB.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ContestRanklistEntity {
    private int contestId;
    private int userId;
    private String slotInformation;
    private Timestamp registerTime;
    private Timestamp lastLoginTime;
    private String lastLoginIp;
    private short totScore;
    private byte acProblemsNum;
    private int penalty;
}
