package com.jbit.service.impl;

import com.jbit.dao.AsRoleDao;
import com.jbit.entity.AsRole;
import com.jbit.service.AsRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/3/1.
 */
@Service
public class AsRoleServiceImpl implements AsRoleService{
    @Resource
    private AsRoleDao asRoleDao;

    public List<AsRole> findAll() {
        return asRoleDao.findAll();
    }

    public Integer updateAsRole(AsRole role) {
        return asRoleDao.updateAsRole(role);
    }

    public Integer deleteRole(Integer id) {
        return asRoleDao.deleteRole(id);
    }

    public Integer insertRole(AsRole asRole) {
        return asRoleDao.insertRole(asRole);
    }
}
