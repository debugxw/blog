package com.iblog.service;

import com.iblog.pojo.Attention;

import java.util.List;

public interface AttentionService {

    // 增加一个 Attention
    void addOneAttention(Attention attention);

    // 删除一个 Attention
    void deleteOneAttention(Attention attention);

    // 查找一个 Attention
    Attention findOneAttention(Attention attention);

    // 找到某个 fuid 的所有 tuid，返回一个 List
    List<Attention> findAttentionListByFuid(int fuid);
}
