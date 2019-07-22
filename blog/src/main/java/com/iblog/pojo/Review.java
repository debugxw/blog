package com.iblog.pojo;

import com.iblog.util.DateUtil;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
public class Review {

    private int rid;
    private int trid;
    private int aid;
    private int fuid;
    private int likeCount;
    private Timestamp reviewTime;     // ???
    private String content;

    // 额外的信息
    private String fNickname;
    private String tNickname;
    private String originalContent;

    public int getTrid() {
        return trid;
    }

    public void setTrid(int trid) {
        this.trid = trid;
    }

    public String getOriginalContent() {
        return originalContent;
    }

    public void setOriginalContent(String originalContent) {
        this.originalContent = originalContent;
    }

    public String getfNickname() {
        return fNickname;
    }

    public void setfNickname(String fNickname) {
        this.fNickname = fNickname;
    }

    public String gettNickname() {
        return tNickname;
    }

    public void settNickname(String tNickname) {
        this.tNickname = tNickname;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getFuid() {
        return fuid;
    }

    public void setFuid(int fuid) {
        this.fuid = fuid;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public Timestamp getReviewTime() {
        return reviewTime;
    }

    public void setReviewTime(Timestamp reviewTime) {
        this.reviewTime = reviewTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Review{" +
            "rid=" + rid +
            ", aid=" + aid +
            ", fuid=" + fuid +
            ", reviewTime=" + DateUtil.getFormatDateTime(reviewTime) +
            ", content='" + content + '\'' +
            '}';
    }
}
