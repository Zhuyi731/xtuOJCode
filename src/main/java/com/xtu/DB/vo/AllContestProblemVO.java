package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/27.
 */
@Data
public class AllContestProblemVO {
    private List<AllContestProblemEntityVO> entityList;
    private int total;
    private int start;
}
