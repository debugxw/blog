package com.iblog.service.impl;

import com.iblog.mapper.CollectArticleMapper;
import com.iblog.pojo.CollectArticle;
import com.iblog.service.CollectArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectArticleServiceImpl implements CollectArticleService {

    @Autowired
    private CollectArticleMapper collectArticleMapper;

    @Override
    public void addOneCollectArticle(CollectArticle collectArticle) {
        collectArticleMapper.addOneCollectArticle(collectArticle);
    }

    @Override
    public void deleteOneCollectArticle(CollectArticle collectArticle) {
        collectArticleMapper.deleteOneCollectArticle(collectArticle);
    }

    @Override
    public void deleteCollectArticleByAid(int aid) {
        collectArticleMapper.deleteCollectArticleByAid(aid);
    }

    @Override
    public CollectArticle findOneCollectArticle(CollectArticle collectArticle) {
        return collectArticleMapper.findOneCollectArticle(collectArticle);
    }

    @Override
    public List<CollectArticle> findCollectArticleListByUid(int uid) {
        return collectArticleMapper.findCollectArticleListByUid(uid);
    }
}
