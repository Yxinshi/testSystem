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
    <h3>考试详情</h3>
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>试卷名称</th>
            <th>考试日期</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>应参加人数</th>
            <th>实参加人数</th>
            <th>缺考人数</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${examinationPaper.testPaperName}</td>
            <td>${examinationPaper.testPaperDate}</td>
            <td>${examinationPaper.testPaperStartTime}</td>
            <td>${examinationPaper.testPaperEndTime}</td>
            <td>${ycanjia}</td>
            <td>${examinationPaper.testPaperNumberOfParticipants}</td>
            <td>${quekao}</td>
        </tr>
        </tbody>
    </table>
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>通过人数</th>
            <th>通过率</th>
            <th>正确率</th>
            <th>平均分</th>
            <th>最高分</th>
            <th>最低分</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${examinationPaper.testPaperByTheNumberOf}</td>
            <td>${examinationPaper.testPaperPassingRate}</td>
            <td>${zhengque}</td>
            <td>${examinationPaper.testPaperAverageScore}</td>
            <td>${zuigaofen}</td>
            <td>${zuitifen}</td>
        </tr>
        </tbody>
    </table>
    <h3>人员详情</h3>
    <table id="demo1" lay-filter="test"></table>
</div>
<script type="text/html" id="xuhao">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script>
    //一般直接写在一个js文件中
    layui.use(['element','layer', 'table','laydate'], function(){
        var layer = layui.layer
            ,form = layui.form;
        var element=layui.element;
        var table = layui.table;
        table.render({
            elem: '#demo1'
            ,height: 312
            ,url: '/shuju/renyuanxiangqing?testPaperId='+${examinationPaper.testPaperId} //数据接口
            ,page: true //开启分页
            ,limit: 5
            ,cols: [[ //表头
                {title: '排名',templet: '#xuhao'},
                {field: 'name',title: '姓名' ,width:100},
                {field: 'jobNumber', title: '工号', width:200, sort: true}
                ,{field: 'testPaperFullMark', title: '总分', width:200}
                ,{field: 'testPaperPassMark', title: '及格分', width: 200}
                ,{field: 'totalPoints',title:'成绩', width:200, align:'center'}
                ,{field: 'passState',templet: function (d){
                    if(d.passState==0){
                        return "<i class='layui-icon layui-icon-close' style='color: red'></i>"
                    }
                        if(d.passState==1){
                            return "<i class='layui-icon layui-icon-ok' style='color: blue'></i>"
                        }
                },title:'是否通过', width:200, align:'center'}
            ]]
        });
    });
</script>
</body>
</html>
