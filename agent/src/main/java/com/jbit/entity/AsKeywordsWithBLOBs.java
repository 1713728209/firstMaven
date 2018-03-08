package com.jbit.entity;

public class AsKeywordsWithBLOBs extends AsKeywords {
    private String keywords;

    private String loginurl;

    private String iosdownloadurl;

    private String androiddownloadurl;

    private String codeiosurl;

    private String codeandroidurl;

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getLoginurl() {
        return loginurl;
    }

    public void setLoginurl(String loginurl) {
        this.loginurl = loginurl == null ? null : loginurl.trim();
    }

    public String getIosdownloadurl() {
        return iosdownloadurl;
    }

    public void setIosdownloadurl(String iosdownloadurl) {
        this.iosdownloadurl = iosdownloadurl == null ? null : iosdownloadurl.trim();
    }

    public String getAndroiddownloadurl() {
        return androiddownloadurl;
    }

    public void setAndroiddownloadurl(String androiddownloadurl) {
        this.androiddownloadurl = androiddownloadurl == null ? null : androiddownloadurl.trim();
    }

    public String getCodeiosurl() {
        return codeiosurl;
    }

    public void setCodeiosurl(String codeiosurl) {
        this.codeiosurl = codeiosurl == null ? null : codeiosurl.trim();
    }

    public String getCodeandroidurl() {
        return codeandroidurl;
    }

    public void setCodeandroidurl(String codeandroidurl) {
        this.codeandroidurl = codeandroidurl == null ? null : codeandroidurl.trim();
    }
}