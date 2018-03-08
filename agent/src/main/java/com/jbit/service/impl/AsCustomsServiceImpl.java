package com.jbit.service.impl;

import com.jbit.dao.AsCustomsDao;
import com.jbit.entity.AsCustoms;
import com.jbit.service.AsCustomsService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AsCustomsServiceImpl implements AsCustomsService {
    @Resource
    private AsCustomsDao asCustomsDao;
    public List<AsCustoms> findAsCustomsList(Integer first, Integer last,String cname) {
        return asCustomsDao.findAsCustomsList(first,last,cname);
    }

    public Integer findCount(String cname) {
        return asCustomsDao.findCount(cname);
    }

    public Integer updateAscustom(AsCustoms asCustoms) {
        return asCustomsDao.updateAscustom(asCustoms);
    }

    public Integer updateStatus(Integer id, Integer status) {
        return asCustomsDao.updateStatus(id, status);
    }

    public Integer insertAscustom(AsCustoms asCustoms) {
        return asCustomsDao.insertAscustom(asCustoms);
    }
}
