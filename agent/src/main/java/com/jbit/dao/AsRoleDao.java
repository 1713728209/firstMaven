package com.jbit.dao;

import com.jbit.entity.AsRole;

import java.util.List;

public interface AsRoleDao {
    List<AsRole> findAll();

    Integer updateAsRole(AsRole role);

    Integer deleteRole(Integer id);

    Integer insertRole(AsRole asRole);
}