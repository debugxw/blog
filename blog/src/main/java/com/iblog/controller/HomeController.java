package com.iblog.controller;

import com.iblog.pojo.User;
import com.iblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class HomeController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "home";
    }

    @RequestMapping(value = "/loginOut", method = RequestMethod.GET)
    public String loginOut(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/home";
    }

    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public String loginPage() {
        return "loginPage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> login(@RequestBody Map<String, String> map,
                     HttpSession session) {
        User user = userService.getUserByNickname(map.get("nickname"));
        Map<String, String> result = new HashMap<>();
        if (user == null)
            result.put("message", "用户不存在");
        else if (!user.getPassword().equals(map.get("password")))
            result.put("message", "密码错误");
        else {
            result.put("message", "登陆成功");
            session.setAttribute("user", user);
        }
        return result;
    }

    @RequestMapping(value = "/registerPage", method = RequestMethod.GET)
    public String registerPage() {
        return "registerPage";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> register(@RequestBody Map<String, String> map,
                                        HttpSession session) {
        User user = userService.getUserByNickname(map.get("nickname"));
        Map<String, String> result = new HashMap<>();
        if (user == null) {
            result.put("message", "注册成功");
            user = new User();
            user.setNickname(map.get("nickname"));
            user.setPassword(map.get("password"));
            userService.addUser(user);
            session.setAttribute("user", user);
        } else
            result.put("message", "用户已存在");

        return result;
    }
}
