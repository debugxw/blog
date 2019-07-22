package com.iblog.pojo;

import org.springframework.stereotype.Component;

@Component
public class Attention {

    private int fuid;
    private int tuid;

    public int getFuid() {
        return fuid;
    }

    public void setFuid(int fuid) {
        this.fuid = fuid;
    }

    public int getTuid() {
        return tuid;
    }

    public void setTuid(int tuid) {
        this.tuid = tuid;
    }
}
