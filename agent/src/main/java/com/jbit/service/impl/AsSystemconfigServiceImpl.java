package com.jbit.service.impl;

import com.jbit.dao.AsSystemconfigDao;
import com.jbit.entity.AsSystemconfig;
import com.jbit.service.AsSystemconfigService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class AsSystemconfigServiceImpl implements AsSystemconfigService {
    @Resource
    private AsSystemconfigDao asSystemconfigDao;

    public List<AsSystemconfig> findkeyWordsServiceType() {
        return asSystemconfigDao.findkeyWordsServiceType();
    }

    public List<AsSystemconfig> findYfkServiceType() {
        return asSystemconfigDao.findYfkServiceType();
    }
}
