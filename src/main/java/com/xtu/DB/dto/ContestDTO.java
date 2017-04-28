package com.xtu.DB.dto;

import lombok.Data;

/**
 * Created by Ilovezilian on 2017/4/27.
 */
@Data
public class ContestDTO {
    /**
     * 比赛ID
     */
    private int contestId;
    /**
     * 比赛名称
     */
    private String title = " ";
    /**
     * 比赛类型（0公开；1可公开看榜，看题，非注册不可交题；2注册私有；3密码私有；4名单导入私有）
     */
    private byte type = -1;
    /**
     * 线下表示（0线下1线上）
     */
    private byte online = -1;
    /**
     * 比赛状态（0不可见，1可见）
     */
    private byte status = -1;
    /**
     * 拥有者
     */
    private int owner;
    /**
     * 用户id
     */
    private String id;
}
