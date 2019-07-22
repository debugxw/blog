package com.iblog.controller;

import com.iblog.mapper.ReviewMapper;
import com.iblog.pojo.*;
import com.iblog.service.*;
import com.iblog.util.ArticleUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PersonalController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private AttentionService attentionService;

    @Autowired
    private CollectArticleService collectArticleService;

    // 用户主页
    @RequestMapping(value = "/person/{nickname}", method = RequestMethod.GET)
    public String showUserHomePage(@PathVariable("nickname") String nickname,
                                   Model model, HttpSession session) {
        User user = userService.getUserByNickname(nickname);
        if (user == null) {
            return "NoSuchPage";
        }
        fillUserInfoAndArticle(user, model);

        // 登录用户收藏的 文章列表
        if (session.getAttribute("user") != null) {
            User loginUser = (User) session.getAttribute("user");
            int uid = loginUser.getUid();
            List<CollectArticle> list = collectArticleService.findCollectArticleListByUid(uid);
            List<Article> title = new ArrayList<>();
            for (CollectArticle ca : list) {
                Article article = articleService.findOneArticleByAid(ca.getAid());
                User author = userService.getUserById(article.getUid());
                article.setAuthor(author.getNickname());
                title.add(article);
            }
            model.addAttribute("collectArticleList", title);
        }

        // 登录用户关注的 用户列表
        if (session.getAttribute("user") != null) {
            User loginUser = (User) session.getAttribute("user");
            int uid = loginUser.getUid();
            List<Attention> list = attentionService.findAttentionListByFuid(uid);
            List<User> attentionList = new ArrayList<>();
            for (Attention a : list) {
                User u = userService.getUserById(a.getTuid());
                u.setUserInfo(userInfoService.getUserInfoById(u.getUid()));
                attentionList.add(u);
            }
            model.addAttribute("attentionList", attentionList);
        }

        // 是否已关注 0: 未关注     1: 已关注      -1: 自己
        int isAttention = 0;

        if (session.getAttribute("user") != null) {
            User loginUser = (User) session.getAttribute("user");
            int loginUid = loginUser.getUid(), autherId = user.getUid();
            if (loginUid == autherId)
                isAttention = -1;
            else {
                // 是否已关注
                Attention attention = new Attention();
                attention.setFuid(loginUid);
                attention.setTuid(autherId);
                Attention hasA = attentionService.findOneAttention(attention);
                if (hasA != null)
                    isAttention = 1;
            }
        }
        model.addAttribute("isAttention", isAttention);

        return "userPage";
    }

    // 文章详情
    @RequestMapping(value = "/person/{nickname}/articleDetail", method = RequestMethod.GET)
    public String showOneselfHomePage(@PathVariable("nickname") String nickname,
                                      int aid, Model model, HttpSession session) {

        User auther = userService.getUserByNickname(nickname);
        if (auther == null)
            return "NoSuchUser";

        fillUserInfoAndArticle(auther, model);

        // article
        Article article = articleService.findOneArticleByAid(aid);
        model.addAttribute("article", article);

        // review list
        List<Review> reviewList = reviewService.reviewListByAid(aid);
        fillReviewList(reviewList);
        model.addAttribute("reviewList", reviewList);

        // 是否已关注 0: 未关注     1: 已关注      -1: 自己
        int isAttention = 0;

        // 是否已收藏 0: 未收藏     1: 已收藏
        int isCollection = 0;

        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            int uid = user.getUid(), autherId = auther.getUid();
            if (uid == autherId)
                isAttention = -1;
            else {
                // 是否已关注
                Attention attention = new Attention();
                attention.setFuid(uid);
                attention.setTuid(autherId);
                Attention hasA = attentionService.findOneAttention(attention);
                if (hasA != null)
                    isAttention = 1;
            }
            // 是否已收藏
            CollectArticle collectArticle = new CollectArticle();
            collectArticle.setUid(uid);
            collectArticle.setAid(aid);
            CollectArticle hasCA = collectArticleService.findOneCollectArticle(collectArticle);
            if (hasCA != null) {
                isCollection = 1;
            }
        }
        model.addAttribute("isAttention", isAttention);
        model.addAttribute("isCollection", isCollection);

        return "articleDetail";
    }

    // 关注作者
    @RequestMapping(value = "/attentionSomeone", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> attentionSomeone(@RequestBody Map<String, String> map) {
        Attention attention = new Attention();
        attention.setFuid(Integer.valueOf(map.get("fuid")));
        attention.setTuid(Integer.valueOf(map.get("tuid")));

        attentionService.addOneAttention(attention);
        Map<String, String> result = new HashMap<>();
        result.put("message", "success");
        return result;
    }

    // 关注作者 --- 取消
    @RequestMapping(value = "/cancelAttention", method = RequestMethod.GET)
    public String cancelAttention(@RequestParam int fuid, @RequestParam int tuid,
                                  HttpSession session) {
        Attention attention = new Attention();
        attention.setFuid(fuid);
        attention.setTuid(tuid);

//        System.out.println(fuid + "+++" + tuid);

        attentionService.deleteOneAttention(attention);

        String nickname = ((User) session.getAttribute("user")).getNickname();

        return "redirect:/person/" + nickname;
    }

    // 收藏文章
    @RequestMapping(value = "/collectArticle", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> collectArticle(@RequestBody Map<String, String> map) {
        CollectArticle collectArticle = new CollectArticle();
        collectArticle.setUid(Integer.valueOf(map.get("uid")));
        collectArticle.setAid(Integer.valueOf(map.get("aid")));

        collectArticleService.addOneCollectArticle(collectArticle);
        Map<String, String> result = new HashMap<>();
        result.put("message", "success");
        return result;
    }

    // 收藏文章---取消
    @RequestMapping(value = "/cancelCollectArticle", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> cancelCollectArticle(@RequestBody Map<String, String> map) {
        CollectArticle collectArticle = new CollectArticle();
        collectArticle.setUid(Integer.valueOf(map.get("uid")));
        collectArticle.setAid(Integer.valueOf(map.get("aid")));

        collectArticleService.deleteOneCollectArticle(collectArticle);
        Map<String, String> result = new HashMap<>();
        result.put("message", "success");
        return result;
    }

    // 点赞---文章
    @RequestMapping(value = "/giveALikeToArticle", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> giveALikeToArticle(@RequestBody Map<String, String> map) {
        System.out.println("文章点赞");
        Map<String, Integer> data = new HashMap<>();
        data.put("likeCount", Integer.valueOf(map.get("likeCount")) + 1);
        data.put("aid", Integer.valueOf(map.get("aid")));

        System.out.println(map);

        articleService.modifyLikeCountByAid(data);

        Map<String, String> result = new HashMap<>();
        result.put("message", "success");
        return result;
    }

    // 添加评论
    @RequestMapping(value = "/addReview", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> addReview(@RequestBody Map<String, String> map) {
        System.out.println("添加评论");
        System.out.println(map);

        Review review = new Review();
        review.setAid(Integer.valueOf(map.get("aid")));
        review.setFuid(Integer.valueOf(map.get("fuid")));
        review.setTrid(Integer.valueOf(map.get("trid")));
        review.setContent(map.get("content"));

        reviewService.addOneReview(review);

        Map<String, String> result = new HashMap<>();
        result.put("message", "success");
        return result;
    }

    // 点赞---评论
    @RequestMapping(value = "/giveALikeToReview", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> giveALikeToReview(@RequestBody Map<String, String> map) {
        Map<String, Integer> data = new HashMap<>();
        data.put("likeCount", Integer.valueOf(map.get("likeCount")) + 1);
        data.put("rid", Integer.valueOf(map.get("rid")));

        reviewService.modifyLikeCountByRid(data);

        Map<String, String> result = new HashMap<>();
        result.put("message", "success");
        return result;
    }

    private void fillReviewList(List<Review> reviewList) {
        if (reviewList != null) {
            for (Review review : reviewList) {
                review.setfNickname(userService.getNicknameByUid(review.getFuid()));
                if (review.getTrid() != -1) {
                    Review tem = reviewService.findOneReviewByRid(review.getTrid());
                    review.settNickname(userService.getNicknameByUid(tem.getFuid()));
                    review.setOriginalContent(tem.getContent());
                }
            }
        }
    }

    private void fillUserInfoAndArticle(User user, Model model) {
        UserInfo userInfo = userInfoService.getUserInfoById(user.getUid());
        user.setUserInfo(userInfo);

        List<Article> articleList = articleService.articleListByUid(user.getUid());
        ArticleUtil.setArticleAbstract(articleList);

        model.addAttribute("user", user);
        model.addAttribute("articleList", articleList);
    }

    @RequestMapping(value = "/showFileUploadPage", method = RequestMethod.GET)
    public String showFileUploadPage() {
        return "fileUploadPage";
    }

    // 删除文章
    @RequestMapping(value = "/deleteArticle", method = RequestMethod.GET)
    public String cancelAttention(@RequestParam int aid,
                                  HttpSession session) {
        // 删除评论
        reviewService.deleteReviewByAid(aid);
        // 删除收藏
        collectArticleService.deleteCollectArticleByAid(aid);
        // 删除文章
        articleService.deleteAnArticle(aid);

        String nickname = ((User) session.getAttribute("user")).getNickname();

        return "redirect:/person/" + nickname;
    }

    // 上传文章
    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public String fileUpload(HttpSession session,
                             @RequestParam("title") String title,
                             @RequestParam("tag") String tag,
                             @RequestParam("file") MultipartFile file) throws IOException {
        File f = null;
        if (!file.isEmpty()) {
            String path = "D:\\aaaaa\\";
            String filename = file.getOriginalFilename();
            f = new File(path + File.separator + filename);
            file.transferTo(f);
        } else {
            System.out.println("file is null!");
        }

        User u = (User) session.getAttribute("user");

        addAnArticle(getContent(f), u.getUid(), title, tag, articleService);

        if (f.isFile() && f.exists()) {
            f.delete();
            System.out.println("Ok");
        } else {
            System.out.println("false");
        }

        String nickname = u.getNickname();

        return "redirect:/person/" + nickname;
    }

    private static void addAnArticle(String content, int uid, String title,
                                     String tag, ArticleService aS) {
        Article article = new Article();

        article.setAcid(2);     //?
        article.setUid(uid);
        article.setTitle(title);
        article.setTag(tag);
        article.setPublishTime(new Date(System.currentTimeMillis()));
        article.setLikeCount(0);
        article.setScanCount(0);
        article.setContent(content);

        aS.addAnArticle(article);
    }

    public static String getContent(File file) {
        if (file == null)
            return null;
        StringBuilder stringBuilder = new StringBuilder();
        try {
            FileInputStream fis = new FileInputStream(file);
            InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
            BufferedReader bufferedReader = new BufferedReader(isr);
            String s;
            while ((s = bufferedReader.readLine()) != null) {
                stringBuilder.append(s).append("\n");
            }
            bufferedReader.close();
            isr.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return stringBuilder.toString();
    }
}
