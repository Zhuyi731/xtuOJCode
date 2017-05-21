package com.xtu.DB.entity;

import lombok.Data;

/**
 * 判题结果表实体对象
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ResultEntity {
    private byte resultCode;
    private String msgCn;
    private String msgEn;
}
