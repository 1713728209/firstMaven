package com.jbit.dao;


import com.jbit.entity.AsKeywords;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AsKeywordsDao {
    List<AsKeywords> findAll();

    Integer insertAsKeywords(AsKeywords asKeywords);

    List<AsKeywords> findPageList(@Param("first")Integer first,@Param("last")Integer last);

    Integer findAsKeywordsCount(@Param("keywords") String keywords);

    Integer deleteById(Integer id);

    Integer updateOpenApp(Integer id);

    List<AsKeywords> findListBySearch(@Param("first")Integer first,@Param("last")Integer last,@Param("keywords")String keywords);

    Integer updateAskeywords(AsKeywords asKeywords);
}