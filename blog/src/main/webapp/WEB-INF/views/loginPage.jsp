<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <script src="resources/js/jquery-1.7.2.min.js"></script>
    <script src="resources/js/jquery.anoslide.js"></script>
    <link rel="stylesheet" href="resources/css/sweetalert.css"/>
    <script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
    <style type="text/css">
        body {
            background: #fcfcfc;
            font: 14px Arial, Helvetica, sans-serif;
            color: #333;
            list-style: none;

        }

        ul,
        li, p {
            padding: 0px;
            margin: 0px;
            list-style: none;
        }

        a:hover {
            color: #c40000;
        }

        .regist_header {
            padding: 16px;
            background: #FFF;
            border: 1px solid #e1e1e1;
            box-shadow: 5px 5px 5px #ddd;
            text-align: center;
        }

        .regist_header span {
            display: inline-block;
            font-size: 30px;
            font-weight: bolder;
            font-family: "楷体";
            padding-right: 50px;
            padding-top: 10px;
            text-shadow: 5px 5px 5px #104E8B;
            vertical-align: middle;
            margin: auto;
            color: deepskyblue;
        }

        .regist_header:after {
            content: "";
            display: block;
            clear: both;
        }

        .regist_header_right:after {
            content: "";
            display: block;
            clear: both;
        }

        a {
            text-decoration: none;
            color: #333;
        }

        .logo {
            display: block;
            float: left;
            width: 54px;
            height: 60px;
        }

        .biaoyu {
            height: 60px;
        }

        .regist_header_right {
            float: right;
            line-height: 18px;
            font-family: "SimSun";
            color: #999;
        }

        .help_wrap {
            position: relative;
            z-index: 1010;
            float: right;
            padding: 0 6px;
            margin-left: 25px;
        }

        .hd_menu_list {
            display: none;
            position: absolute;
            z-index: -1;
            top: 0px;
            right: 0;
            width: 98px;
            padding-top: 21px;
            border: 1px solid #ccc;
            text-align: center;
            background-color: #FCFCFC;
        }

        .hd_menu_list > ul > li {
            line-height: 18px;
            font-family: "SimSun";
            color: #999;
            border-bottom: dotted lavender 1px;
        }

        div.help_wrap:hover > div {
            visibility: visible;
            display: block;
        }

        #simplefooter {
            position: fixed;
            bottom: 20px;
            width: 100%;
            margin: 20px auto 0;
            text-align: center;
            margin-top: 40px;
        }

        .warp {
            width: 1100px;
            margin: 0 auto;
        }

        .warp:after {
            content: "";
            display: block;
            clear: both;
        }

        .mod_left_banner {
            margin-top: 45px;
            width: 510px;
            height: 315px;
            float: left;
        }

        .clearfix:after {
            content: "";
            display: block;
            clear: both;
        }

        .clearfix h3 {
            float: left;
            font-size: 18px;
            color: #666;
            font-weight: bold;
            line-height: 30px;
            margin: 0px;
        }

        .clearfix a {
            float: right;
            line-height: 50px;
        }

        .form_item_wrap {
            width: 330px;
            margin: 0 auto;
        }

        .joint_landing_wrap {
            position: relative;
            z-index: 10;
            padding: 0px;
            margin: 0px;
        }

        .login_pc {
            width: 330px;
            height: 359px;
        }

        .mod_login_wrap {
            position: relative;
            _display: inline;
            float: right;
            width: 330px;
            padding: 45px 35px 0 35px;
            background-color: #fff;
            border: 1px solid #999999;
            padding-bottom: 20px;
            border-radius: 5px;
        }

        .login_form {
            position: relative;
            padding: 0 0 18px;
        }

        .form_item {
            z-index: 101;
            border: 1px solid #aaa;
            position: relative;
            height: 24px;
            margin-bottom: 10px;
            padding: 14px 18px;
            border: 1px solid #dedede;
            background: #FFF;
            line-height: 24px;
        }

        .user_ico {
            display: inline-block;
            width: 42px;
            height: 24px;
            vertical-align: middle;
            color: #666;
            background: url(/resources/img/login_new.png) no-repeat -50px 4px;
        }

        .paswd_ico {
            display: inline-block;
            width: 42px;
            height: 24px;
            vertical-align: middle;
            color: #666;
            background: url(/resources/img/login_new.png) no-repeat -150px 4px;
        }

        .form_item > input {
            width: 230px;
            height: 24px;
            padding-left: 3px;
            border: 0 none;
            line-height: 24px;
            vertical-align: middle;
            font-family: "Microsoft YaHei";
            font-size: 14px;
        }

        .auto_login {
            position: relative;
            margin: 10px 0;
            line-height: 24px;
            min-height: 24px;
            max-height: 24px;
        }

        .auto_login > a:first-child {
            float: left;
            vertical-align: middle;

        }

        .auto_login > a:first-child > input {
            margin: 0px;
            margin-left: 5px;
            margin-right: 5px;
            height: 15px;
            width: 15px;
            vertical-align: middle;

        }

        .auto_login > a:last-child {
            position: absolute;
            right: 0;
            top: 0;
            color: #999;
        }

        .login_btn {
            width: 330px;
            height: 52px;
            border: 0 none;
            border-radius: 3px;
            background-color: #ff3c3c;
            font-size: 16px;
            color: #fff;
            cursor: pointer;
            text-shadow: 1px 1px 1px #ff7373;
            font-family: "Microsoft YaHei";
            line-height: 52px;
        }

        .login_btn:hover {
            background-color: #ff1010;
        }

        .account_list li {
            float: left;
            margin: 0 20px 0 0;
        }

        .account_list > li > a {
            display: inline-block;
            width: 26px;
            height: 26px;
            line-height: 26px;
        }

        .account_list > li:nth-child(1) > a {
            background: url(/resources/img/l_1.png) no-repeat;
        }

        .account_list > li:nth-child(2) > a {
            background: url(/resources/img/l_2.png) no-repeat;
        }

        .account_list > li:nth-child(3) > a {
            background: url(/resources/img/l_3.png) no-repeat;
        }

        .account_list > li:nth-child(4) > a {
            background: url(/resources/img/l_4.png) no-repeat;
        }

        .account_list > li:nth-child(1) > a:hover {
            background: url(/resources/img/l_1_h.png) no-repeat;
        }

        .account_list > li:nth-child(2) > a:hover {
            background: url(/resources/img/l_2_h.png) no-repeat;
        }

        .account_list > li:nth-child(3) > a:hover {
            background: url(/resources/img/l_3_h.png) no-repeat;
        }

        .account_list > li:nth-child(4) > a:hover {
            background: url(/resources/img/l_4_h.png) no-repeat;
        }

        /*判断输入*/
        .form_item > p {

            width: 15px;
            height: 15px;
            float: right;
        }

        .form_item > p > img {
            display: none;
        }

        /*轮播图片*/
        .carousel {
            position: relative;
            width: 550px;
            height: 320px;
            margin: 0 auto;
            background: url(/resources/images/loader.gif) center center no-repeat;
        }

        .carousel .next, .carousel .prev {
            display: none;
            position: absolute;
            bottom: -20px;
            left: 50%;
            width: 56px;
            height: 56px;
            margin-top: -28px;
            z-index: 9999;
            cursor: pointer;
        }

        .carousel li {
            display: none;
        }

        .carousel li img {
            display: block;
            width: 100%;
            border: 0 none;
        }

    </style>
    <script>

        $(document).ready(function () {
            $('.carousel ul').anoSlide({
                items: 1,
                speed: 500,
                auto: 2000
            });
            $("#login").click(function () {
                var accountname = $("#user").val();
                var passwd = $("#paswd").val();
                if (accountname == "" || accountname == null
                    || passwd == "" || passwd == null) {
                    swal("用户名或密码不能为空!", "请输入正确的用户名和密码!", "warning");
                    return;
                }

                login();
            });

            function login() {
                var accountname = $("#user").val();
                var passwd = $("#paswd").val();
                $.ajax({
                    url: "/login",
                    type: "post",
                    dataType: "json",
                    contentType:'application/json;charset=utf-8',
                    data: JSON.stringify({
                        'nickname': accountname,
                        'password': passwd
                    }),
                    async: true,
                    success: function () {
                        window.location.href = "/person/" + accountname;
                    },
                    error: function () {
                        alert("登录失败！");
                    }
                });
                return false;
            }
        });

    </script>
</head>

<body>
<div class="regist_header">
    <a href="/home" class="logo">
        <img src="resources/img/boke.png" height="60px"/>
    </a>
    <div class="biaoyu"><span>你我天涯</span><span>咫尺分享</span></div>
</div>
<div class="login_wrap" style="padding: 26px 0 0;">
    <div class="warp">
        <div class="mod_login_wrap">
            <div class="login_pc">
                <div class="clearfix">
                    <h3>用户登录</h3>
                    <a href="register.html" style="line-height: 60px;">注册新账号</a>
                </div>
                <div class="login_form">
                    <div class="form_item_wrap">
                        <div class="form_item">
                            <label class="user_ico" for="user"></label>
                            <input type="text" style="outline: none;" tabindex="1" id="user" placeholder="用户名/手机号/邮箱"/>

                        </div>
                        <div class="form_item">
                            <label class="paswd_ico" for="paswd"></label>
                            <input type="password" style="outline: none;" tabindex="2" id="paswd" placeholder="密码"/>
                        </div>
                        <div class="auto_login clearfix">
                            <a><input type="checkbox"/>自动登录</a>
                            <a href="">忘记密码?</a>
                        </div>
                        <button class="login_btn" type="button" id="login">登录</button>
                    </div>
                    <div class="joint_landing_wrap">
                        <p style="padding: 15px 0;">更多合作网站帐号登录</p>
                        <div class="clearfix">
                            <ul class="account_list" style="float: left; width: 230px;">
                                <li><a href=""></a></li>
                                <li><a href=""></a></li>
                                <li><a href=""></a></li>
                                <li><a href=""></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mod_left_banner">

            <div class="carousel">
                <ul>
                    <li><a href="javascript:"><img src="resources/images/1.jpg"></a></li>
                    <li><a href="javascript:"><img src="resources/images/2.jpg"></a></li>
                    <li><a href="javascript:"><img src="resources/images/3.jpg"></a></li>
                    <li><a href="javascript:"><img src="resources/images/4.jpg"></a></li>
                    <li><a href="javascript:"><img src="resources/images/5.jpg"></a></li>
                    <li><a href="javascript:"><img src="resources/images/6.jpg"></a></li>
                    <li><a href="javascript:"><img src="resources/images/7.jpg"></a></li>
                </ul>
            </div>

        </div>
    </div>
</div>
<div id="simplefooter">
    <a href="">沪ICP备16050468号</a>
    |
    <a>沪B2-20170039</a>
    |
    <a href="">营业执照</a>
    <p>Copyright © 1996 - 2019 BlogTX Corporation, All Rights Reserved TX公司 版权所有</p>
</div>
</body>
</html>
