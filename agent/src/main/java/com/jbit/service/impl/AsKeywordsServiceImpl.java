package com.jbit.service.impl;

import com.jbit.dao.AsKeywordsDao;
import com.jbit.entity.AsKeywords;
import com.jbit.entity.PageFactory;
import com.jbit.service.AsKeywordsService;
import com.sun.org.apache.xpath.internal.compiler.Keywords;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AsKeywordsServiceImpl implements AsKeywordsService {
    @Resource
    private AsKeywordsDao asKeywordsDao;
    public List<AsKeywords> findAll() {
        return asKeywordsDao.findAll();
    }

    public Integer insertAsKeywords(AsKeywords asKeywords) {
        return asKeywordsDao.insertAsKeywords(asKeywords);
    }

    public List<AsKeywords> findPageList(Integer first,Integer last) {
        return asKeywordsDao.findPageList( first, last);
    }

    public Integer findAsKeywordsCount(String keywords) {
        return asKeywordsDao.findAsKeywordsCount(keywords);
    }

    public Integer deleteById(Integer id) {
        return asKeywordsDao.deleteById(id);
    }

    public Integer updateOpenApp(Integer id) {
        return asKeywordsDao.updateOpenApp(id);
    }

    public List<AsKeywords> findListBySearch(Integer first, Integer last, String keywords) {
        return asKeywordsDao.findListBySearch(first,last,keywords);
    }

    public Integer updateAskeywords(AsKeywords asKeywords) {
        return asKeywordsDao.updateAskeywords(asKeywords);
    }
}
