package com.xtu.DB.entity;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import java.sql.Timestamp;

/**
 * 题目集表实体对象
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ProblemSetsEntity {
    /**
     * 题目集ID
     */
    @Min(1)
    private int problemSetId;
    /**
     * 建立者
     */
    @Min(0)
    private int owner;
    /**
     * 题目集名称
     */
    @Size(max = 100)
    private String title;
    /**
     * 题目集类型（0私有1密码可见2公开）
     */
    @Min(0)
    @Max(2)
    private byte type = 0;
    /**
     * 类型为1时为not null
     */
    @Size(min = 6, max = 20)
    private String password;
    /**
     * 题目集描述
     */
    @Size(max = 4000)
    private String description;
    /**
     * 建立时间
     */
    private Timestamp createTime;
    /**
     * 最后更新时间
     */
    private Timestamp lastUpdateTime;
}
