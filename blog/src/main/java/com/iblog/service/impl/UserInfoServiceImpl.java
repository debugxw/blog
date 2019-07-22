package com.iblog.service.impl;

import com.iblog.mapper.UserInfoMapper;
import com.iblog.pojo.UserInfo;
import com.iblog.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Override
    public UserInfo getUserInfoById(int uiid) {
        return userInfoMapper.getUserInfoById(uiid);
    }
}
