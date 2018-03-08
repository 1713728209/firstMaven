package com.jbit.dao;

import org.apache.ibatis.annotations.Param;

public interface AsAccountDao {
    Double findMoneyByid(Integer id);

    Integer updateMoney(@Param("money") Double money,@Param("userId") Integer userId);
}