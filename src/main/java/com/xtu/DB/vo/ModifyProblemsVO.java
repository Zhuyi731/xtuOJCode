package com.xtu.DB.vo;

import lombok.Data;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ModifyProblemsVO {
    private List<ModifyProblemsEntityVO> entityList;
    private Long total;
    private int start;
}
