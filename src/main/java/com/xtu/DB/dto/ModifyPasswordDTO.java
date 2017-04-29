package com.xtu.DB.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by Ilovezilian on 2017/4/29.
 */
@Data
public class ModifyPasswordDTO {
    /**
     * 密码
     */
    @NotNull
    @Size(min = 6, max = 32)
    String oldPassword;
    /**
     * 密码
     */
    @NotNull
    @Size(min = 6, max = 32)
    String password;
    /**
     * 密码确认
     */
    @NotNull
    @Size(min = 6, max = 32)
    String repPassword;
}
