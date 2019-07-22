package com.iblog.mapper;

import com.iblog.pojo.Review;

import java.util.List;
import java.util.Map;

public interface ReviewMapper {

    // 添加一个评论
    void addOneReview(Review review);

    // 删除某篇文章之后，根据 aid 删除评论
    void deleteReviewByAid(int aid);

    // 对某个评论点赞
    void modifyLikeCountByRid(Map<String, Integer> map);

    // 根据 rid 查找一条评论
    Review findOneReviewByRid(int rid);

    List<Review> reviewListByAid(int aid);
}
