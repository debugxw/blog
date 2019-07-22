<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
         isELIgnored="false" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>用户的Home</title>
    <link rel="stylesheet" href="/resources/css/userPage.css"/>
    <link rel="stylesheet" href="/resources/css/login_pop.css"/>
    <script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>


    <!-- markdown 解析 -->
    <link rel="stylesheet" href="/resources/css/editor-master/examples/style.css"/>
    <link rel="stylesheet" href="/resources/css/editor-master/css/editormd.css">

    <script src="/resources/js/editormd-master/examples/js/jquery.min.js"></script>
    <script src="/resources/js/editormd-master/lib/marked.min.js"></script>
    <script src="/resources/js/editormd-master/lib/prettify.min.js"></script>
    <script src="/resources/js/editormd-master/lib/raphael.min.js"></script>
    <script src="/resources/js/editormd-master/lib/underscore.min.js"></script>
    <script src="/resources/js/editormd-master/lib/sequence-diagram.min.js"></script>
    <script src="/resources/js/editormd-master/lib/flowchart.min.js"></script>
    <script src="/resources/js/editormd-master/lib/jquery.flowchart.min.js"></script>
    <script src="/resources/js/editormd-master/editormd.js"></script>

    <script>
        $(document).ready(function () {

            //判断sessionuser是否为空
            var user = '${sessionScope.user}';
            var isNullUser = '${sessionScope.user}';
            // alert($.isEmptyObject(user));


            var isgz = false;
            $("#gz_author").click(function () {
                var gz_author = $(this);
                if ($.isEmptyObject(user)) {
                    $('.login-pop').fadeIn(1000);
                    return false;
                }
                if (!isgz) {
                    //发送关注作者ajax请求 需要user_id
                    var g_text = gz_author.html();
                    if (g_text == "已关注") {
                        return false;
                    } else {

                        var fuid = '${sessionScope.user.uid}';
                        var author_id = $(".header-author").find("a").attr("id");
                        alert(fuid + " " + author_id);
                        var para = {'fuid': fuid, 'tuid': author_id};

                        $.ajax({
                            url: "/attentionSomeone",
                            type: "post",
                            dataType: "json",
                            contentType: 'application/json;charset=utf-8',
                            data: JSON.stringify(para),
                            async: true,
                            success: function (data) {
                                gz_author.html("已关注");
                                gz_author.css("color", "#C40000");
                                isgz = true;
                            },
                            error: function () {
                                alert("网络异常请稍后再试");
                            }
                        });
                    }
                }
            });


            //登录窗口
            $('#login-button').click(function (event) {
                event.preventDefault();
                //这里是登录的时候去发送ajax请求
                var accountname = $("#LoginName").val();
                var passwd = $("#Password").val();
                var para = {'nickname': accountname, 'password': passwd};
                $.ajax({
                    url: "/login",
                    type: "post",
                    dataType: "json",
                    contentType: 'application/json;charset=utf-8',
                    data: JSON.stringify(para),
                    async: true,
                    success: function (data) {
                        // alert(data.message);
                        if (data.message == "登陆成功") {
                            $('form').fadeOut(1500);
                            $('.wrapper').addClass('form-success');
                            $('.login-pop').fadeOut(2000);
                            window.location.reload();
                        }
                    },
                    error: function () {
                        alert("网络异常请稍后再试");
                        $('.login-pop').fadeOut(2000);
                    }
                });

            });


            //菜单
            var tools_col = $(".tools-col");
            var mid_col = $(".mid-col");
            var left_col = $(".left-col");
            var container = $("#container");
            var all_articals = $(".tools-section-all");
            var about_me = $(".tools-section-me");
            var MySced_Articals = $(".tools-section-scedArticals");
            var MyGzed_Authors = $(".tools-section-gzedAuthors");
            var close_muenu = $(".close_muenu");
            ishow = false;
            $("#all_artical").click(function () {
                if (!ishow) {
                    tools_col.removeClass("hide");
                    tools_col.addClass("show");
                    mid_col.removeClass("hide");
                    mid_col.addClass("show");
                    left_col.addClass("show");
                    mid_col.animate({
                        left: '660px',
                        right: '-300px'
                    }, 300);
                    tools_col.animate({
                        left: '300px'
                    }, 300);
                    container.addClass("show");
                }
                all_articals.show();
                about_me.hide();
                MySced_Articals.hide();
                MyGzed_Authors.hide();
                ishow = true;
            });
            $("#about_me").click(function () {
                if (!ishow) {
                    tools_col.removeClass("hide");
                    tools_col.addClass("show");
                    mid_col.removeClass("hide");
                    mid_col.addClass("show");
                    left_col.addClass("show");
                    mid_col.animate({
                        left: '660px',
                        right: '-300px'
                    });
                    tools_col.animate({
                        left: '300px'
                    });
                    container.addClass("show");
                }
                all_articals.hide();
                MySced_Articals.hide();
                MyGzed_Authors.hide();
                about_me.show();
                ishow = true;
            });

            $("#My_ScedArticals").click(function () {
                if (!ishow) {
                    tools_col.removeClass("hide");
                    tools_col.addClass("show");
                    mid_col.removeClass("hide");
                    mid_col.addClass("show");
                    left_col.addClass("show");
                    mid_col.animate({
                        left: '660px',
                        right: '-300px'
                    });
                    tools_col.animate({
                        left: '300px'
                    });
                    container.addClass("show");
                }
                all_articals.hide();
                MyGzed_Authors.hide();
                about_me.hide();
                MySced_Articals.show();
                ishow = true;
            });
            $("#My_GzedAuthors").click(function () {
                if (!ishow) {
                    tools_col.removeClass("hide");
                    tools_col.addClass("show");
                    mid_col.removeClass("hide");
                    mid_col.addClass("show");
                    left_col.addClass("show");
                    mid_col.animate({
                        left: '660px',
                        right: '-300px'
                    });
                    tools_col.animate({
                        left: '300px'
                    });
                    container.addClass("show");
                }
                all_articals.hide();
                MySced_Articals.hide();
                about_me.hide();
                MyGzed_Authors.show();
                ishow = true;
            });


            $(".close_muenu").click(function () {
                ishow = false;

                tools_col.animate({
                    left: '0px'
                }, 300);

                mid_col.animate({
                    left: '300px',
                    right: '0px'
                }, 300, function () {
                    tools_col.removeClass("show");
                    tools_col.addClass("hide");
                    mid_col.removeClass("show");
                    mid_col.addClass("hide");
                    left_col.removeClass("show");
                    container.removeClass("show");
                });

            });

        });

        <!-- markdown 解析 -->
        window.onload = function () {
            var artCount = $("#artCount").html();
            for (i = 0; i < artCount; i++) {
                editormd.markdownToHTML("article-entry" + i, {
                    htmlDecode: "style,script,iframe",
                    emoji: true,
                    taskList: true,
                    tex: true,  // 默认不解析
                    flowChart: true,  // 默认不解析
                    sequenceDiagram: true  // 默认不解析
                });
            }
        }
    </script>
</head>

<body>
<div id="container" style="height: 632px;">

    <!--左边固定为个人展示-->
    <div class="left-col">
        <div class="overlay" style="background: #4d4d4d;"></div>
        <div class="intrude">
            <header id="header" class="inner">
                <a href="/home" class="profilepic">
                    <img src="/resources/img/boke.png"/>
                </a>
                <h1 class="header-author">
                    <a href="/person/${user.nickname}" id="${user.uid}">${user.nickname}</a>
                </h1>
                <p class="header-subtitle">
                    ${user.userInfo.personalizedSignature}
                </p>
                <nav class="header-menu">
                    <ul>
                        <c:if test="${!(sessionScope.user.nickname eq user.nickname)}">
                            <li><a href="/person/${user.nickname}">主页</a></li>
                            <%--<li><a href="#" id="gz_author">关注</a></li>--%>
                            <li><a class="collectAuthor" href="#" id="gz_author"><c:if
                                    test="${isAttention == 0}">关注</c:if><c:if test="${isAttention == 1}">已关注</c:if></a></li>
                        </c:if>
                        <c:if test="${sessionScope.user.nickname eq user.nickname}">
                            <li><a href="/person/${user.nickname}">主页</a></li>
                            <!-- 只有当进来是自己的页面才显示这些 -->
                            <li><a href="#" id="My_ScedArticals">我的收藏</a></li>
                            <li><a href="#" id="My_GzedAuthors">我的关注</a></li>


                            <li>
                                <%--<a href="#" id="Online_Editor">在线编辑</a>--%>
                                <%--<span style="color: #696969;">&nbsp;|&nbsp;</span>--%>
                                <a href="/showFileUploadPage" id="Upload_Articals">本地上传</a>
                            </li>
                        </c:if>

                    </ul>

                </nav>
                <nav class="header-smart-menu">
                    <a id="all_artical" href="#">所有文章</a>
                    <span style="color: #696969;">&nbsp;/&nbsp;</span>
                    <a id="about_me" href="#">关于我</a>
                </nav>
                <nav class="header-nav">
                    <a class="github" href="#" title="github">
                        <img src="/resources/img/github.png"/>
                    </a>
                    <a class="weibo" href="#" title="weibo">
                        <img src="/resources/img/weibo.png"/>
                    </a>
                    <a class="rss" href="#" title="rss">
                        <img src="/resources/img/rss.png"/>
                    </a>
                    <a class="zhihu" href="#" title="zhihu">
                        <img src="/resources/img/zhihu.png"/>
                    </a>
                </nav>
            </header>

        </div>

    </div>

    <!--右边界面-->
    <div class="mid-col">
        <div id="wrapper" class="body-wrap">
            <div class="menu-l">
                <!--遮罩层-->
                <div id="canvas-wrap"></div>
                <!--内容填充的文章菜单-->
                <div id="js-content" class="content-ll">
                    <c:forEach items="${articleList}" var="art">
                        <article id="${art.aid}" class="article article-type-post article-index">
                            <div class="article-inner">
                                <header class="article-header">
                                    <h1><a class="article-title">${art.title}</a></h1>
                                    <a class="archive-article-date">${art.publishTime}</a>
                                </header>
                                <!--填充内容-->
                                <div class="article-entry" id="${art.article_entry}">
                                <textarea style="display:none; width: 80%;"
                                          placeholder="markdown语言">${art.articleAbstract}</textarea>
                                </div>
                                <div class="article-info article-info-index">
                                    <img class="tag_left" src="/resources/img/bq_tag.png" width="18px" height="18px"/>
                                    <a class="tag-icon tag_left" href="#">${art.tag}</a>
                                    <p class="article-more-link">
                                        <a class="article-more-a" href="/person/${user.nickname}/articleDetail?aid=${art.aid}">展开全文
                                            >></a>
                                    </p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </article>
                    </c:forEach>
                    <div id="artCount" style="display: none">${articleList.size()}</div>
                </div>
            </div>
        </div>

        <footer id="footer">
            <div class="outer">
                <div id="footer-info">
                    <div class="footer-left">© 本网站版权所有XT公司</div>
                    <div class="footer-right">你我天涯 咫尺分享</div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </footer>
    </div>

    <!--弹出框菜单-->
    <div class="tools-col hide">
        <div class="tools-wrap">
            <a class="close_muenu" title="关闭菜单"><img src="/resources/img/close.png"></a>
            <!--所有文章和个性签名-->
            <section class="tools-section tools-section-all">
                <h2>所有文章</h2>
                <ul class="search-ul">
                    <c:forEach items="${articleList}" var="art">
                        <li class="search-li">
                            <a class="search-title" href="/person/${user.nickname}/articleDetail?aid=${art.aid}">
                                <span class="wenzhang-icon"></span>
                                <span>${art.title}</span>
                            </a>
                            <p class="search-time">
                                <i class="rili-icon"></i>
                                <span>${art.publishTime}</span>
                            </p>
                            <c:if test="${sessionScope.user.nickname eq user.nickname}">
                                <p><a class="delete_btn"
                                      href="/deleteArticle?aid=${art.aid}"
                                      title="取消关注">删除
                                </a></p>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </section>
            <section class="tools-section tools-section-me" style="display: none;">
                <div id="js-aboutme" class="aboutme-wrap">
                    ${user.userInfo.individualResume}
                </div>
            </section>
            <%--把下面的两个section做一下C标签--%>
            <section class="tools-section tools-section-scedArticals" style="display: none;">
                <h2>我收藏的文章</h2>
                <c:forEach items="${collectArticleList}" var="cal">
                    <ul class="search-ul">
                        <li class="search-li">
                            <a class="search-title" href="/person/${cal.author}/articleDetail?aid=${cal.aid}">
                                <span class="wenzhang-icon"></span>
                                <span>${cal.title}</span>
                            </a>
                            <p class="search-time">
                                <i class="rili-icon"></i>
                                <span>${cal.publishTime}</span>
                            </p>
                        </li>
                    </ul>
                </c:forEach>
            </section>
            <section class="tools-section tools-section-gzedAuthors" style="display: none;">
                <h2>我关注的作者</h2>
                <ul class="search-ul">
                    <c:forEach items="${attentionList}" var="al">
                        <li class="search-li">
                            <div class="head_img">
                                <a href="#" id="${al.uid}"></a>
                            </div>
                            <div class="his_xinxi">
                                <a href="#" class="his_name">${al.nickname}</a>
                                <p class="his_qm">${al.userInfo.personalizedSignature}
                                </p>
                                <p><a class="delete_btn"
                                      href="/cancelAttention?fuid=${sessionScope.user.uid}&tuid=${al.uid}"
                                      title="取消关注">删除
                                </a></p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </section>


        </div>
    </div>
</div>

<!--登录弹出层-->
<div class="login-pop" style="display: none;">
    <div class="wrapper">
        <div class="container">
            <h1>Welcome</h1>
            <form class="form">
                <input type="text" placeholder="Username" id="LoginName">
                <input type="password" placeholder="Password" id="Password">
                <button type="submit" id="login-button">Login</button>
            </form>
        </div>
        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
</body>
</html>
