package com.xtu.DB.dto;

import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

/** 状态筛选数据传输对象
 * Created by Ilovezilian on 2017/4/22.
 */
@Data
public class StatusDTO {
    /**
     * 题目id
     */
    @Min(0)
    private int problemId = 0;
    /**
     * 比赛ID
     */
    @Min(0)
    private int contestId = 0;
    /**
     * 题目名称
     */
    @Size(max = 50)
    private String title = "";
    /**
     * id
     */
    @Size(min = 5, max = 10)
    private String id = "";
    /**
     * 语言
     */
    private String language = "";
    /**
     * 判题结果（第一个产生错误的地方的判题结果，否则为AC）
     * 0.All
     * 1.Accepted
     * 2.Wrong Answer
     * 3.Compile Error
     * 4.Runntime Error
     * 5.Presentation Error
     * 6.Time Limit Exceed
     * 7.Memory Limit Exceed
     * 8.Output Limit Exceed
     */
    private byte resultCode = 0;
}
