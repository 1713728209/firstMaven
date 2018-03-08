package com.jbit.service;

import com.jbit.entity.AsKeywords;

import java.util.List;

public interface AsKeywordsService {
    List<AsKeywords> findAll();

    Integer insertAsKeywords(AsKeywords asKeywords);

    List<AsKeywords> findPageList(Integer first,Integer last);

    Integer findAsKeywordsCount(String keywords);

    Integer deleteById(Integer id);

    Integer updateOpenApp(Integer id);

    List<AsKeywords> findListBySearch(Integer first, Integer last, String keywords);

    Integer updateAskeywords(AsKeywords asKeywords);

}
