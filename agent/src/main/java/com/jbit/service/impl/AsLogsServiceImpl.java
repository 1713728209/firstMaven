package com.jbit.service.impl;

import com.jbit.dao.AsLogsDao;
import com.jbit.entity.AsLogs;
import com.jbit.service.AsLogsService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AsLogsServiceImpl implements AsLogsService {
    @Resource
    private AsLogsDao asLogsDao;

    public List<AsLogs> findPageList(Integer first, Integer last,Integer userId) {
        return asLogsDao.findPageList(first, last,userId);
    }

    public Integer findCount(Integer userId) {
        return asLogsDao.findCount(userId);
    }
}
