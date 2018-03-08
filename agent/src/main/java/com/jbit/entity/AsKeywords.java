package com.jbit.entity;

import java.util.Date;

public class AsKeywords {
    private Integer id;

    private Integer systemconfigid;

    private Integer customid;

    private Integer agentid;

    private Double preregfrozenmoney;

    private Double price;

    private Integer openapp;

    private String appusername;

    private String apppassword;

    private Date preregdatetime;

    private Date preregpassdatetime;

    private Date regdatetime;

    private Date regpassdatetime;

    private Integer ispass;

    private Integer checkstatus;

    private Integer isuse;
    private String keywords;

    private String customname;

    private String agentname;

    private Integer serviceyears;

    public Integer getServiceyears() {
        return serviceyears;
    }

    public void setServiceyears(Integer serviceyears) {
        this.serviceyears = serviceyears;
    }

    public String getAgentname() {
        return agentname;
    }

    public void setAgentname(String agentname) {
        this.agentname = agentname;
    }

    public String getCustomname() {
        return customname;
    }

    public void setCustomname(String customname) {
        this.customname = customname;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
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

    public Integer getCustomid() {
        return customid;
    }

    public void setCustomid(Integer customid) {
        this.customid = customid;
    }

    public Integer getAgentid() {
        return agentid;
    }

    public void setAgentid(Integer agentid) {
        this.agentid = agentid;
    }

    public Double getPreregfrozenmoney() {
        return preregfrozenmoney;
    }

    public void setPreregfrozenmoney(Double preregfrozenmoney) {
        this.preregfrozenmoney = preregfrozenmoney;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getOpenapp() {
        return openapp;
    }

    public void setOpenapp(Integer openapp) {
        this.openapp = openapp;
    }

    public String getAppusername() {
        return appusername;
    }

    public void setAppusername(String appusername) {
        this.appusername = appusername == null ? null : appusername.trim();
    }

    public String getApppassword() {
        return apppassword;
    }

    public void setApppassword(String apppassword) {
        this.apppassword = apppassword == null ? null : apppassword.trim();
    }

    public Date getPreregdatetime() {
        return preregdatetime;
    }

    public void setPreregdatetime(Date preregdatetime) {
        this.preregdatetime = preregdatetime;
    }

    public Date getPreregpassdatetime() {
        return preregpassdatetime;
    }

    public void setPreregpassdatetime(Date preregpassdatetime) {
        this.preregpassdatetime = preregpassdatetime;
    }

    public Date getRegdatetime() {
        return regdatetime;
    }

    public void setRegdatetime(Date regdatetime) {
        this.regdatetime = regdatetime;
    }

    public Date getRegpassdatetime() {
        return regpassdatetime;
    }

    public void setRegpassdatetime(Date regpassdatetime) {
        this.regpassdatetime = regpassdatetime;
    }

    public Integer getIspass() {
        return ispass;
    }

    public void setIspass(Integer ispass) {
        this.ispass = ispass;
    }

    public Integer getCheckstatus() {
        return checkstatus;
    }

    public void setCheckstatus(Integer checkstatus) {
        this.checkstatus = checkstatus;
    }

    public Integer getIsuse() {
        return isuse;
    }

    public void setIsuse(Integer isuse) {
        this.isuse = isuse;
    }
}