package com.iblog.service.impl;

import com.iblog.mapper.AttentionMapper;
import com.iblog.pojo.Attention;
import com.iblog.service.AttentionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttentionServiceImpl implements AttentionService {

    @Autowired
    private AttentionMapper attentionMapper;

    // 添加一个 Attention
    @Override
    public void addOneAttention(Attention attention) {
        attentionMapper.addOneAttention(attention);
    }

    // 删除一个 Attention
    @Override
    public void deleteOneAttention(Attention attention) {
        attentionMapper.deleteOneAttention(attention);
    }

    // 查找一个 Attention
    @Override
    public Attention findOneAttention(Attention attention) {
        return attentionMapper.findOneAttention(attention);
    }

    // 找到某个 fuid 的所有 tuid，返回一个 List
    @Override
    public List<Attention> findAttentionListByFuid(int fuid) {
        return attentionMapper.findAttentionListByFuid(fuid);
    }
}
