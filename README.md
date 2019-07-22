# 一个简单的博客系统
### 一点感想
之前通过GitHub+hexo搭建过一个[博客](https://debugxw.github.io/)，用起来很方便，尤其是它的主题界面很简约，很喜欢。正好学校的综合系统开发课程需要提交一个项目，于是就想到自己实现一个简单的博客系统。

整个项目开发下来，最大的感想就是项目前期的需求分析，数据库设计，包括整个系统需要有哪些页面，哪些页面实现哪些功能等等都十分重要。这些前期工作做的好坏直接影响了整个项目的开发效率，前期某个功能没有确定好，可能在后面的开发过程中会出现各种问题，甚至是改了又改，改了又改。虽然在开发前期，我们小组成员也对整个项目做了一个大致的分析，但是可能是由于经验不足，不够老道，很多东西都没有考虑到，甚至直接忽略。这就导致一个问题，代码写着写着突然一懵，这才发现好像有点问题。

### 开发环境
该项目开发IDE为IntelliJ IDEA，通过Maven构建，后端采用Spring、SpringMVC、MyBatis，数据库采用MySQL、Redis，前端用到jQuery，bootstrap，editor.md。

### 项目截图
![login](https://raw.githubusercontent.com/debugxw/blog/master/image/login.png)
![register](https://raw.githubusercontent.com/debugxw/blog/master/image/register.png)
![personHome](https://raw.githubusercontent.com/debugxw/blog/master/image/personHome.png)
![articleBody](https://raw.githubusercontent.com/debugxw/blog/master/image/articleBody.png)
![articleReview](https://raw.githubusercontent.com/debugxw/blog/master/image/articleReview.png)