package com.xtu.DB.dto;

import com.sun.istack.internal.NotNull;
import com.xtu.DB.entity.ContestProblemsEntity;
import lombok.Data;

import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/25.
 */
@Data
public class CreateTestDTO {
//public class CreateTestDTO extends ContestsEntity {
    /**
     * 比赛ID
     */
    @Min(0)
    private int contestId;
    /**
     * 比赛名称
     */
    @NotNull
    @Size(min = 1, max = 50)
    private String title;
    /**
     * 封榜时间
     */
//    @NotNull
    private String startTimeStr;
//    private Long startTimeStr;
    private Timestamp startTime;
    /**
     * 封榜时间
     */
    private String frozenStartTimeStr;
//    private Long frozenStartTimeStr;
    private Timestamp frozenStartTime;
    /**
     * 结束时间
     */
//    @NotNull
    private String endTimeStr;
//    private Long endTimeStr;
    private Timestamp endTime;
    /**
     * 比赛类型（0公开；1可公开看榜，看题，非注册不可交题；2注册私有；3密码私有；4名单导入私有）
     */
    @Min(0)
    @Max(4)
    private byte type;
    /**
     * 线下表示（0线下1线上）
     */
    @Min(0)
    @Max(1)
    private byte online;
    /**
     * 比赛状态（0不可见，1可见）
     */
    @Min(0)
    @Max(1)
    private byte status;
    /**
     * 注册开始时间（类型为0,3,4时为NULL）
     */
    private Timestamp registerStartTime;
    /**
     * 注册结束时间（类型为0,3,4时为NULL）
     */
    private Timestamp registerEndTime;
    /**
     * 比赛描述日志
     */
    private String description;
    /**
     * 比赛公告
     */
    private String anouncement;
    /**
     * 比赛建立者
     */
    private int owner;
    /**
     * 比赛建立时间
     */
    @Null
    private Timestamp createTime;
    /**
     * 比赛最后一次更新时间
     */
    @Null
    private Timestamp lastUpdateTime;

    private String problemsList;
    /**
     * 问题列表
     */
    @Valid
    private List<ContestProblemsEntity> list;
}
