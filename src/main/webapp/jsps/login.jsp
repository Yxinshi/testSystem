<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2020/12/28
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <link type="text/css" rel="stylesheet" href="/static/myjs/login/css/login.css" />
    <script type="text/javascript" src="/static/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
    <!-- 引入组件库 -->
    <script src="${pageContext.request.contextPath }/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var height=$(document).height();
            $('.main').css('height',height);
        })
    </script>
</head>
<body>
<div class="main">
    <div class="main0">
        <div class="main_left">
            <img src="/static/myjs/login/images/login-image-3.png" class="theimg"/>
            <img src="/static/myjs/login/images/login-image-2.png" class="secimg"/>
            <img src="/static/myjs/login/images/login-image-1.png" class="firimg"/>
        </div>
        <div class="main_right" id="appId">
            <div class="main_r_up">
                <img src="/static/myjs/login/images/user.png" />
                <div class="pp">登录</div>
            </div>
            <div class="sub"><p>还没有账号？<a href="zhuce.html"><span class="blue">立即注册</span></a></p></div>
            <div class="txt">
                <span style="letter-spacing:8px;">用户名:</span>
                <input name="name" v-model="message" id="name" type="text" class="txtphone" placeholder="请输入注册手机号或用户名"/>
            </div>
            <div class="txt">
                <span style="letter-spacing:4px;">登录密码:</span>
                <input name="password" v-model="message" id="password" type="password" class="txtphone" placeholder="请输入登录密码"/>
            </div>

            <div class="xieyi">
                记住我 <a href="password.html"><span class="blue" style=" padding-left:130px; cursor:pointer">忘记密码?</span></a>
            </div>
            <div class="xiayibu" onclick="login()">登录</div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="footer0">
        <div class="footer_l">使用条款 | 隐私保护</div>
        <div class="footer_r">© 2015 （杭州）金融信息服务有限公司</div>
    </div>
</div>
</body>
<script>

    function login() {
        var name = $("#name").val();
        var password = $("#password").val();
        if (name=='' && password==''){
            alert("账号或密码不能为空")
        }else {
            $.ajax({
                url:'/user/userLogin',
                type:'post',
                data:{name:name,password:password},
                dataType:'json',
                success:function (data) {
                    if (data){
                        alert("登录成功")
                    }
                },
                error:function (err) {
                    alert("登录失败")

                }
            })
        }


    }

</script>



</html>
