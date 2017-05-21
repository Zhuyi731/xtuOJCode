package com.xtu.DB.vo;

import com.xtu.DB.entity.ContestDetailEntity;
import com.xtu.DB.entity.ContestRanklistEntity;
import com.xtu.DB.entity.UsersEntity;
import lombok.Data;

import java.util.List;

/**
 * 指定比赛、作业单项排行榜视图
 * Created by Ilovezilian on 2017/4/30.
 */
@Data
public class StandingEntityVO {
    ContestRanklistEntity entity;
    UsersEntity usersEntity;
    List<ContestDetailEntity> entityList;

}
