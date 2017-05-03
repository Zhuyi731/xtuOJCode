package com.xtu.DB.vo;

import com.xtu.DB.entity.ContestDetailEntity;
import com.xtu.DB.entity.ContestRanklistEntity;
import lombok.Data;

import java.util.List;

/**
 * Created by Ilovezilian on 2017/4/30.
 */
@Data
public class StandingEntityVO {
    ContestRanklistEntity entity;
    List<ContestDetailEntity> entityList;

}
