package com.jbit.service;

import com.jbit.entity.AsRolePremission;

import java.util.List;

/**
 * Created by Administrator on 2018/3/1.
 */
public interface AsRolePremissionService {
    List<AsRolePremission> findFunctionIdListByRoleId(Integer roleId);

    List<AsRolePremission> findAll();

    List<AsRolePremission> findByFunctionIdList(Integer [] in);

    Integer deleteAsRolePremission(AsRolePremission asRolePremission);

    Integer insertAsRolePremission(AsRolePremission asRolePremission);
}
