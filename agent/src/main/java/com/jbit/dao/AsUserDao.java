package com.jbit.dao;

import com.jbit.entity.AsUser;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface AsUserDao {
    List<AsUser> findByLogin(@Param("userCode") String userCode, @Param("userPassword")String userPassword);

    Integer updateLastLoginTime(@Param("date")Date date,@Param("id") Integer id);

    List<AsUser> findAll();

    Integer updatePassword(AsUser asUser);

    List<AsUser> findPageList(@Param("first")Integer first,@Param("last") Integer last,@Param("username")String username,@Param("roleid")Integer roleid,@Param("isstart")String isstart);

    Integer findCount(@Param("username")String username,@Param("roleid")Integer roleid,@Param("isstart")String isstart);

    Integer insertUser(AsUser asUser);

    Integer updateUser(AsUser asUser);

    Integer deleteUser(Integer id);

}