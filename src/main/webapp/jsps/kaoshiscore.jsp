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
    <title>数据统计</title>
    <script src="/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/static/layuiadmin/layui/css/layui.css">
    <link rel="stylesheet" href="/static/layuiadmin/style/admin.css" media="all">
    <script src="/static/layuiadmin/layui/layui.js" type="text/javascript"></script>
</head>
<body>
<div class="layui-container">
    <form class="layui-form">
        <div class="layui-form-item">
            <div class="layui-col-md4">
                <label class="layui-form-label">试卷名称：</label>
                <div class="layui-input-inline">
                    <input  type="text" name="testPaperName"   class="layui-input">
                </div>
            </div>
            <div class="layui-col-md4">
                <label class="layui-form-label">开始日期：</label>
                <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
                    <input type="text" name="testPaperStartTime" class="layui-input" id="test1">
                </div>
                <label class="layui-form-label">结束日期：</label>
                <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
                    <input type="text" name="testPaperEndTime" class="layui-input" id="test2">
                </div>
            </div>
            <div class="layui-col-md4">
                <button class="layui-btn" lay-submit lay-filter="formchaxun">查询</button>
            </div>
        </div>
    </form>
    <table id="demo1" lay-filter="test"></table>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看详情</a>
    <a class="layui-btn layui-btn-xs" lay-event="detail2">查看缺考人员</a>
</script>
<script>
    //一般直接写在一个js文件中
    layui.use(['element','layer', 'table','laydate'], function(){
        var layer = layui.layer
            ,form = layui.form;
        var element=layui.element;

        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo1'
            ,height: 312
            ,url: '/shuju/tongji' //数据接口
            ,page: true //开启分页
            ,limit: 5
            ,cols: [[ //表头
                {field: 'testPaperId',title: 'ID', width:100},
                {field: 'testPaperName', title: '试卷名称', width:200, sort: true}
                ,{field: 'testPaperDate', title: '考试日期', width:200}
                ,{field: 'testPaperStartTime', title: '开始时间', width: 200}
                ,{field: 'testPaperEndTime',title:'结束时间', width:200, align:'center'}
                ,{field: 'testPaperNumberOfParticipants',title:'参加人数', width:200, align:'center'}
                ,{field: 'testPaperByTheNumberOf',title:'通过人数', width:200, align:'center'}
                ,{field: 'testPaperPassingRate',title:'通过率', width:200, align:'center'}
                ,{field: 'testPaperAverageScore',title:'平均分', width:200, align:'center'}
                ,{fixed: 'right',title:'操作', width:200, align:'center', toolbar: '#barDemo'}
            ]]
        });

        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test1', //指定元素
            type:'time'
        });
        laydate.render({
            elem: '#test2',
            type:'time'//指定元素
        });

        form.on('submit(formchaxun)', function(data){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var testpager=data.field;
            var testPaperName=testpager.testPaperName
            console.log(testPaperName)
            var testPaperStartTime=testpager.testPaperStartTime
            console.log(testPaperStartTime)
            var testPaperEndTime=testpager.testPaperEndTime
            console.log(testPaperEndTime)
            table.render({
                elem: '#demo1'
                ,height: 312
                ,url: '/shuju/tongji?testPaperName='+testPaperName+"&testPaperStartTime="+testPaperStartTime+"&testPaperEndTime="+testPaperEndTime //数据接口
                ,page: true //开启分页
                ,limit:5
                ,cols: [[ //表头
                    {field: 'testPaperId',title: 'ID', width:100},
                    {field: 'testPaperName', title: '试卷名称', width:200, sort: true}
                    ,{field: 'testPaperDate', title: '考试日期', width:200}
                    ,{field: 'testPaperStartTime', title: '开始时间', width: 200}
                    ,{field: 'testPaperEndTime',title:'结束时间', width:200, align:'center'}
                    ,{field: 'testPaperNumberOfParticipants',title:'参加人数', width:200, align:'center'}
                    ,{field: 'testPaperByTheNumberOf',title:'通过人数', width:200, align:'center'}
                    ,{field: 'testPaperPassingRate',title:'通过率', width:200, align:'center'}
                    ,{field: 'testPaperAverageScore',title:'平均分', width:200, align:'center'}
                    ,{fixed: 'right',title:'操作', width:200, align:'center', toolbar: '#barDemo'}
                ]]
            });
            return false;
        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            console.log(data)
            console.log(data.testPaperId)
            console.log(data.id)
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
           if(layEvent === 'detail'){ //查看
                window.location.href="${pageContext.request.contextPath}/shuju/detailshu?testPaperId="+data.testPaperId+"&uId="+data.id
            }
            if(layEvent === 'detail2'){ //查看
                table.render(
                    {
                        elem: '#demo1'
                        ,height: 312
                        ,url: '/shuju/quekaoperson?testPaperId='+data.testPaperId //数据接口
                        ,page: true //开启分页
                        ,parseData: function(res){ //res 即为原始返回的数据
                            return {
                                "code":0, //解析接口状态
                                "msg": "", //解析提示文本
                                "count": res.size, //解析数据长度
                                "data": res //解析数据列表
                            };
                        }
                        ,cols: [[ //表头
                            {field: 'name',title: '姓名', width:100},
                            {field: 'jobNumber', title: '工号', width:200, sort: true}
                            ,{field: 'accountNumber', title: '账号', width:200}
                        ]]
                    })
            }
        });
    });
</script>
</body>
</html>
