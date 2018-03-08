package com.jbit.entity;

public class AsSystemconfig {
    private Integer id;

    private Integer configtype;

    private Integer configtypevalue;

    private String configtypename;

    private String configvalue;

    private Integer isstart;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getConfigtype() {
        return configtype;
    }

    public void setConfigtype(Integer configtype) {
        this.configtype = configtype;
    }

    public Integer getConfigtypevalue() {
        return configtypevalue;
    }

    public void setConfigtypevalue(Integer configtypevalue) {
        this.configtypevalue = configtypevalue;
    }

    public String getConfigtypename() {
        return configtypename;
    }

    public void setConfigtypename(String configtypename) {
        this.configtypename = configtypename == null ? null : configtypename.trim();
    }

    public String getConfigvalue() {
        return configvalue;
    }

    public void setConfigvalue(String configvalue) {
        this.configvalue = configvalue == null ? null : configvalue.trim();
    }

    public Integer getIsstart() {
        return isstart;
    }

    public void setIsstart(Integer isstart) {
        this.isstart = isstart;
    }
}