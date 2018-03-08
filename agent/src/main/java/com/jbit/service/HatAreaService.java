package com.jbit.service;

import com.jbit.entity.HatArea;

import java.util.List;

public interface HatAreaService {
    List<HatArea> findAll();

    List<HatArea> findAreaListByCityId(Integer cityId);
}
