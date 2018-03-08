package com.jbit.service.impl;

import com.jbit.dao.HatProvinceDao;
import com.jbit.entity.HatProvince;
import com.jbit.service.HatProvinceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HatProvinceServiceImpl implements HatProvinceService {
    @Resource
    private HatProvinceDao hatProvinceDao;

    public List<HatProvince> findList() {
        return hatProvinceDao.findList();
    }
}
