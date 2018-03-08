package com.jbit.dao;

import com.jbit.entity.HatArea;

import java.util.List;

public interface HatAreaDao {
    List<HatArea> findAll();

    List<HatArea> findAreaListByCityId(Integer cityId);
}