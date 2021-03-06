package com.xtu.DB.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * 修改密码数据传输对象
 * Created by Ilovezilian on 2017/4/29.
 */
@Data
public class ModifyPasswordDTO {
    /**
     * 密码
     */
    @NotNull
    @Size(min = 6, max = 32)
    private String oldPassword;
    /**
     * 密码
     */
    @NotNull
    @Size(min = 6, max = 32)
    private String password;
    /**
     * 密码确认
     */
    @NotNull
    @Size(min = 6, max = 32)
    private String repPassword;
}
