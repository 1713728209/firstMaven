package com.jbit.service;

import com.jbit.entity.AsRole;

import java.util.List;

/**
 * Created by Administrator on 2018/3/1.
 */
public interface AsRoleService {
    List<AsRole> findAll();

    Integer updateAsRole(AsRole role);

    Integer deleteRole(Integer id);

    Integer insertRole(AsRole asRole);
}
