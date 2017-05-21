package com.xtu.DB.entity;

import lombok.Data;

/**
 * 验证器表实体对象
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ValidatorEntity {
    private short validatorId;
    private byte[] validator;
    private String description;
}
