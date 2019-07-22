<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
         isELIgnored="false" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Not Found 404</title>
    <link rel="stylesheet" href="/resources/css/noSuchPage.css"/>
    <script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
    <script>
        $(document).ready(function () {
            setInterval(function () {
                $("#cloud1").animate({
                    left: '100%',
                }, 60000, function () {
                    $("#cloud1").css("left", "-189px");
                });
                $("#cloud2").animate({
                    left: '100%',
                }, 65000, function () {
                    $("#cloud2").css("left", "-69px");
                });
            }, 100);

        });
    </script>
</head>
<body>
<div id="text">
    <h1>404 Not Found | Something's wrong here...</h1>
    <p>Uh oh, We couldn't find a link for the bitly URL you clicked.</p>
    <p>Most Bitlinks are 4-6 characters, and only include letters and numbers (and are case sensitive).</p>
    <p><a href="">click here back</a></p>
</div>
<div id="cloud1"></div>
<div id="cloud2"></div>
<div id="canvs_blue"></div>
<img src="img/sun.png" width="60px" height="60px" id="sun"/>
<ul class="bottomLinkList">
    <li><a href="/home">返回主页</a></li>
    <li><a
            <c:if test="${sessionScope.user != null}">href="/person/${sessionScope.user.nickname}"</c:if>
            <c:if test="${sessionScope.user == null}">href="/loginPage""</c:if> >我的博客</a></li>
    <li><a href="">联系我们</a></li>
    <li class="copy">©<span class="year">2019</span>TXCompany<span class="tm">TM</span></li>
</ul>
</body>
</html>
