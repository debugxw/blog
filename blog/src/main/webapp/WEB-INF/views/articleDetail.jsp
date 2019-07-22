<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
         isELIgnored="false" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ArticleDetail</title>
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

            //获取session User
            var user_id = '${sessionScope.user.uid}';
            var user_name = '${sessionScope.user.nickname}';

            //文章作者的ID 和 名字
            var author_id = $(".author_info").attr("id");
            var author_name = $(".author_info").html();
            console.log(author_id + " " + author_name);


            var article_id = $(".article").attr("id");


            console.log(user_id + " " + user_name);
            var tools_col = $(".tools-col");
            var mid_col = $(".mid-col");
            var left_col = $(".left-col");
            var container = $("#container");
            var all_articals = $(".tools-section-all");
            var about_me = $(".tools-section-me");
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
                about_me.show();
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

            //对文章的评论
            $(".post_cmt").click(function () {
                //先查登录状态 没有的话就弹出login登录窗口
                //获取当前时间
                myDate = new Date();
                var year = myDate.getFullYear();        //获取当前年
                var month = myDate.getMonth() + 1;   //获取当前月
                var day = myDate.getDate();            //获取当前日
                var h = myDate.getHours();              //获取当前小时数(0-23)
                var m = myDate.getMinutes();          //获取当前分钟数(0-59)
                if (h < 10) {
                    h = "0" + h;
                }
                if (m < 10) {
                    m = "0" + m;
                }
                cmt_time = year + "年" + month + "月" + day + "日" + " " + h + ":" + m;

                content = $('#cmt_content').val(); // 文本内容

                // 获取文章id
                artical_id = $('.article-type-post').attr("id");

                // alert(user_id + content + cmt_time + artical_id);

                if ($.isEmptyObject(user)) {
                    $('.login-pop').fadeIn(1000);
                    return false;

                }
                else {
                    var para = {
                        "fuid": user_id,
                        "aid": artical_id,
                        "trid": -1,
                        "content": content,
                    };
                    $.ajax({
                        type: "post",
                        url: "/addReview",
                        dataType: "json",
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(para),
                        async: true,
                        success: function (data) {
                            // alert(data.message);
                            //先发送ajax后成功再前端显示出来
                            var insert_div = "<div class='cmt_per_content'>" + "<div class='head_img'>" +
                                "<a href='#'></a></div>" + "<input class='cmt_id' value= " + user_id + " hidden='hidden'/>" +
                                "<div class='cmt_per_content_right'>" + "<div class='cmt_nt'>" + "<span class='cmt_name'>" +
                                user_name + "</span><span class='cmt_time'>" +
                                cmt_time + "</span></div>" + "<div class='cmt_words'>" + "<p><span>" + content + "</span></p></div>" +
                                "<div class='cmt_huifu_dianzan'>" +
                                "<a href='#' class='dz'><img src='/resources/img/dianzan.png' width='24px' height='24px'/><span></span></a>" +
                                "<a href='#' class='hf'>回复</a>" + "</div>" + "<div class='hf_div' style='display: none;'>" + "<textarea class='hf_cmt_content' spellcheck='true'></textarea>" +
                                "<div class='post_hf_cmt'>" + "<a href='javascript:void(0)'>" + "<img src='img/post-btn.png'/>" + "</a></div></div></div>" +
                                "</div>";

                            $(".cmt_list").append(insert_div);

                        },
                        error: function () {
                            alert("网络异常请稍后再试");
                        }
                    });

                }
            });

            //对回复的评论
            $(".post_hf_cmt").click(function () {
                //先查登录状态 没有的话就弹出login登录窗口
                //获取当前时间
                myDate = new Date();
                var year = myDate.getFullYear();        //获取当前年
                var month = myDate.getMonth() + 1;   //获取当前月
                var day = myDate.getDate();            //获取当前日
                var h = myDate.getHours();              //获取当前小时数(0-23)
                var m = myDate.getMinutes();          //获取当前分钟数(0-59)
                if (h < 10) {
                    h = "0" + h;
                }
                if (m < 10) {
                    m = "0" + m;
                }
                cmt_time = year + "年" + month + "月" + day + "日" + " " + h + ":" + m;

                hf_name = $(this).parent().siblings(".cmt_nt").find(".cmt_name").html();										// 原回复的作者和内容
                hf_name_id = $(this).parent().siblings(".cmt_nt").find(".cmt_name").attr("id");

                //回复的ID
                hf_rid = $(this).parent().parent().parent().attr("id");

                content = $(this).parent().siblings(".cmt_words").children("p:last-child").find("span").html();

                hf_content = $(this).siblings("textarea").val(); // 回复的文本内容


                // 获取文章id
                artical_id = $('.article-type-post').attr("id");

                // alert(user_id + hf_content + cmt_time + artical_id);

                // alert(hf_name + "\n" + content);

                if ($.isEmptyObject(user)) {
                    $('.login-pop').fadeIn(1000);
                    return false;

                }
                else {
                    var para = {
                        "fuid": user_id,
                        "aid": artical_id,
                        "trid": hf_rid,
                        "content": hf_content,
                    };
                    $.ajax({
                        type: "post",
                        url: "/addReview",
                        dataType: "json",
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(para),
                        async: true,
                        success: function (data) {
                            // alert(data.message);
                            //先发送ajax后成功再前端显示出来
                            var insert_div = "<div class='cmt_per_content'>" + "<div class='head_img'>" +
                                "<a href='#'></a></div>" + "<input class='cmt_id' value= " + user_id + " hidden='hidden'/>" +
                                "<div class='cmt_per_content_right'>" + "<div class='cmt_nt'>" +
                                "<span class='cmt_name'>" + user_name + "</span><span class='cmt_time'>" +
                                cmt_time + "</span></div>" + "<div class='cmt_words'>" +
                                "<p><span> @ " + hf_name + "</span></p>" +
                                "<div class='hf_pl'><span>" + content + "</span></div>" +
                                "<p><span>" + hf_content + "</span></p>" +
                                "</div>" +
                                "<div class='cmt_huifu_dianzan'>" +
                                "<a href='#' class='dz'><img src='/resources/img/dianzan.png' width='24px' height='24px'/><span></span></a>" +
                                "<a href='#' class='hf'>回复</a>" + "</div>" + "<div class='hf_div' style='display: none;'>" + "<textarea class='hf_cmt_content' spellcheck='true'></textarea>" +
                                "<div class='post_hf_cmt'>" + "<a href='javascript:void(0)'>" + "<img src='img/post-btn.png'/>" + "</a></div></div></div>" +
                                "</div>";

                            $(".cmt_list").append(insert_div);


                        },
                        error: function () {
                            alert("网络异常请稍后再试");
                        }
                    });

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

            //点赞功能 每次进页面只能赞一次 恢复的点赞
            $(".dz").click(function () {


                var hf_dz = $(this);

                if($(this).hasClass("hf_dz")){
                    return false;
                }else{
                    var rid = $(this).parent().parent().parent().attr("id");
                    var likeCount = $(this).find("span").html();
                    var para = {"rid":rid ,"likeCount":likeCount};

                    $.ajax({
                        url: "/giveALikeToReview",
                        type: "post",
                        dataType: "json",
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(para),
                        async: true,
                        success: function (data) {
                            // alert(data.message);

                            var dznumber = hf_dz.find('span').html();
                            if (dznumber > 99 || dznumber == "99+") {
                                dznumber = hf_dz.find('span').html("99+");
                            } else if (dznumber == null || dznumber == "") {
                                hf_dz.find('span').html(1);
                            } else {
                                dznumber = parseInt(dznumber) + 1;
                                hf_dz.find('span').html(dznumber);
                            }
                            hf_dz.addClass("hf_dz");

                        },
                        error: function (data, type, err) {
                            console.log("ajax错误类型：" + type);
                            console.log(err);
                        }
                    });



                }

            });

            //回复功能
            var hf_quxiaohf = false;
            $(".hf").click(function () {

                var hf = $(this);
                $(this).parent().parent().find(".hf_div").animate({height: 'toggle'}
                    , 300, function () {
                        if (hf_quxiaohf) {
                            hf.html("回复");
                            hf_quxiaohf = false;
                        } else {
                            hf.html("取消回复");
                            hf_quxiaohf = true;
                        }
                    });
            });

            //收藏文章

            $("#sc").click(function () {
                // alert($(this).hasClass("sc"));
                //先发送ajax请求 然后在变红
                var btn_sc = $(this);
                if ($.isEmptyObject(user)) {
                    $('.login-pop').fadeIn(1000);
                    return;

                }
                var uid = '${sessionScope.user.uid}';
                var aid = $("article").attr("id");
                var para = {'uid': uid, 'aid': aid};
                // alert(uid + "---" + aid);
                if ($(this).hasClass("sc")) {
                    //ajax 收藏 uid aid
                    $.ajax({
                        url: "/collectArticle",
                        type: "post",
                        dataType: "json",
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(para),
                        async: true,
                        success: function (data) {
                            // alert(data.message);

                            btn_sc.css("background-image", "url(/resources/img/sc_checked.png)");
                            btn_sc.css("opacity", 1);
                            btn_sc.removeClass("sc");
                            btn_sc.addClass("isSced");

                        },
                        error: function (data, type, err) {
                            console.log("ajax错误类型：" + type);
                            console.log(err);
                        }
                    });

                } else if ($(this).hasClass("isSced")) {
                    //ajax 取消收藏
                    $.ajax({
                        url: "/cancelCollectArticle",
                        type: "post",
                        dataType: "json",
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(para),
                        async: true,
                        success: function (data) {
                            // alert(data.message);
                            btn_sc.css("background-image", "url(/resources/img/sc_normal.png)");
                            btn_sc.css("opacity", 0.5);
                            btn_sc.removeClass("isSced");
                            btn_sc.addClass("sc");

                        },
                        error: function () {
                            alert("网络异常请稍后再试");
                        }
                    });


                }

            });

            //文章点赞
            var isdz = false;
            $("#artical_dz").click(function () {
                //同样 先发送ajax然后再统计 或者先变化再发ajax 看统计需要精确与否
                var btn_dz = $(this);
                var dznumber = $(this).find('span').html();
                var dz_img = $(this).find('img');
                if (!isdz) {
                    // ajax点赞+1
                    //article_id

                    var para = {"aid": article_id, "likeCount": dznumber};

                    $.ajax({
                        url: "/giveALikeToArticle",
                        type: "post",
                        dataType: "json",
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(para),
                        async: true,
                        success: function (data) {
                            // alert(data.message);
                            if (dznumber > 99 || dznumber == "99+") {
                                dznumber = btn_dz.find('span').html("99+");
                            } else if (dznumber == null || dznumber == "") {
                                btn_dz.find('span').html(1);
                            } else {
                                dznumber = parseInt(dznumber) + 1;
                                btn_dz.find('span').html(dznumber);
                            }
                            dz_img.attr("src", "/resources/img/artical_dz_checked.png");
                            btn_dz.css("opacity", 1);
                            isdz = true;

                        },
                        error: function (data, type, err) {
                            console.log("ajax错误类型：" + type);
                            console.log(err);
                        }
                    });

                }
            });

            //关注作者
            //这里点击一下就可以了 就关注了 这里不取消关注 取消关注到自己主页去取消
            var isgz = false;
            $("#gz_author").click(function () {
                var gz_author = $(this);
                if ($.isEmptyObject(user)) {
                    $('.login-pop').fadeIn(1000);
                    return;
                }
                if (!isgz) {
                    //发送关注作者ajax请求 需要user_id
                    var g_text = gz_author.html();
                    if (g_text == "已关注") {
                        return false;
                    } else {

                        var fuid = '${sessionScope.user.uid}';

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


        });

        <!-- markdown 解析 -->
        window.onload = function () {
            editormd.markdownToHTML("article-entry", {
                htmlDecode: "style,script,iframe",
                emoji: true,
                taskList: true,
                tex: true,  // 默认不解析
                flowChart: true,  // 默认不解析
                sequenceDiagram: true  // 默认不解析
            });
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
                    <a href="#" id="${user.uid}" class="author_info">${user.nickname}</a>
                </h1>
                <p class="header-subtitle">
                    ${user.userInfo.personalizedSignature}
                </p>
                <nav class="header-menu">
                    <ul>
                        <li><a href="/person/${user.nickname}">主页</a></li>
                        <li><a class="collectAuthor" href="#" id="gz_author"><c:if
                                test="${isAttention == 0}">关注</c:if><c:if test="${isAttention == 1}">已关注</c:if></a></li>
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
                    <!-- 文章内容 -->
                    <article id="${article.aid}" class="article article-type-post article-index">
                        <div class="article-inner">
                            <header class="article-header">
                                <h1><a class="article-title">${article.title}</a></h1>
                                <a class="archive-article-date">${article.publishTime}</a>
                            </header>
                            <!-- 文章内容 -->
                            <div class="article-entry" id="article-entry">
                                <textarea style="display:none; width: 80%;"
                                          placeholder="markdown语言">${article.content}</textarea>
                            </div>
                            <div class="article-info article-info-index">
                                <img class="tag_left" src="/resources/img/bq_tag.png" width="18px" height="18px"/>
                                <a class="tag-icon tag_left" href="#">${article.tag}</a>

                                <a href="#" id="artical_dz" title="点赞">
                                    <img src="/resources/img/artical_dz_normal.png" width="26px" height="26px"/>
                                    <span>${article.likeCount}</span>
                                </a>
                                <a href="#" id="sc" title="收藏文章"
                                   <c:if test="${isCollection eq 0}">class="sc"</c:if>
                                   <c:if test="${isCollection eq 1}">class="isSced"</c:if>></a>
                            </div>
                        </div>
                    </article>

                    <!--评论区-->
                    <div id="SOHUCS">
                        <div id="SOHU_MAIN">
                            <!--评论输出框-->
                            <div class="module-cmt-header">
                                <h1>留下你的评论</h1>
                                <textarea placeholder="您有什么想法要说的么?"
                                          id="cmt_content"
                                          spellcheck="true"></textarea>
                                <input id="user_id" value="${sessionScope.user.uid}" hidden="hidden"/>
                                <div class="post_cmt">
                                    <a href="javascript:void(0)">
                                        <img src="/resources/img/post-btn.png"/>
                                    </a>
                                </div>
                            </div>
                            <!--评论列表-->
                            <div class="module-cmt-list">
                                <!--评论头上-->
                                <div class="cmt-list-type">
                                    <ul>
                                        <li class="pl_title">评论</li>
                                        <li class="pl_count"><strong class="cy-number">${reviewList.size()}</strong>条评论
                                        </li>
                                    </ul>
                                </div>
                                <!--评论主体-->
                                <div class="cmt_list_body">
                                    <div class="block-title-gw">
                                        <h1>热门评论</h1>
                                    </div>
                                    <!--每个人的评论-->
                                    <div class="cmt_list">
                                        <!--每个人列表-->
                                        <c:forEach items="${reviewList}" var="review">
                                            <div class="cmt_per_content" id="${review.rid}">
                                                <div class="head_img">
                                                    <a href="#"></a>
                                                </div>
                                                <div class="cmt_per_content_right">
                                                    <div class="cmt_nt">
                                                        <span class="cmt_name"
                                                              id="${review.fuid}">${review.fNickname}</span>
                                                        <span class="cmt_time">${review.reviewTime}</span>
                                                    </div>
                                                    <div class="cmt_words">
                                                        <c:if test="${review.trid eq -1}">
                                                            <p>
                                                                <span>${review.content}</span>
                                                            </p>
                                                        </c:if>
                                                        <c:if test="${!(review.trid eq -1)}">
                                                            <p><span>@ ${review.tNickname}</span></p>
                                                            <div class="hf_pl">
                                                                <span>${review.originalContent}</span>
                                                            </div>
                                                            <p><span>${review.content}</span></p>
                                                        </c:if>
                                                    </div>
                                                    <div class="cmt_huifu_dianzan">
                                                        <a href="#" class="dz"><img src="/resources/img/dianzan.png"
                                                                                    width="24px"
                                                                                    height="24px"/><span>${review.likeCount}</span></a>
                                                        <a href="#" class="hf">回复</a>
                                                    </div>
                                                    <div class="hf_div" style="display: none;">
												<textarea
                                                        class="hf_cmt_content"
                                                        spellcheck="true"></textarea>
                                                        <div class="post_hf_cmt">
                                                            <a href="javascript:void(0)">
                                                                <img src="/resources/img/post-btn.png"/>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
