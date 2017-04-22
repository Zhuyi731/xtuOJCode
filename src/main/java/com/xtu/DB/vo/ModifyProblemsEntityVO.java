package com.xtu.DB.vo;

import lombok.Data;

import java.sql.Timestamp;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ModifyProblemsEntityVO {
    /**
     * 题目ID
     */
    private int problemId;
    /**
     * 题目名称
     */
    private String title;
    /**
     * 判题验证器ID，0为默认验证器
     */
    private short validatorId;
    /**
     * 时限ms
     */
    private short timeLimit;
    /**
     * 存限MB
     */
    private short memoryLimit;
    /**
     * 作者
     */
    private String author;
    /**
     * 来源
     */
    private String source;
    /**
     * 题目上传人
     */
    private int owner;
    /**
     * 题目内容
     */
    private String context;
    /**
     * 建立时间
     */
    private Timestamp createTime;
    /**
     * 最后更新时间
     */
    private Timestamp lastUpdateTime;
    /**
     * 总AC题数
     */
    private int acProblemsNum;
    /**
     * 提交的题目数量
     */
    private int submitProblemsNum;
    /**
     * 通过率
     */
    private int ratio;
}
