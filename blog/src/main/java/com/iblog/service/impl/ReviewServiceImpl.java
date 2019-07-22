package com.iblog.service.impl;

import com.iblog.mapper.ReviewMapper;
import com.iblog.pojo.Review;
import com.iblog.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public void addOneReview(Review review) {
        reviewMapper.addOneReview(review);
    }

    @Override
    public void deleteReviewByAid(int aid) {
        reviewMapper.deleteReviewByAid(aid);
    }

    @Override
    public void modifyLikeCountByRid(Map<String, Integer> map) {
        reviewMapper.modifyLikeCountByRid(map);
    }

    @Override
    public Review findOneReviewByRid(int rid) {
        return reviewMapper.findOneReviewByRid(rid);
    }

    @Override
    public List<Review> reviewListByAid(int aid) {
        return reviewMapper.reviewListByAid(aid);
    }
}
