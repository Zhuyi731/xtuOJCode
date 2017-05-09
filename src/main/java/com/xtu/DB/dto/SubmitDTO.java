package com.xtu.DB.dto;

import com.sun.istack.internal.NotNull;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

/**
 * 代码提交数据传输对象
 * Created by Ilovezilian on 2017/4/23.
 */
@Data
public class SubmitDTO {
    /**
     * id
     */
    @Size(max = 10)
    private String id;
    /**
     * 用户ID
     */
    @Min(0)
    private int userId;
    /**
     * 题目ID
     */
    @NotNull
    @Min(0)
    private int problemId;
    /**
     * 源代码
     */
    @NotNull
    @Size(min = 1)
    private String code;
    /**
     * 语言
     */
    @NotNull
    @Size(min = 0, max = 20)
    private String language;
    /**
     * 代码公开（0不公开1公开）
     */
    @Max(1)
    @Min(0)
    private byte open = 1;
}
