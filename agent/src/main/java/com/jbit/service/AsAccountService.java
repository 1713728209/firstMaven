package com.jbit.service;

/**
 * Created by Administrator on 2018/2/24.
 */
public interface AsAccountService {
    Double findMoneyByid(Integer id);

    Integer updateMoney(Double money,Integer userId);
}
