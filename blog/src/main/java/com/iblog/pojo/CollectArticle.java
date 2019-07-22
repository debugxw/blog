package com.iblog.pojo;

import org.springframework.stereotype.Component;

@Component
public class CollectArticle {

    private int uid;
    private int aid;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }
}
