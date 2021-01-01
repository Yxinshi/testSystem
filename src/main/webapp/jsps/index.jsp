<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2020/12/28
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <%-- 告诉IE浏览器,用最新版本的IE来渲染页面--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <%-- 设置移动设备优先--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/static/layui/css/layui.css">

    <script src="/static/layui/layui.js" type="text/javascript"></script>
    <script src="/static/layui/lay/modules/table.js" type="text/javascript"></script>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="">控制台</a></li>
        <li class="layui-nav-item"><a href="">账号管理</a></li>
        <li class="layui-nav-item"><a href="">用户</a></li>
        <li class="layui-nav-item">
            <a href="javascript:;">其它系统</a>
            <dl class="layui-nav-child">
                <dd><a href="">邮件管理</a></dd>
                <dd><a href="">消息管理</a></dd>
                <dd><a href="">授权管理</a></dd>
            </dl>
        </li>
    </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">

                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"> <a href="javascript:logout();">
                注销
            </a></li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" id="ztreeshow"  lay-filter="test">
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab" lay-filter="demo" lay-allowclose="true">
            <ul class="layui-tab-title" id="thistab"></ul>
            <div class="layui-tab-content">
                <iframe src="" frameborder="0" id="iframeAdmin" style="width: 100%; height: 100%;"></iframe>
            </div>
        </div>
    </div>
<%--    <div class="layui-footer">--%>
<%--        <!-- 底部固定区域 -->--%>
<%--        © layui.com - 底部固定区域--%>
<%--    </div>--%>
</div>
</body>
<script>
    layui.use('element', function(){
        var element = layui.element;

    });
    var ZtreeList = "";
    $(function () {
        if (ZtreeList=="") {
            ShowZtreeList()
        }
    })
    function ShowZtreeList() {
        $.ajax({
            url:"/user/showLeftList",
            type:"get",
            dataType:"json",
            async:false,
            success:function(data) {
                ZtreeList = data;
                console.log(data)
                var str="";
                $(data).each(function (i,val) {
                    console.log(val.perList)
                    str+="<li class='layui-nav-item'>"
                    /*一级菜单*/
                    if (val.perList.length>0){
                        str+="<a class='' href='javascript:;' onclick=Onclick('"+val.path+"','"+val.pname+"')>"+val.pname+"</a>" +
                            "<dl class='layui-nav-child'>"
                        $(val.perList).each(function (j,val1){
                            /*二级菜单*/
                            if (val.pId==val1.parentId){
                                str+="<dd><a href='javascript:;' onclick=Onclick('"+val.path+"','"+val.pname+"')>"+val1.pname+"</a>"
                            }else{
                                str+="<dd><a href='javascript:;' onclick=Onclick('"+val1.path+"','"+val1.pname+"')>"+val1.pname+"</a>" +
                                    "</dd>"
                            }
                            str+="</dd>";
                        })
                        str+="</dl>"
                    }else{
                        str+="<a href='javascript:;' onclick=Onclick('"+val.path+"','"+val.pname+"')>"+val.pname+"</a>";
                    }
                    str+="</li>";
                })
                $("#ztreeshow").html(str)
            },error:function (data) {
                console.log(data)
            }
        })
    }
    function Onclick(jsp,pname) {
        if ($("#iframeAdmin").attr("src")==jsp){
            $("#thistab").children().each(function () {
                $("#thistab").children().addClass("layui-this")
            })
        }else{
            $("#iframeAdmin").attr("src",jsp);
            text = "<li class='layui-this' href='"+pname+"'>"+pname+"</li>";

        }
    }

    /*注销*/
    function logout() {
        layer.confirm('是否确定退出系统？', {
            btn: ['是','否'] ,
            icon:2,
        },function () {
            localStorage.clear();
            location.href="/jsps/login.jsp"
        })
    }
</script>


</html>
