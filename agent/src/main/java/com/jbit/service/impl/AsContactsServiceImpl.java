package com.jbit.service.impl;

import com.jbit.dao.AsContactsDao;
import com.jbit.entity.AsContacts;
import com.jbit.service.AsContactsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AsContactsServiceImpl implements AsContactsService {
    @Resource
    private AsContactsDao asContactsDao;

    public List<AsContacts> findListByCustOmId(Integer customerId) {
        return asContactsDao.findListByCustOmId(customerId);
    }
}
