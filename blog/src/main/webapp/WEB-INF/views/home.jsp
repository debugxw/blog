<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 12803
  Date: 2019/4/18
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>博客首页搜索</title>
    <link rel="stylesheet" href="/resources/css/searchPage.css"/>
    <script src="/resources/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="/resources/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/resources/js/snow.js"></script>
    <script>
        $(document).ready(function () {
            var flag = false;
            $(".menu li").mouseenter(function () {

                var movWidth = $(this).children("a").width();
                var movleft = $(this).width();
                var index = $(".menu li").index(this);
                if (index == 0) {
                    $(".header-blue-block").animate({left: 57 + "px", width: "32px"});
                    return;
                }

                $(".header-blue-block").animate({left: 130 + (index - 1) * 106 + "px", width: "64px"});

            });

            $(".left-selection").mouseenter(function () {
                $(this).children("ul").removeClass("hide");
                $("#arrow").attr("class", "glyphicon glyphicon-triangle-top");

            }).mouseleave(function () {
                $(this).children("ul").addClass("hide");
                $("#arrow").attr("class", "glyphicon glyphicon-triangle-bottom");
            });


            $("#xz-tag li").click(function () {
                var Tag = $(this).children("a").html();
                $("#select-tag").html(Tag);
            });


        });
    </script>

</head>
<body>
<style type='text/css'>
    .snowwrap, .snow-container {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        z-index: 100001;
    }
</style>
<div class="snowwrap">
    <div class="snow-container"></div>
</div>

<div class="bg-star">
</div>
<!--头部-->
<div class="header">
    <div class="pull-left">
        <a href="#nowhere" class="logo-top">
            <img src="/resources/img/login-top.png" width="38px" height="38px"/>
            <span style="font-weight: bolder;font-size: 18px;">博客网站</span>
        </a>
    </div>
    <div class="menu-warp">
        <ul class="menu menu-horizontal">
            <li>
                <a href="#">首页</a>
                <span class="kuai"></span>
            </li>
            <li><a href="#">热点文章</a></li>
            <li><a href="#">科技视界</a></li>
            <li><a href="#">生活纪实</a></li>
            <li><a href="#">艺术情感</a></li>
            <li><a href="#">心灵鸡汤</a></li>
        </ul>
        <div class="header-blue-block" style="left: 57px; width: 32px; overflow: hidden; display: inline-block;"></div>
    </div>
    <div class="pull-right">
        <div class="gzh">
            <a href="#"><img src="/resources/img/weixin-icon.png"></a>
            <a href="#"><img src="/resources/img/weibo-icon.png"></a>
        </div>
    </div>
    <div class="pull-right">
        <div class="login-register">
            <c:if test="${sessionScope.user == null}">
                <a class="login" href="/loginPage">登录</a>
                <a class="register" href="/registerPage">注册</a>
            </c:if>
            <c:if test="${!(sessionScope.user eq null)}">
                <a class="MyHome" href="/person/${sessionScope.user.nickname}">欢迎${sessionScope.user.nickname}</a>
                <a class="register" href="/loginOut">注销</a>
            </c:if>
        </div>
    </div>

</div>
<!--中间-->
<div class="middle">
    <div class="search-box-container">
        <div class="search-box">
            <div class="search-box-inner">
                <div class="left-selection pull-left">
                    <a class="select-tag">
                        <span class="selected" id="select-tag">SpringBoot</span>
                        <span id="arrow" style="position: fixed; left: 542px; top: 281px;"
                              class="glyphicon glyphicon-triangle-bottom"></span>
                    </a>
                    <ul class="hide" id="xz-tag">
                        <li><a href="#">Java</a></li>
                        <li><a href="#">Pyth</a></li>
                        <li><a href="#">C++</a></li>
                        <li><a href="#">Docker</a></li>
                    </ul>
                </div>
                <div class="middle-input pull-left">
                    <div>
                        <input id="search-input" type="text" class="form-control"/>
                    </div>
                </div>
                <div class="right-button pull-left">
                    <a href="#" id="search">搜索文章</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--脚注-->
<div class="footer">
    <div class="l-width">
        <span>Copyright © 1996 - 2019 BlogTX Corporation, All Rights Reserved TX公司 版权所有</span>
        <a href="#">关于我们</a>
    </div>
</div>
</body>
</html>
