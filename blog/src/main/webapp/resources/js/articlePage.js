$(document).ready(function () {


    //获取session User
    var user_id = '${sessionScope.user.uid}';
    var user_name = '${sessionScope.user.nickname}';

    //文章作者的ID 和 名字
    var author_id = $(".author_info").attr("id");
    var author_name = $(".author_info").html();
    console.log(author_id + " " + author_name);


    var article_id = $(".article").attr("id");


    console.log(user_id + " " + user_name);


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

        alert(user_id + content + cmt_time + artical_id);

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
                    alert(data.message);
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

        alert(user_id + hf_content + cmt_time + artical_id);

        alert(hf_name + "\n" + content);

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
                    alert(data.message);
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
                alert(data.message);
                if (data.message == "登陆成功") {
                    $('form').fadeOut(500);
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
                    alert(data.message);

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
        alert($(this).hasClass("sc"));
        //先发送ajax请求 然后在变红
        var btn_sc = $(this);
        if ($.isEmptyObject(user)) {
            $('.login-pop').fadeIn(1000);
            return;

        }
        var uid = '${sessionScope.user.uid}';
        var aid = $("article").attr("id");
        var para = {'uid': uid, 'aid': aid};
        alert(uid + "---" + aid);
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
                    alert(data.message);

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
                    alert(data.message);
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
                    alert(data.message);
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