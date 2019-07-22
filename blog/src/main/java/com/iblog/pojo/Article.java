package com.iblog.pojo;

import org.springframework.stereotype.Component;

import java.sql.Date;
import java.util.List;

@Component
public class Article {

    private int aid;
    private int acid;
    private int uid;
    private String title;
    private String tag;
    private Date publishTime;
    private int likeCount;
    private int scanCount;
    private String content;

    private List<Review> reviewList;

    // 数据库表之外的信息
    // 文章摘要
    private String articleAbstract;
    // article-entry + aid
    private String article_entry;
    // 作者
    private String author;

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public List<Review> getReviewList() {
        return reviewList;
    }

    public void setReviewList(List<Review> reviewList) {
        this.reviewList = reviewList;
    }

    public String getArticle_entry() {
        return article_entry;
    }

    public void setArticle_entry(String article_entry) {
        this.article_entry = article_entry;
    }

    public String getArticleAbstract() {
        return articleAbstract;
    }

    public void setArticleAbstract(String articleAbstract) {
        this.articleAbstract = articleAbstract;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getAcid() {
        return acid;
    }

    public void setAcid(int acid) {
        this.acid = acid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public int getScanCount() {
        return scanCount;
    }

    public void setScanCount(int scanCount) {
        this.scanCount = scanCount;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
