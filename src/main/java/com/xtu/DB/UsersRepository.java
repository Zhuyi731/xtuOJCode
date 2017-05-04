package com.xtu.DB;

import com.xtu.DB.entity.UsersEntity;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

public interface UsersRepository {
    Long count();

    UsersEntity findOne(String id);

    UsersEntity findOne(int userId);

    UsersEntity save(UsersEntity usersEntity);

    void delete(long id);
}
