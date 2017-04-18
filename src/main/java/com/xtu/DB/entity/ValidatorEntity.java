package com.xtu.DB.entity;

import lombok.Data;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Data
public class ValidatorEntity {
    private short validatorId;
    private byte[] validator;
    private String description;
}
