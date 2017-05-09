package com.xtu.DB.entity;


import com.sun.istack.internal.NotNull;
import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import java.sql.Timestamp;

/**
 * 用户表实体对象
 * Created by Ilovezilian on 2017/4/12.
 */

@Data
public class UsersEntity {
    @Min(0)
    private int userId;
    @Min(0)
    private int roleId;
    @NotNull
    @Size(min = 5, max = 10)
    private String id;
    //    @NotNull
    @Size(min = 2, max = 20)
    private String name;
    @Size(min = 0, max = 50)
    private String classId;
    @Size(min = 2, max = 20)
    private String nickname;
    @NotNull
    @Size(min = 6, max = 32)
    private String password;
    @Min(0)
    private byte status = 0;
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
    private Timestamp lastLoginTime;
    private Timestamp registerTime;

}
