package com.jbit.service;

import com.jbit.entity.HatCity;

import java.util.List;

public interface HatCitySerivce {
    List<HatCity> findAll();

    List<HatCity> findCityListByProviceId(Integer provinceId);
}
