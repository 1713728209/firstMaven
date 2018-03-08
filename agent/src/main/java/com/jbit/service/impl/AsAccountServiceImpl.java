package com.jbit.service.impl;

import com.jbit.dao.AsAccountDao;
import com.jbit.service.AsAccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/2/24.
 */
@Service
public class AsAccountServiceImpl implements AsAccountService{
    @Resource
    private AsAccountDao asAccountDao;

    public Double findMoneyByid(Integer id) {
        return asAccountDao.findMoneyByid(id);
    }

    public Integer updateMoney(Double money, Integer userId) {
        return asAccountDao.updateMoney(money,userId);
    }
}
