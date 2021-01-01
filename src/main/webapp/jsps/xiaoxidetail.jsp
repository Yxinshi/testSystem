<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/28
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>开始使用layui</title>
    <link rel="stylesheet" href="../static/layuiadmin/layui/css/layui.css">
    <link rel="stylesheet" href="../static/layuiadmin/style/admin.css" media="all">
</head>
<body>
<div class="layui-container">
    <div class="layui-show-md-block">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">试题内容:</label>
                <input hidden type="text" name="questionBankId" value="${questionBank.questionBankId}" required lay-verify="required"  autocomplete="off" >
                <div class="layui-input-block">
                    <input hidden type="text" name="questionBankContent" value="${questionBank.questionBankContent}" required lay-verify="required"  autocomplete="off" >
                    <textarea class="">${questionBank.questionBankContent}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">试题分类：</label>
                <div class="layui-input-inline">
                    <input hidden type="text" name="questionBankClassify" value="${questionBank.questionBankClassify}" required lay-verify="required"  autocomplete="off" >
                    <textarea >${questionBank.questionBankClassify}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">发送人：</label>
                <div class="layui-input-inline">
                    <input hidden type="text" name="name" value="${questionBank.name}" required lay-verify="required"  autocomplete="off" >
                    <textarea >${questionBank.name}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">发送时间：</label>
                <div class="layui-input-inline">
                    <input hidden type="text" name="questionBankCreationTime" value="${questionBank.questionBankCreationTime}" required lay-verify="required"  autocomplete="off" >
                    <textarea >${questionBank.questionBankCreationTime}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-col-md4">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">允许共享</button>
                </div>
                <div class="layui-col-md4">
                    <button class="layui-btn" lay-submit lay-filter="formDemo2">不允许共享</button>
                </div>
                <div class="layui-col-md4">
                    <button type="reset"  class="layui-btn layui-btn-primary" lay-submit lay-filter="fanhui">返回</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="../static/js/jquery-3.2.1.min.js"></script>
<script src="../static/layuiadmin/layui/layui.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看详情</a>
</script>
<script>
    //一般直接写在一个js文件中
    layui.use(['element','layer', 'form'], function(){
        var layer = layui.layer
           var form = layui.form;
        var element=layui.element;
        form.on('submit(formDemo)', function(data){
            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var questionBankId=data.field.questionBankId
            layer.confirm('是否允许共享/不允许共享', function(data){
                $.ajax({
                    url: "/demo/updatestatus",
                    type: "post",
                    dataType: "json",
                    data: {"questionBankId":questionBankId,"status":'2'},
                    success:function (response){
                       if(response==1){
                           layer.alert("共享成功")
                           location.href="${pageContext.request.contextPath}/jsps/xiaoxi.jsp"
                       }
                    }
                })
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
        form.on('submit(formDemo2)', function(data){
            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var questionBankId=data.field.questionBankId
            layer.confirm('是否不允许共享', function(data){
                $.ajax({
                    url: "/demo/updatestatus",
                    type: "post",
                    dataType: "json",
                    data: {"questionBankId":questionBankId,"status":'3'},
                    success:function (response){
                        if(response==1){
                            layer.alert("成功")
                            location.href="${pageContext.request.contextPath}/jsps/xiaoxi.jsp"
                        }
                    }
                })
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
        form.on('submit(fanhui)', function(data){
           window.history.back(-1);
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        layer.msg('Hello World');
    });
</script>
</body>
</html>
