package com.jbit.entity;

import java.util.Date;

public class AsAccountdetail {
    private Integer id;

    private Integer systemconfigid;

    private Integer userid;

    private Double money;

    private Double accountmoney;

    private Date detaildatetime;

    private String memo;

    private String detailtypename;
    private String username;
    private String configtypename;

    public String getConfigtypename() {
        return configtypename;
    }

    public void setConfigtypename(String configtypename) {
        this.configtypename = configtypename;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDetailtypename() {
        return detailtypename;
    }

    public void setDetailtypename(String detailtypename) {
        this.detailtypename = detailtypename;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSystemconfigid() {
        return systemconfigid;
    }

    public void setSystemconfigid(Integer systemconfigid) {
        this.systemconfigid = systemconfigid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Double getAccountmoney() {
        return accountmoney;
    }

    public void setAccountmoney(Double accountmoney) {
        this.accountmoney = accountmoney;
    }

    public Date getDetaildatetime() {
        return detaildatetime;
    }

    public void setDetaildatetime(Date detaildatetime) {
        this.detaildatetime = detaildatetime;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }
}