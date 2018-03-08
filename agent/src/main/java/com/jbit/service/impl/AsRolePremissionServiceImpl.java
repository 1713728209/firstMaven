package com.jbit.service.impl;

import com.jbit.dao.AsRolePremissionDao;
import com.jbit.entity.AsRolePremission;
import com.jbit.service.AsRolePremissionService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
/**
 * Created by Administrator on 2018/3/1.
 */
@Service
public class AsRolePremissionServiceImpl implements AsRolePremissionService {
    @Resource
    private AsRolePremissionDao asRolePremissionDao;
    public List<AsRolePremission> findFunctionIdListByRoleId(Integer roleId) {
        return asRolePremissionDao.findFunctionIdListByRoleId(roleId);
    }

    public List<AsRolePremission> findAll() {
        return asRolePremissionDao.findAll();
    }

    public List<AsRolePremission> findByFunctionIdList(Integer[] in) {
        return asRolePremissionDao.findByFunctionIdList(in);
    }

    public Integer deleteAsRolePremission(AsRolePremission asRolePremission) {
        return asRolePremissionDao.deleteAsRolePremission(asRolePremission);
    }

    public Integer insertAsRolePremission(AsRolePremission asRolePremission) {
        return asRolePremissionDao.insertAsRolePremission(asRolePremission);
    }
}
