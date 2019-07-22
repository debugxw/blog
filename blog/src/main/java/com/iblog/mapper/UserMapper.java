package com.iblog.mapper;

import com.iblog.pojo.User;

import java.util.Map;

public interface UserMapper {

    void addUser(User user);

    void modifyUserPasswordById(Map map);

    void modifyUserPasswordByNickname(Map map);

    User getUserById(int id);

    String getNicknameByUid(int uid);

    User getUserByNickname(String nickname);
}
