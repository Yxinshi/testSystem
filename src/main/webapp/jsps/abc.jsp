<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2021/1/7
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/layui/css/modules/layer/default/layer.css">
    <link href="/static/css/gradePaper.css" rel="stylesheet">
    <link href="/static/myjs/home/main.css" rel="stylesheet" type="text/css"/>
    <link href="/static/myjs/home/test.css" rel="stylesheet" type="text/css"/>

    <script src="/static/layui/layui.js" type="text/javascript"></script>
    <script src="/static/layui/lay/modules/table.js" type="text/javascript"></script>
</head>
<body>
<input type="checkbox" name="cb" value="1" />1　
<input type="checkbox" name="cb" value="2" />2　
<input type="checkbox" name="cb" value="3" />3　
<input type="checkbox" name="cb" value="4" />4

</body>
<script>
    var s = '1,4';//这里的数据是你数据库读出的，我的做法是在页面中加了一个隐藏域，用来接受数据库的数据
    s=',' + s + ',';//前后加限定符
    var cb = document.getElementsByName('cb');//这里改你checkbox的name值
    for (var i = 0; i < cb.length; i++)
        if (s.indexOf(',' + cb[i].value + ',') != -1) {
            cb[i].checked = true;
        }
</script>
</html>
