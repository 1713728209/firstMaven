package com.jbit.entity;

public class AsContacts {
    private Integer id;

    private Integer customid;

    private String contactname;

    private String contacttel;

    private String contactfax;

    private String contactemail;

    private String contactrole;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomid() {
        return customid;
    }

    public void setCustomid(Integer customid) {
        this.customid = customid;
    }

    public String getContactname() {
        return contactname;
    }

    public void setContactname(String contactname) {
        this.contactname = contactname == null ? null : contactname.trim();
    }

    public String getContacttel() {
        return contacttel;
    }

    public void setContacttel(String contacttel) {
        this.contacttel = contacttel == null ? null : contacttel.trim();
    }

    public String getContactfax() {
        return contactfax;
    }

    public void setContactfax(String contactfax) {
        this.contactfax = contactfax == null ? null : contactfax.trim();
    }

    public String getContactemail() {
        return contactemail;
    }

    public void setContactemail(String contactemail) {
        this.contactemail = contactemail == null ? null : contactemail.trim();
    }

    public String getContactrole() {
        return contactrole;
    }

    public void setContactrole(String contactrole) {
        this.contactrole = contactrole == null ? null : contactrole.trim();
    }
}