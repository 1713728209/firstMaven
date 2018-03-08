package com.jbit.dao;
import com.jbit.entity.AsAccountdetail;
import org.apache.ibatis.annotations.Param;
import java.util.List;
public interface AsAccountdetailDao {
    List<AsAccountdetail> findPageList(@Param("first")Integer first,@Param("last")Integer last,@Param("detailtype")String detailtype,@Param("starttime")String starttime,@Param("endtime")String endtime,@Param("userId")Integer userId);

    Integer findCount(@Param("detailtype")String detailtype,@Param("starttime")String starttime,@Param("endtime")String endtime,@Param("userId")Integer userId);

    Integer insertAsAccountdetail(AsAccountdetail asAccountdetail);
}