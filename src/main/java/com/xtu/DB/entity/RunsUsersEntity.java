package com.xtu.DB.entity;


import lombok.Data;

import java.sql.Timestamp;

/**
 * 运行表、用户表组合实体对象
 * Created by Ilovezilian on 2017/4/12.
 */
@Data
public class RunsUsersEntity {
    /**
     * 用户ID
     */
    private int userId;
    /**
     * 角色id
     */
    private int roleId;
    /**
     * id
     */
    private String id;
    /**
     * 用户姓名
     */
    private String name;
    /**
     * 班级
     */
    private String classId;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 密码
     */
    private String password;
    /**
     * 状态
     */
    private byte status = 0;
    /**
     * 电子邮件
     */
    private String email;
    /**
     * 邮件公开状态,默认公开
     */
    private String emailOpen = "Y";
    /**
     * qq
     */
    private String qq;
    /**
     * qq公开状态,默认公开
     */
    private String qqOpen = "Y";
    /**
     * 联系电话
     */
    private String phone;
    /**
     * 联系电话公开状态，默认公开
     */
    private String phoneOpen = "Y";
    /**
     * 最近登录时间
     */
    private Timestamp lastLoginTime;
    /**
     * 注册时间
     */
    private Timestamp registerTime;

    /**
     * 提交运行ID
     */
    private int runId;

    /**
     * 题目ID
     */
    private int problemId;
    /**
     * 比赛ID，非比赛提交为null
     */
    private Integer contestId;
    /**
     * 比赛题目序号，非比赛提交为null
     */
    private Byte no;
    /**
     * 源代码
     */
    private String code;
    /**
     * 语言
     */
    private String language;
    /**
     * 总运行时间
     */
    private int runTime;
    /**
     * 最大运行内存
     */
    private int runMemory;
    /**
     * 判题结果（第一个产生错误的地方的判题结果，否则为AC）
     */
    private byte resultCode;
    /**
     * 判题结果信息
     */
    private String resultMsg;
    /**
     * 提交时间
     */
    private Timestamp submitTime;
    /**
     * 代码公开（0不公开1公开）
     */
    private byte open;

}
