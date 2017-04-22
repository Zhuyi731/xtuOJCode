package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/22.
 */
@Data
public class StatusVO {
    private List<StatusEntityVO> entityList;
    /**
     * 总数
     */
    private long total;
    private int start;
}
