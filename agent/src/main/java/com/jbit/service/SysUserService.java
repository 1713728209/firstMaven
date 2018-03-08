package com.jbit.service;

import com.jbit.entity.AsUser;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/1/31.
 */
public interface SysUserService {
    List<AsUser> findByLogin(String userCode, String userPassword);

    Integer updateLastLoginTime(Date date, Integer id);

    List<AsUser> findAll();

    Integer updatePassword(AsUser asUser);

    List<AsUser> findPageList(Integer first, Integer last, String username, Integer roleid, String isstart);

    Integer findCount(String username, Integer roleid, String isstart);

    Integer insertUser(AsUser asUser);

    Integer updateUser(AsUser asUser);

    Integer deleteUser(Integer id);
}
