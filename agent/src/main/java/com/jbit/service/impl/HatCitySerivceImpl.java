package com.jbit.service.impl;

import com.jbit.dao.HatCityDao;
import com.jbit.entity.HatCity;
import com.jbit.service.HatCitySerivce;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HatCitySerivceImpl implements HatCitySerivce {
    @Resource
    private HatCityDao hatCityDao;
    public List<HatCity> findAll() {
        return hatCityDao.findAll();
    }

    public List<HatCity> findCityListByProviceId(Integer provinceId) {
        return hatCityDao.findCityListByProviceId(provinceId);
    }
}
