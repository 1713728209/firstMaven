package com.jbit.dao;

import com.jbit.entity.AsFunction;

import java.util.List;

public interface AsFunctionDao {
    List<AsFunction> findAllFunction(List<Integer> idlist);

    List<AsFunction> findParentFunction();

    List<AsFunction> findAll();
    List<AsFunction> findChildFunction();
}