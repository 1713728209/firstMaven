package com.jbit.service.impl;

import com.jbit.dao.AsAccountdetailDao;
import com.jbit.entity.AsAccountdetail;
import com.jbit.service.AsAccountdetailService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AsAccountdetailServiceImpl implements AsAccountdetailService {
    @Resource
    private AsAccountdetailDao asAccountdetailDao;

    public List<AsAccountdetail> findPageList(Integer first, Integer last, String detailtype, String starttime, String endtime,Integer userId) {
        return asAccountdetailDao.findPageList(first, last,detailtype,starttime,endtime,userId);
    }

    public Integer findCount(String detailtype,String starttime,String endtime,Integer userId) {
        return asAccountdetailDao.findCount(detailtype, starttime, endtime,userId);
    }

    public Integer insertAsAccountdetail(AsAccountdetail asAccountdetail) {
        return asAccountdetailDao.insertAsAccountdetail(asAccountdetail);
    }
}
