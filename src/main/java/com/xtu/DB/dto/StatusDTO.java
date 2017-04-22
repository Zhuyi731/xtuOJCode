package com.xtu.DB.dto;

import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

/**
 * Created by Ilovezilian on 2017/4/22.
 */
@Data
public class StatusDTO {
    @Min(0)
    public int problemId = 0;
    @Min(0)
    private int contestId = 0;
    @Size(max = 50)
    public String title;
    @Size(min = 5, max = 10)
    private String id;
    private String language;
    /**
     0.All
     1.Accepted
     2.Wrong Answer
     3.Compile Error
     4.Runntime Error
     5.Presentation Error
     6.Time Limit Exceed
     7.Memory Limit Exceed
     8.Output Limit Exceed
     */
    private byte resultCode = 0;
}
