package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/22.
 */
@Data
public class RankVO {
    private List<RankEntityVO> entityList;
    private long total;
    private int start;
}
