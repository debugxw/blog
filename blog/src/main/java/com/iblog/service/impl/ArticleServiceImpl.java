package com.iblog.service.impl;

import com.iblog.mapper.ArticleMapper;
import com.iblog.pojo.Article;
import com.iblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public void addAnArticle(Article article) {
        articleMapper.addAnArticle(article);
    }

    @Override
    public void deleteAnArticle(int aid) {
        articleMapper.deleteAnArticle(aid);
    }

    @Override
    public void modifyArticleByAid(int aid) {
        articleMapper.modifyArticleByAid(aid);
    }

    @Override
    public void modifyLikeCountByAid(Map<String, Integer> map) {
        articleMapper.modifyLikeCountByAid(map);
    }

    @Override
    public Article findOneArticleByAid(int aid) {
        return articleMapper.findOneArticleByAid(aid);
    }

    @Override
    public List<Article> articleListByUid(int uid) {
        return articleMapper.articleListByUid(uid);
    }
}
