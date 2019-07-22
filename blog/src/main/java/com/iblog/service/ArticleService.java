package com.iblog.service;

import com.iblog.pojo.Article;

import java.util.List;
import java.util.Map;

public interface ArticleService {

    // 增加一篇文章
    void addAnArticle(Article article);

    // 删除一篇文章
    void deleteAnArticle(int aid);

    void modifyArticleByAid(int aid);

    // 修改文章的点赞数
    void modifyLikeCountByAid(Map<String, Integer> map);

    Article findOneArticleByAid(int aid);

    List<Article> articleListByUid(int uid);
}
