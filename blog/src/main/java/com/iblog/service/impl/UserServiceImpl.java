package com.iblog.service.impl;

import com.iblog.cacheservce.UserCacheService;
import com.iblog.mapper.UserMapper;
import com.iblog.pojo.User;
import com.iblog.service.UserService;
import com.iblog.util.ObjectTransformUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserCacheService userCacheService;

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public void modifyUserPasswordById(Map map) {
        userMapper.modifyUserPasswordById(map);
    }

    @Override
    public void modifyUserPasswordByNickname(Map map) {
        userMapper.modifyUserPasswordByNickname(map);
    }

    @Override
    public User getUserById(int id) {
        User user;
        String userString = userCacheService.get("user_" + id);
        if (StringUtils.isEmpty(userString)) {
            System.out.println("user is not in redis");
            user = userMapper.getUserById(id);
            if (user != null)
                userCacheService.set("user_" + id, ObjectTransformUtils.toString(user));
        } else {
            System.out.println("user is in redis");
            user = ObjectTransformUtils.toObject(userString, User.class);
        }

        return user;
    }

    @Override
    public String getNicknameByUid(int uid) {
        return userMapper.getNicknameByUid(uid);
    }

    @Override
    public User getUserByNickname(String nickname) {
        return userMapper.getUserByNickname(nickname);
    }
}
