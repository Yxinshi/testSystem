<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2020/12/30
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考试中心列表</title>
    <%-- 告诉IE浏览器,用最新版本的IE来渲染页面--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <%-- 设置移动设备优先--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/static/layui/css/layui.css">

    <script src="/static/layui/layui.js" type="text/javascript"></script>
    <script src="/static/layui/lay/modules/table.js" type="text/javascript"></script>
</head>
<body>
<div class="layui-row" id="layerDemo" style="margin-top: 40px">
    <form class="layui-form layui-form-pane" lay-filter="formDemo">
        <div class="layui-form-item">
            <label class="layui-form-label">从</label>
            <div class="layui-input-inline">
                <input type="text" name="testPaperStartTime" id="testPaperStartTime"  placeholder="开始时间" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">到</label>
            <div class="layui-input-inline">
                <input type="text" name="testPaperEndTime" id="testPaperEndTime"  placeholder="结束时间" autocomplete="off" class="layui-input">
            </div>

            <label class="layui-form-label">试卷名称</label>
            <div class="layui-input-inline">
                <input type="text" autocomplete="off" name="testPaperName" id="testPaperName" placeholder="试卷名称"
                       class="layui-input" >
            </div>

            <div class="layui-input-inline" style="width: 100px">
                <button class="layui-btn" style="width: 100%;margin-left: 200px" type="button"
                        lay-submit lay-filter="selectone" data-type="reload" id="btn">查询
                </button>
            </div>
        </div>

    </form>
</div>

<table id="testCenter_tab" lay-filter="testCenter_tab"></table>
</body>

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#testCenter_tab'
            ,id: 'testPaperId'
            ,url: '/mark/markPaperListShow' //数据接口
            ,method:'get'
            ,page: true
            ,width:1350
            ,cols: [[ //表头
                {field: 'testPaperId', title: '序号', width:100, fixed: 'center',sort:true}
                ,{field: 'testPaperName', title: '试卷名称', width:150}
                ,{field: 'testPaperFullMark', title: '总分', width:150}
                ,{field: 'testPaperPassMark', title: '及格分', width:150}
                ,{field: 'testPaperDate', title: '考试日期', width:200}
                ,{field: 'testPaperStartTime', title: '开始时间', width:150}
                ,{field: 'testPaperEndTime', title: '结束时间', width:150}
                ,{title: '操作', width: 300 ,toolbar: '#testCenter_demo'}
            ]]

        });

        table.on('tool(testCenter_tab)',function (object) {
            var data = object.data;
            var layEvent = object.event;
            if (layEvent==='testDetails'){
                window.location.href="/jsps/markPapers/testDetail.jsp?id="+data.testPaperId;
            }else if (layEvent==='outPaper'){

            }
        })

        var $ = layui.$, active = {
            reload: function(){
                alert(1111)
                //执行重载
                table.reload('testPaperId', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        testPaperName:$("#testPaperName").val(),
                        testPaperStartTime:$("#testPaperStartTime").val(),
                        testPaperEndTime:$("#testPaperEndTime").val(),
                    }
                }, 'data');
            }
        };

        $('#btn').on('click', function(){
            alert(123);
            var type = $(this).data('type');//data-type
            console.log(type)
            active[type] ? active[type].call(this) : '';
        })

    });


</script>
<script type="text/html" id="testCenter_demo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="testDetails">考试详情</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="outPaper">导出试卷</a>
</script>
</html>
