package com.xtu.DB.dto;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ProblemsDTO {
    @Min(0)
    public int problemId = 0;
    @Size(max = 50)
    public String title;
    @Min(0)
    public int start = 0;
    @Min(0)
    @Max(1000)
    public int size = 50;
}
