package com.jbit.dao;

import com.jbit.entity.HatCity;

import java.util.List;

public interface HatCityDao {
    List<HatCity> findAll();

    List<HatCity> findCityListByProviceId(Integer provinceId);
}