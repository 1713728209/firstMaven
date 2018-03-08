package com.jbit.entity;

public class AsLogsWithBLOBs extends AsLogs {
    private String operateinfo;

    private String remark;

    public String getOperateinfo() {
        return operateinfo;
    }

    public void setOperateinfo(String operateinfo) {
        this.operateinfo = operateinfo == null ? null : operateinfo.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}