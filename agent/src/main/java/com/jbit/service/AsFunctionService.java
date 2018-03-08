package com.jbit.service;
import com.jbit.entity.AsFunction;

import java.util.List;
/**
 * Created by Administrator on 2018/3/1.
 */
public interface AsFunctionService {
    List<AsFunction> findAllFunction(List<Integer> idlist);
    List<AsFunction> findParentFunction();
    List<AsFunction> findAll();
    List<AsFunction> findChildFunction();
}
