package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/22.
 */
@Data
public class StatusVO {
    /**
     * 查询的实体
     */
    private List<StatusEntityVO> entityList;
    /**
     * 总数
     */
    private long total;
    /**
     * 页数
     */
    private int start;
}
