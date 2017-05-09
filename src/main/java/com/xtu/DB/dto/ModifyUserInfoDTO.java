package com.xtu.DB.dto;

import lombok.Data;

import javax.validation.constraints.Size;

/**
 * 修改用户信息数据传输对象
 * Created by Ilovezilian on 2017/4/29.
 */
@Data
public class ModifyUserInfoDTO {
    @Size(min = 2, max = 20)
    private String nickname;
    @Size(max = 50)
    private String email;
    @Size(min = 1, max = 1)
    private String emailOpen = "Y";
    @Size(min = 5, max = 20)
    private String qq;
    @Size(min = 1, max = 1)
    private String qqOpen = "Y";
    @Size(min = 11, max = 11)
    private String phone;
    @Size(min = 1, max = 1)
    private String phoneOpen = "Y";
}
