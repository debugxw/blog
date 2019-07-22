package com.iblog.util;

import com.iblog.pojo.Article;

import java.util.List;

public class ArticleUtil {

    public static void setArticleAbstract(List<Article> articleList) {
        int count = 0;
        for (Article article : articleList) {
            String content = article.getContent();
            int index = content.indexOf('<');
            if (index != -1)
                article.setArticleAbstract(content.substring(0, index));
            else
                article.setArticleAbstract(content.substring(0, 200));
            // 设置 article-entry
            article.setArticle_entry("article-entry" + count++);
        }
    }
}
