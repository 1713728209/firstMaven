package com.jbit.service;

import com.jbit.entity.AsAccountdetail;

import java.util.List;

public interface AsAccountdetailService {
    List<AsAccountdetail> findPageList(Integer first, Integer last, String detailtype, String starttime, String endtime,Integer userId);

    Integer findCount(String detailtype, String starttime, String endtime,Integer userId);

    Integer insertAsAccountdetail(AsAccountdetail asAccountdetail);
}
