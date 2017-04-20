package com.xtu.DB.entity;

import com.sun.istack.internal.NotNull;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class TestdatasEntity {
    /**
     * 题目ID
     */
    @NotNull
    @Min(0)
    private int problemId;
    /**
     * 测试数据序号
     */
    @NotNull
    @Min(0)
    private short no;
    /**
     * 分数
     */
    @Min(0)
    @Max(100)
    private byte score = 0;
    /**
     * 输入数据
     */
    private byte[] input;
    /**
     * 输出数据
     */
    private byte[] output;
    /**
     * 建立时间
     */
    private Timestamp createTime;
    /**
     * 最后更新时间
     */
    private Timestamp lastUpdateTime;
    /**
     * 上传者
     */
    @NotNull
    @Min(0)
    private int owner;
}
