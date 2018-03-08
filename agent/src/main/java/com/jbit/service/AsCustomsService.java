package com.jbit.service;

import com.jbit.entity.AsCustoms;

import java.util.List;

public interface AsCustomsService {
    List<AsCustoms> findAsCustomsList(Integer first,Integer last,String cname);

    Integer findCount(String cname);

    Integer updateAscustom(AsCustoms asCustoms);

    Integer updateStatus(Integer id, Integer status);

    Integer insertAscustom(AsCustoms asCustoms);
}
