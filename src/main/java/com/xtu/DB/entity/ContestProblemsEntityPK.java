package com.xtu.DB.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ContestProblemsEntityPK implements Serializable {
    private int contestId;
    private byte no;
}