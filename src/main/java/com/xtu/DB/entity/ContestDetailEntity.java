package com.xtu.DB.entity;

import lombok.Data;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ContestDetailEntity {
    private int userId;
    private int contestId;
    private byte no;
    private int acceptedTime;
    private short penaltyTimes;
    private short score;
    private byte firstBlood;
    private byte frozenSubmitTimes;
    private byte balloon;
}
