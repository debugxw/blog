package com.iblog.service;

import com.iblog.pojo.CollectArticle;

import java.util.List;

public interface CollectArticleService {

    // 添加一个 CollectArticle
    void addOneCollectArticle(CollectArticle collectArticle);

    // 删除一个 CollectArticle
    void deleteOneCollectArticle(CollectArticle collectArticle);

    // 删除文章之后，根据 aid 删除某个 CollectionArticle
    void deleteCollectArticleByAid(int aid);

    // 查找某个 CollectArticle 是否存在
    CollectArticle findOneCollectArticle(CollectArticle collectArticle);

    // 找到某个 uid 收藏的所有文章列表
    List<CollectArticle> findCollectArticleListByUid(int uid);
}
