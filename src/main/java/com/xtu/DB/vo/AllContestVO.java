package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/27.
 */
@Data
public class AllContestVO {
    private List<AllContestEntityVO> entityList;
    private int total;
    private int start;
}
