package com.xtu.DB.entity;

import lombok.Data;

import javax.validation.constraints.*;
import java.sql.Timestamp;

/**
 * 题目表
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ProblemsEntity {
    /**
     * 题目ID
     */
    @NotNull
    @Min(0)
    private int problemId;
    /**
     * 题目名称
     */
    @NotNull
    @Size(max = 50)
    private String title;
    /**
     * 题目状态（0不可见，1可见）
     */
    @Min(0)
    @Max(1)
    private byte status = 1;
    /**
     * 判题验证器ID，0为默认验证器
     */
    // TODO: 2017/4/18 ... 
//    @NotNul
    @Min(0)
    private short validatorId;
    /**
     * 时限ms
     */
    @Min(0)
    @NotNull
    private short timeLimit;
    /**
     * 存限MB
     */
    @Min(0)
    @NotNull
    private short memoryLimit;
    /**
     * 作者
     */
    @Size(max = 50)
    private String author;
    /**
     * 来源
     */
    @Size(max = 50)
    private String source;
    /**
     * 题目上传人
     */
    @Min(0)
    private int owner;
    /**
     * 题目内容
     */
    @NotNull
    private String context;
    /**
     * 建立时间
     */
    @Null
    private Timestamp createTime;
    /**
     * 最后更新时间
     */
    @Null
    private Timestamp lastUpdateTime;
}
