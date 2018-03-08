package com.jbit.dao;

import com.jbit.entity.AsCustoms;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AsCustomsDao {
    List<AsCustoms> findAsCustomsList(@Param("first")Integer first, @Param("last")Integer last,@Param("cname")String cname);

    Integer findCount(@Param("cname")String cname);

    Integer updateAscustom(AsCustoms asCustoms);

    Integer updateStatus(@Param("id")Integer id,@Param("status")Integer status);

    Integer insertAscustom(AsCustoms asCustoms);
}