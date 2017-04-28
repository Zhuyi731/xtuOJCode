package com.xtu.DB.jdbc;

import com.xtu.DB.ContestRepository;
import com.xtu.DB.UsersRepository;
import com.xtu.DB.dto.ContestDTO;
import com.xtu.DB.dto.ProblemsDTO;
import com.xtu.DB.entity.ContestsEntity;
import com.xtu.DB.entity.UsersEntity;
import com.xtu.DB.vo.AllContestEntityVO;
import com.xtu.DB.vo.AllContestVO;
import com.xtu.constant.Constant;
import com.xtu.constant.Tables;
import com.xtu.tools.DateUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Ilovezilian on 2017/4/25.
 */
@Repository
public class ContestRepositoryImp implements ContestRepository {
    @Autowired
    JdbcOperations jdbcOperations;
    @Autowired
    UsersRepository usersRepository;

    @Override
    public Long count() {
        return null;
    }

    @Override
    public ContestsEntity findOne(int contestId) {
        String sql = "select * from " +
                Tables.CONTESTS +
                " from where `contest_id` = ?";
        return jdbcOperations.queryForObject(sql, new ContestsEntityRowMapper(), contestId);
    }

    @Override
    public List<ContestsEntity> find(ProblemsDTO problemsDTO) {
        return null;
    }

    @Override
    public ContestsEntity save(ContestsEntity contestsEntity) {
        if (contestsEntity.getContestId() == 0) {
            insert(contestsEntity);
        } else {
            update(contestsEntity);
        }
        return contestsEntity;
    }

    public Integer queryOne(String title) {
        String sql = "select `contest_id` from "
                + Tables.CONTESTS +
                " where title = ?" +
                " ORDER BY create_time DESC " +
                " limit 1";
        Map<String, Object> map = jdbcOperations.queryForMap(sql, title);
        int res = Integer.parseInt(map.get("contest_id").toString());
        return res;
    }

    @Override
    public ContestsEntity insert(ContestsEntity contestsEntity) {
        String sql = "INSERT INTO `contests` (`title`, `start_time`, `frozen_start_time`, `end_time`,  " +
                "`type`,`online`,`status`,`register_start_time`, `register_end_time`, " +
                "`description`,`announcement`, `owner`)  " +
                "VALUES (?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?)";
        jdbcOperations.update(sql,
                contestsEntity.getTitle(),
                contestsEntity.getStartTime(),
                contestsEntity.getFrozenStartTime(),
                contestsEntity.getEndTime(),
                contestsEntity.getType(),
                contestsEntity.getOnline(),
                contestsEntity.getStatus(),
                contestsEntity.getRegisterStartTime(),
                contestsEntity.getRegisterEndTime(),
                contestsEntity.getDescription(),
                contestsEntity.getAnnouncement(),
                contestsEntity.getOwner());
        int contestId = queryOne(contestsEntity.getTitle());
        contestsEntity.setContestId(contestId);
        return contestsEntity;
    }

    @Override
    public ContestsEntity update(ContestsEntity contestsEntity) {
        ContestsEntity entity = findOne(contestsEntity.getContestId());
        if (entity.getStartTime().after(DateUtil.getCurrentTimestamp())) {
            String sql = "UPDATE `contests` SET" +
                    "`title` = ?," +
                    "`start_time` = ?," +
                    "`frozen_start_time` = ?," +
                    "`end_time` = ?,  " +
                    "`type` = ?," +
                    "`online` = ?," +
                    "`status` = ?," +
                    "`register_start_time` = ?," +
                    "`register_end_time` = ?, " +
                    "`description` = ?," +
                    "`announcement` = ? " +
                    " WHERE `contest_id` = ?";
            jdbcOperations.update(sql,
                    contestsEntity.getTitle(),
                    contestsEntity.getStartTime(),
                    contestsEntity.getFrozenStartTime(),
                    contestsEntity.getEndTime(),
                    contestsEntity.getType(),
                    contestsEntity.getOnline(),
                    contestsEntity.getStatus(),
                    contestsEntity.getRegisterStartTime(),
                    contestsEntity.getRegisterEndTime(),
                    contestsEntity.getDescription(),
                    contestsEntity.getAnnouncement(),
                    contestsEntity.getContestId());
        }
        return contestsEntity;
    }

    @Override
    public void delete(long id) {

    }

    public Long queryContestPagesTotal(ContestDTO contestDTO) {
        String sql = "SELECT COUNT(`contest_id`) FROM " +
                Tables.CONTESTS + " WHERE `contest_id` != 0";
        if (contestDTO.getContestId() != 0) {
            sql = sql + " AND `contest_id` = ?";
        } else {
            sql = sql + " AND `contest_id` != ?";
        }
        if ("".equals(contestDTO.getTitle())) {
            sql += " AND `title` = ?";
        } else {
            sql += " AND `title` != ?";
        }
        if (-1 != contestDTO.getType()) {
            sql += " AND `type` = ?";
        } else {
            sql += " AND `type` != ?";
        }
        if (-1 != contestDTO.getType()) {
            sql += " AND `online` = ?";
        } else {
            sql += " AND `online` != ?";
        }
        if (-1 != contestDTO.getType()) {
            sql += " AND `status` = ?";
        } else {
            sql += " AND `status` != ?";
        }
        return jdbcOperations.queryForObject(sql, Long.class,
                contestDTO.getContestId(),
                contestDTO.getTitle(),
                contestDTO.getType(),
                contestDTO.getOnline(),
                contestDTO.getStatus());
    }

    @Override
    public AllContestVO queryContestPages(int start, int size, ContestDTO contestDTO) {
        String sql = "SELECT * from " +
                Tables.CONTESTS + " WHERE `contest_id` != 0";
        if (contestDTO.getContestId() != 0) {
            sql = sql + " AND `contest_id` = ?";
        } else {
            sql = sql + " AND `contest_id` != ?";
        }
        if ("".equals(contestDTO.getTitle())) {
            sql += " AND `title` = ?";
        } else {
            sql += " AND `title` != ?";
        }
        if (-1 != contestDTO.getType()) {
            sql += " AND `type` = ?";
        } else {
            sql += " AND `type` != ?";
        }
        if (-1 != contestDTO.getType()) {
            sql += " AND `online` = ?";
        } else {
            sql += " AND `online` != ?";
        }
        if (-1 != contestDTO.getType()) {
            sql += " AND `status` = ?";
        } else {
            sql += " AND `status` != ?";
        }
        sql += " LIMIT ?,?";
        List<ContestsEntity> entityList = jdbcOperations.query(sql,
                new ContestsEntityRowMapper(),
                contestDTO.getContestId(),
                contestDTO.getTitle(),
                contestDTO.getType(),
                contestDTO.getOnline(),
                contestDTO.getStatus(),
                start * size, size);
        AllContestVO vo = new AllContestVO();
        List<AllContestEntityVO> entityVOList = new ArrayList<>();
        for (ContestsEntity entity : entityList) {
            AllContestEntityVO entityVO = new AllContestEntityVO();
            BeanUtils.copyProperties(entity, entityVO);

            UsersEntity usersEntity = usersRepository.findOne(contestDTO.getId());
            entityVO.setId(contestDTO.getId());
            entityVO.setName(usersEntity.getName());
            entityVOList.add(entityVO);
        }
        vo.setEntityList(entityVOList);
        vo.setStart(start);
        Long total = queryContestPagesTotal(contestDTO);
        vo.setTotal(total.intValue());
        return vo;
    }

    @Override
    public AllContestVO queryContestPages(int start, ContestDTO contestDTO) {

        return queryContestPages(start, Integer.parseInt(Constant.PAGE_SIZE), contestDTO);
    }

    public Long queryAllContestPagesTotal(int userId) {
        String sql = "SELECT count(`contest_id`) from " +
                Tables.CONTESTS +
                " WHERE `owner` = ?";
        return jdbcOperations.queryForObject(sql, Long.class, userId);
    }

    @Override
    public AllContestVO queryAllContestPages(int start, int size, int userId) {
        String sql = "SELECT  * from " +
                Tables.CONTESTS +
                " WHERE `owner` = ? " +
                " LIMIT ?, ?";
        List<ContestsEntity> entityList =
                jdbcOperations.query(sql, new ContestsEntityRowMapper(), userId, start * size, size);
        AllContestVO vo = new AllContestVO();
        List<AllContestEntityVO> entityListVO = new ArrayList<>();
        AllContestEntityVO entityVO = new AllContestEntityVO();
        for (ContestsEntity entity : entityList) {
            BeanUtils.copyProperties(entity, entityVO);
            entityListVO.add(entityVO);
        }
        vo.setEntityList(entityListVO);
        Long total = queryAllContestPagesTotal(userId);
        vo.setTotal(total.intValue());
        vo.setStart(start);
        return vo;
    }

    @Override
    public AllContestVO queryAllContestPages(int start, int userId) {
        return queryAllContestPages(start, Integer.parseInt(Constant.PAGE_SIZE), userId);
    }

    private static final class ContestsEntityRowMapper implements RowMapper<ContestsEntity> {
        @Override
        public ContestsEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            ContestsEntity entity = new ContestsEntity();
            entity.setContestId(rs.getInt("contest_id"));
            entity.setTitle(rs.getString("title"));
            entity.setStartTime(rs.getTimestamp("start_time"));
            entity.setFrozenStartTime(rs.getTimestamp("frozen_start_time"));
            entity.setEndTime(rs.getTimestamp("end_time"));
            entity.setType(rs.getByte("type"));
            entity.setOnline(rs.getByte("online"));
            entity.setStatus(rs.getByte("status"));
            entity.setRegisterStartTime(rs.getTimestamp("register_start_time"));
            entity.setRegisterEndTime(rs.getTimestamp("register_end_time"));
            entity.setDescription(rs.getString("description"));
            entity.setAnnouncement(rs.getString("announcement"));
            entity.setOwner(rs.getInt("owner"));
            entity.setCreateTime(rs.getTimestamp("last_update_time"));
            return entity;
        }
    }

}
