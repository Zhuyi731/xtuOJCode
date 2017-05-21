package com.xtu.DB.dto;

import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

/**
 * 题目管理筛选数据传输对象
 * Created by Ilovezilian on 2017/4/30.
 */
@Data
public class ProblemsMangerDTO {
    /**
     * 题目id
     */
    @Min(0)
    private int problemId = 0;
    /**
     * 题目名称
     */
    @Size(max = 50)
    private String title = "";
    /**
     * 作者，同users.Id
     */
    @Size(max = 50)
    private String author;

    /**
     * 拥有者
     */
    @Min(0)
    private int owner = 0;
}
