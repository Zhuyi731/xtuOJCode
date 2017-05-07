package com.xtu.DB.jdbc;

import com.xtu.DB.UsersRepository;
import com.xtu.DB.dto.UsersDTO;
import com.xtu.DB.entity.UsersEntity;
import com.xtu.constant.Constant;
import com.xtu.constant.Tables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
                new UsersEntityRowMapper(),
                id);
    }

    public UsersEntity findOne(int userId) {
        String finduserSql = "SELECT * FROM " + Tables.USERS
                + " WHERE `user_id` = ?";
        return jdbcOperations.queryForObject(
                finduserSql,
                new UsersEntityRowMapper(),
                userId);
    }

    public UsersEntity save(UsersEntity usersEntity) {
        Integer userId = usersEntity.getUserId();
        String sql = null;
        if (null == userId) {
            sql = "INSERT INTO "
                    + Tables.USERS
                    + "(`role_id`,`id`, `name`, `class_id`," +
                    " `nickname`, `password`,`status`, `email`," +
                    "`email_open`, `QQ`, `QQ_open`, `phone`, `phone_open`) " +
                    "VALUES (?, ?, ?, ?, ?, " +
                    "?, ?, ?, ?," +
                    "?, ?, ?, ?, ?)";
            jdbcOperations.update(sql,
                    usersEntity.getRoleId(),
                    usersEntity.getId(),
                    usersEntity.getName(),
                    usersEntity.getClassId(),
                    usersEntity.getNickname(),
                    usersEntity.getPassword(),
                    usersEntity.getStatus(),
                    usersEntity.getEmail(),
                    usersEntity.getEmailOpen(),
                    usersEntity.getQq(),
                    usersEntity.getQqOpen(),
                    usersEntity.getPhone(),
                    usersEntity.getPhoneOpen());
        } else {
            sql = "update " +
                    Tables.USERS +
                    " set role_id = ?," +
                    " nickname = ?," +
                    " class_id = ?," +
                    " password = ?," +
                    " status = ?," +
                    " email = ?," +
                    " email_open = ?," +
                    " QQ = ?," +
                    " QQ_open = ?," +
                    " phone = ?," +
                    " phone_open = ?" +
                    " where `id` = ?";
            jdbcOperations.update(sql,
                    usersEntity.getRoleId(),
                    usersEntity.getNickname(),
                    usersEntity.getClassId(),
                    usersEntity.getPassword(),
                    usersEntity.getStatus(),
                    usersEntity.getEmail(),
                    usersEntity.getEmailOpen(),
                    usersEntity.getQq(),
                    usersEntity.getQqOpen(),
                    usersEntity.getPhone(),
                    usersEntity.getPhoneOpen(),
                    usersEntity.getId());
        }

        return usersEntity;
    }

    public void delete(long id) {

    }

    @Override
    public List<UsersEntity> queryList(int start, int size, UsersDTO dto) {
        String sql = "SELECT * FROM "
                + Tables.USERS;
        if (null == dto.getName() || "".equals(dto.getName())) {
            sql += " WHERE `name` != ? ";
            dto.setName("@_@");
        } else {
            sql += " WHERE `name` = ? ";
        }
        if (dto.getRoleId() != 0) {
            sql += " AND `role_id` = ?";
        } else {
            sql += " AND `role_id` != ?";
        }
        if (null == dto.getId() || "".equals(dto.getId())) {
            sql += " AND `id` != ? ";
            dto.setId("(^_^)");
        } else {
            sql += " AND `id` = ? ";
        }
        if (null == dto.getClassId() || "".equals(dto.getClassId())) {
            sql += " AND `class_id` != ? ";
            dto.setClassId("T_T");
        } else {
            sql += " AND `class_id` = ? ";
        }
        sql += " LIMIT ?, ?";
        return jdbcOperations.query(sql,
                new UsersEntityRowMapper(),
                dto.getName(),
                dto.getRoleId(),
                dto.getId(),
                dto.getClassId(),
                start * size,
                size);
    }

    @Override
    public List<UsersEntity> queryList(int start, UsersDTO dto) {
        return queryList(start, Integer.parseInt(Constant.PAGE_SIZE), dto);
    }

    private static final class UsersEntityRowMapper implements RowMapper<UsersEntity> {
        @Override
        public UsersEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            UsersEntity entity = new UsersEntity();
            entity.setUserId(rs.getInt("user_id"));
            entity.setRoleId(rs.getInt("role_id"));
            entity.setId(rs.getString("id"));
            entity.setName(rs.getString("name"));
            entity.setClassId(rs.getString("class_id"));
            entity.setNickname(rs.getString("nickname"));
            entity.setPassword(rs.getString("password"));
            entity.setStatus(rs.getByte("status"));
            entity.setEmail(rs.getString("email"));
            entity.setEmailOpen(rs.getString("email_open"));
            entity.setQq(rs.getString("QQ"));
            entity.setQqOpen(rs.getString("QQ_open"));
            entity.setPhone(rs.getString("phone"));
            entity.setPhoneOpen(rs.getString("phone_open"));
            entity.setLastLoginTime(rs.getTimestamp("last_login_time"));
            entity.setRegisterTime(rs.getTimestamp("register_time"));
            return entity;
        }
    }
}
