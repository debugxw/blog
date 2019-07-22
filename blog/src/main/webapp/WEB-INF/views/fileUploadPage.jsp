<%--
  Created by IntelliJ IDEA.
  User: 12803
  Date: 2019/5/21
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>

<head>
    <title>file upload</title>
    <script src="/resources/js/jquery-1.7.2.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#upload").click(function () {

                var title = $("#title").val();
                var tag = $("#tag").val();
               if(title == null || title == "" ||tag == null || tag == ""){
                   alert("输入框不能为空!");
                   return false;
               }else{
                   return true;
               }


            });
        });
    </script>
</head>
<body>
<h2>文件上传</h2>
<form action="/fileUpload" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>请选择文件:</td>
            <td><input type="file" name="file"></td>
        </tr>
        <tr><td>标题：<input type="text" name="title" id="title"/></td></tr>
        <tr><td>tag:<input type="text" name="tag" id="tag"/></td></tr>
        <tr>
            <td><input type="submit" value="上传" id="upload"></td>
        </tr>
    </table>
</form>
</body>
</html>
