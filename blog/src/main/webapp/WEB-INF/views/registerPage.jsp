<%--
  Created by IntelliJ IDEA.
  User: 12803
  Date: 2019/5/16
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="/resources/css/tip-/tip-yellowsimple.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/sweetayellowsimplelert.css"/>
    <script type="text/javascript" src="/resources/js/sweetalert.min.js"></script>
    <style>
        body {
            background: #fcfcfc;
            font: 14px Arial, Helvetica, sans-serif;
            color: #333;
            list-style: none;
        }

        ul,
        li,
        p {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        #form {
            width: 500px;
            margin: auto;
            padding: 5px;
            margin-top: 50px;
            border: 1px solid #999999;
            border-radius: 5px;
        }

        #form > p {
            margin: 20px 0;
            overflow: hidden;

        }

        #form > p > input {
            display: block;
            width: 320px;
            height: 52px;
            padding-left: 5px;
            border-radius: 3px;
            outline: none;
            border: 1px solid #dedede;
            background: #FFFFFF;
            line-height: 32;
            font-size: 16px;
            margin: auto;

        }

        #yanzhengma {
            float: left;
            width: 180px;

        }

        #form > p > button {
            display: inline;
            margin-left: 15px;
            width: 100px;
            height: 52px;
            font-size: 14px;
            text-align: center;
            float: left;
            background-color: #57565F;
            color: #FFF;
            font-weight: bold;
            border: none;
            border-radius: 3px;
            margin-left: 100px;

        }

        #form > p > input[type=submit] {
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
            margin-top: 25px;
        }

        #form > p > input[type=submit]:hover {

            background-color: #ff1010;
        }

        #form > p > img {
            position: absolute;
            margin-left: 440px;
            margin-top: -50px;
            display: none;
        }

        #simplefooter {
            position: fixed;
            bottom: 20px;
            width: 100%;
            margin: 20px auto 0;
            text-align: center;
            margin-top: 40px;
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
    </style>
    <script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.poshytip.js"></script>
    <script>
        $(document).ready(function () {
            $('#account').poshytip({
                className: 'tip-yellowsimple',
                showOn: 'focus',
                alignTo: 'target',
                alignX: 'right',
                alignY: 'center',
                offsetX: 5
            });
            $('#pwd').poshytip({
                className: 'tip-yellowsimple',
                showOn: 'focus',
                alignTo: 'target',
                alignX: 'right',
                alignY: 'center',
                offsetX: 5
            });
            $('#pwd1').poshytip({
                className: 'tip-yellowsimple',
                showOn: 'focus',
                alignTo: 'target',
                alignX: 'right',
                alignY: 'center',
                offsetX: 5
            });

            $("#register").click(function () {
                var account = $("#account").val();
                var pwd = $("#pwd").val();
                var checkpwd = $("#pwd1").val();
                if (account == "" || account == null) {
                    swal("用户名非法", "用户名不能为空!", "warning");
                    return;
                }
                if (pwd != checkpwd) {
                    swal("密码输入出错!", "前后输入密码不一致!", "warning");
                    return;
                } else {
                    register(account, pwd);
                }
            });

            function register(account, passwd) {
                $.ajax({
                    type: "post",
                    url: "/register",
                    dataType: "json",
                    contentType: 'application/json;charset=utf-8',
                    data: JSON.stringify({
                        "nickname": account,
                        "password": passwd
                    }),
                    async: true,
                    success: function (data) {
                        alert(JSON.stringify(data));
                        if(data.message == "注册成功") {
                            window.location.href = "/loginPage";
                        }
                    }, error: function () {
                        swal("警告", "发生意外错误,请保持与服务器连接...", "error");
                    }
                });
            }


        });
    </script>
</head>

<body>
<div class="regist_header">
    <a href="/home" class="logo">
        <img src="/resources/img/boke.png" height="60px"/>
    </a>
    <div class="biaoyu"><span>你我天涯</span><span>咫尺分享</span></div>
</div>

<div id="form">
    <h1 style="text-align: center; margin: 30px 0;">TX博客账号注册</h1>
    <p><input type="account" placeholder="用户名" id="account" title="请输入合法手机号或邮箱!"/></p>
    <p><input type="password" placeholder="密码" id="pwd" title="请输入密码 要求8~15位!"/></p>
    <p><input type="password" placeholder="确认密码" id="pwd1" title="请再次输入密码!"/></p>
    <p><input type="submit" value="注册" id="register"/></p>
</div>
<div id="simplefooter">
    <a href="">沪ICP备16050468号</a>
    |
    <a>沪B2-20170039</a>
    |
    <a href="">营业执照</a>
    <p style="">Copyright © 1996 - 2019 BlogTX Corporation, All Rights Reserved TX公司 版权所有</p>
</div>

</body>

</html>
