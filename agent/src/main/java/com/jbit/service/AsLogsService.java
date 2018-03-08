package com.jbit.service;

import com.jbit.entity.AsLogs;

import java.util.List;

public interface AsLogsService {
    List<AsLogs> findPageList(Integer first,Integer last,Integer userId);

    Integer findCount(Integer userId);
}
