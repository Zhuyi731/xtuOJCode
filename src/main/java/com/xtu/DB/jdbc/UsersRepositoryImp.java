package com.xtu.DB.jdbc;

import com.xtu.DB.UsersRepository;
import com.xtu.DB.entity.UsersEntity;
import com.xtu.constant.Tables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.stereotype.Repository;

/**
 * Created by Ilovezilian on 2017/4/12.
 */
@Repository
public class UsersRepositoryImp implements UsersRepository {

    @Autowired
    private JdbcOperations jdbcOperations;

    public Long count() {
        String selctCountSql = "SELECT count(user_id) FROM "
                + Tables.USERS;
        return jdbcOperations.queryForObject(selctCountSql,
                Long.class);
    }

    public UsersEntity findOne(String id) {
        String finduserSql = "SELECT * FROM " + Tables.USERS
                + " WHERE id = ?";
        return jdbcOperations.queryForObject(
                finduserSql,
                UsersEntity.class,
                id);
    }

    public UsersEntity save(UsersEntity usersEntity) {
        String insertUserSql = "INSERT INTO "
                + Tables.USERS
                + "(`id`, `name`, `class_id`, `nickname`, `password`) " +
                "VALUES (?, ?, ?, ?, ?)";
        jdbcOperations.update(insertUserSql,
                usersEntity.getId(),
                usersEntity.getName(),
                usersEntity.getClassId(),
                usersEntity.getNickname(),
                usersEntity.getPassword());
        return null;
    }

    public void delete(long id) {

    }
}
