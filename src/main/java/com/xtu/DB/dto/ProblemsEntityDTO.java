package com.xtu.DB.dto;

import com.sun.istack.internal.NotNull;
import com.xtu.DB.entity.ProblemsEntity;
import lombok.Data;

/**
 * 题目表
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ProblemsEntityDTO extends ProblemsEntity{
    @NotNull
    private String problemDes;
    @NotNull
    private String inputDes;
    @NotNull
    private String outputDes;
    private String sampleInput;
    private String sampleOutput;

}
