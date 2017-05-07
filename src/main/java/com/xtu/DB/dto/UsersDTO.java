package com.xtu.DB.dto;

import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

/**
 * Created by Ilovezilian on 2017/5/6.
 */
@Data
public class UsersDTO {
    @Min(0)
    private int roleId = -1;
    @Size(min = 5, max = 10)
    private String id;
    @Size(min = 2, max = 20)
    private String name;
    @Size(min = 0, max = 50)
    private String classId;
}
