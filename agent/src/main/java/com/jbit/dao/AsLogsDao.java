package com.jbit.dao;

import com.jbit.entity.AsLogs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AsLogsDao {
    List<AsLogs> findPageList(@Param("first")Integer first, @Param("last")Integer last,@Param("userId")Integer userId);

    Integer findCount(@Param("userId")Integer userId);
}