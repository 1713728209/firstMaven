package com.jbit.service.impl;

import com.jbit.dao.HatAreaDao;
import com.jbit.entity.HatArea;
import com.jbit.service.HatAreaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HatAreaServiceImpl implements HatAreaService {
    @Resource
    private HatAreaDao hatAreaDao;

    public List<HatArea> findAll() {
        return hatAreaDao.findAll();
    }

    public List<HatArea> findAreaListByCityId(Integer cityId) {
        return hatAreaDao.findAreaListByCityId(cityId);
    }
}
