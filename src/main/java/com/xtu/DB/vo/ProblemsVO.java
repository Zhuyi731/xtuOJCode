package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/22.
 */
@Data
public class ProblemsVO {
    /**
     * ProblemsEntityVO列表
     */
    private List<ProblemsEntityVO> entityList;
    /**
     * 总数
     */
    private long total;
    /**
     * 页数
     */
    private int start;
}
