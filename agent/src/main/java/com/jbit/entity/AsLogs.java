package com.jbit.entity;

import java.util.Date;

public class AsLogs {
    private Integer id;

    private Integer userid;
    private String username;
    private String operateinfo;
    private Date operatedatetime;

    public String getUsername() {
        return username;
    }

    public String getOperateinfo() {
        return operateinfo;
    }

    public void setOperateinfo(String operateinfo) {
        this.operateinfo = operateinfo;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getOperatedatetime() {
        return operatedatetime;
    }

    public void setOperatedatetime(Date operatedatetime) {
        this.operatedatetime = operatedatetime;
    }
}