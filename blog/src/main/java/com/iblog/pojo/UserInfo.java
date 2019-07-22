package com.iblog.pojo;

import org.springframework.stereotype.Component;

import java.sql.Date;

@Component
public class UserInfo {

    private int uiid;
    private String sex;
    private Date birthday;
    private String individualResume;
    private String personalizedSignature;

    public int getUiid() {
        return uiid;
    }

    public void setUiid(int uid) {
        this.uiid = uid;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getIndividualResume() {
        return individualResume;
    }

    public void setIndividualResume(String individualResume) {
        this.individualResume = individualResume;
    }

    public String getPersonalizedSignature() {
        return personalizedSignature;
    }

    public void setPersonalizedSignature(String personalizedSignature) {
        this.personalizedSignature = personalizedSignature;
    }
}
