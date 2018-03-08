package com.jbit.service.impl;

import com.jbit.dao.AsUserDao;
import com.jbit.entity.AsUser;
import com.jbit.service.SysUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/1/31.
 */
@Service
public class AsUserServiceImpl implements SysUserService {


    @Resource
    private AsUserDao sysUserDao;

    public List<AsUser> findByLogin(String userCode, String userPassword) {
        return sysUserDao.findByLogin(userCode,userPassword);
    }

    public Integer updateLastLoginTime(Date date, Integer id) {
        return sysUserDao.updateLastLoginTime(date,id);
    }

    public List<AsUser> findAll() {
        return sysUserDao.findAll();
    }

    public Integer updatePassword(AsUser asUser) {
        return sysUserDao.updatePassword(asUser);
    }

    public List<AsUser> findPageList(Integer first, Integer last,String username, Integer roleid, String isstart) {
        return sysUserDao.findPageList(first, last,username,roleid,isstart);
    }

    public Integer findCount(String username, Integer roleid, String isstart) {
        return sysUserDao.findCount(username, roleid, isstart);
    }

    public Integer insertUser(AsUser asUser) {
        return sysUserDao.insertUser(asUser);
    }

    public Integer updateUser(AsUser asUser) {
        return sysUserDao.updateUser(asUser);
    }

    public Integer deleteUser(Integer id) {
        return sysUserDao.deleteUser(id);
    }
}