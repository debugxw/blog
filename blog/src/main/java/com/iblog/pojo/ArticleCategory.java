package com.iblog.pojo;

import org.springframework.stereotype.Component;

@Component
public class ArticleCategory {

    private int acid;
    private String acName;

    public int getAcid() {
        return acid;
    }

    public void setAcid(int acid) {
        this.acid = acid;
    }

    public String getAcName() {
        return acName;
    }

    public void setAcName(String acName) {
        this.acName = acName;
    }

    @Override
    public String toString() {
        return "ArticleCategory{" +
            "acid=" + acid +
            ", acName='" + acName + '\'' +
            '}';
    }
}
