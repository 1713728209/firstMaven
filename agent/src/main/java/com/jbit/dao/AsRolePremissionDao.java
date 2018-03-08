package com.jbit.dao;

import com.jbit.entity.AsRolePremission;

import java.util.List;

public interface AsRolePremissionDao {
    List<AsRolePremission> findFunctionIdListByRoleId(Integer roleId);

    List<AsRolePremission> findAll();

    List<AsRolePremission> findByFunctionIdList(Integer [] in);

    Integer deleteAsRolePremission(AsRolePremission asRolePremission);

    Integer insertAsRolePremission(AsRolePremission asRolePremission);
}