package com.iblog.service;

import com.iblog.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    void addUser(User user);

    void modifyUserPasswordById(Map map);

    void modifyUserPasswordByNickname(Map map);

    User getUserById(int id);

    String getNicknameByUid(int uid);

    User getUserByNickname(String nickname);
}
