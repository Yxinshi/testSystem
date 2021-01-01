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
    <link rel="stylesheet" href="/static/layuiadmin/layui/css/layui.css">
    <link rel="stylesheet" href="/static/layuiadmin/style/admin.css" media="all">
</head>
<body>
<div class="layui-container">
    <form class="layui-form">
        <div class="layui-form-item">
            <div class="layui-col-md4">
                <label class="layui-form-label">发送人：</label>
                <div class="layui-input-inline">
                    <input  type="text" name="name"    autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-col-md4">
                <label class="layui-form-label">共享状态：</label>
                <div class="layui-input-inline">
                    <input  type="text" name="sharedState"    autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-col-md4">
                <button class="layui-btn" lay-submit lay-filter="formchaxun">查询</button>
            </div>
        </div>
    </form>
    <table id="demo" lay-filter="test"></table>
</div>
<script src="../static/js/jquery-3.2.1.min.js"></script>
<script src="../static/layuiadmin/layui/layui.js"></script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看详情</a>
</script>
<script>
    //一般直接写在一个js文件中
    layui.use(['element','layer', 'table'], function(){
        var layer = layui.layer
            ,form = layui.form;
        var element=layui.element;

        layer.msg('Hello World');
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 312
            ,url: '/demo/xiaoxi' //数据接口
            ,page: true //开启分页
            ,limit:5
            ,cols: [[ //表头
                {field: 'sharedState', title: '状态', width:100,
                    templet: function(d){
                        if(d.sharedState=='1'){
                            return '未审核'
                        }
                        if (d.sharedState=='2'){
                            return '已共享'
                        }
                        if (d.sharedState=='3'){
                            return '未共享'
                        }
                    }
                }
                ,{field: 'name', title: '发送人', width:200, sort: true}
                ,{field: 'questionBankCreationTime', title: '发送时间', width:200}
                ,{field: 'questionBankClassify', title: '分类', width: 200}
                ,{fixed: 'right',title:'操作', width:200, align:'center', toolbar: '#barDemo'}
            ]]
        });
        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'detail'){ //查看
                //console.log(data.questionBankId)
               window.location.href="${pageContext.request.contextPath}/demo/detailcha?id="+data.questionBankId
            }
        });

        form.on('submit(formchaxun)', function(data){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var question=data.field;
            var name=question.name
            var sharedState=question.sharedState
            if(sharedState=='未审核'){
                sharedState='1'
            }else if(sharedState=='已共享'){
                sharedState='2'
            }else if(sharedState=='未共享'){
                sharedState='3'
            }
          //  window.location.href='${pageContext.request.contextPath}/demo/xiaoxi?name='+name+"&sharedState="+sharedState
            table.render({
                elem: '#demo'
                ,height: 312
                ,url: '/demo/xiaoxi?name='+name+"&sharedState="+sharedState //数据接口
                ,page: true //开启分页
                ,limit:5
                ,cols: [[ //表头
                    {field: 'sharedState', title: '状态', width:100,
                        templet: function(d){
                            if(d.sharedState=='1'){
                                return '未审核'
                            }
                            if (d.sharedState=='2'){
                                return '已共享'
                            }
                            if (d.sharedState=='3'){
                                return '未共享'
                            }
                        }
                    }
                    ,{field: 'name', title: '发送人', width:200, sort: true}
                    ,{field: 'questionBankCreationTime', title: '发送时间', width:200}
                    ,{field: 'questionBankClassify', title: '分类', width: 200}
                    ,{fixed: 'right',title:'操作', width:200, align:'center', toolbar: '#barDemo'}
                ]]
            });
            return false;
        });
    });
</script>
</body>
</html>
