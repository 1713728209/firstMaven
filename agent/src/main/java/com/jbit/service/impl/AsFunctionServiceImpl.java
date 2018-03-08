package com.jbit.service.impl;

import com.jbit.dao.AsFunctionDao;
import com.jbit.entity.AsFunction;
import com.jbit.service.AsFunctionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/3/1.
 */
@Service
public class AsFunctionServiceImpl implements AsFunctionService{
    @Resource
    private AsFunctionDao asFunctionDao;

    public List<AsFunction> findParentFunction() {
        return asFunctionDao.findParentFunction();
    }

    public List<AsFunction> findAllFunction(List<Integer> idlist) {
        return asFunctionDao.findAllFunction(idlist);
    }

    public List<AsFunction> findAll() {
        return asFunctionDao.findAll();
    }

    public List<AsFunction> findChildFunction() {
        return asFunctionDao.findChildFunction();
    }
}
