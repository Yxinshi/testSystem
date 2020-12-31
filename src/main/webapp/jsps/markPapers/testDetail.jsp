<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2020/12/30
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<%--<span>接收的值是：</span>--%>
<span id="show"></span>

<div style="margin: 40px; box-shadow: 0 0 4px black; height: 200px; padding: 10px;">

    <div style="text-align: right">
        <button class="btn btn-primary" style="background-color: #4CAF50;
           border: none;
            color: white;
            padding: 15px 32px;
            text-align: right;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;" onclick="addSchool()">发布成绩
        </button>
    </div>
   <%-- <div style="text-align: left">
        <button class="btn btn-primary" style="background-color: #4CAF50;
           border: none;
            color: white;
            padding: 15px 32px;
            text-align: right;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;" onclick="outIdentity()">导出到Excel
        </button>
    </div>--%>
    <table id="shijuan_tab" lay-filter="shijuan_tab"></table>
</div>


<p></p>


</body>

<script>
    $(function(){
        $("#show").html(oneValues());
    })
    //接收一个值
    function oneValues(){
        var result;
        var url=window.location.search; //获取url中"?"符后的字串
        if(url.indexOf("?")!=-1){
            result = url.substr(url.indexOf("=")+1);
        }

        //return result;
        showPaper(result);
    }


    function showPaper(result){
        layui.use('table', function(obj){
            var table = layui.table;

            table.render({
                elem: '#shijuan_tab'
                ,id: 'testPaperId'
                ,url: '/mark/showPaperDetails?id='+result //数据接口
                ,method:'get'
                ,page: true
                ,cols: [[ //表头
                    // {field: 'testPaperId', title: '序号', width:100, fixed: 'center',sort:true}
                    {field: 'testPaperName', title: '试卷名称', width:150}
                    ,{field: 'testPaperDate', title: '考试日期', width:200}
                    ,{field: 'testPaperStartTime', title: '开始时间', width:150}
                    ,{field: 'testPaperEndTime', title: '结束时间', width:150}
                    ,{field: 'testPaperFullMark', title: '总分', width:150}
                    ,{field: 'testPaperPassMark', title: '及格分', width:150}
                    //,{title: '操作', width: 300 ,toolbar: '#testCenter_demo'}
                ]]

            });

            table.render({
                elem: '#shijuan_tab'
                ,id: 'testPaperId'
                ,url: '/mark/showPaperDetails?id='+result //数据接口
                ,method:'get'
                ,page: true
                ,cols: [[ //表头
                    // {field: 'testPaperId', title: '序号', width:100, fixed: 'center',sort:true}
                    {field: 'testPaperName', title: '试卷名称', width:150}
                    ,{field: 'testPaperDate', title: '考试日期', width:200}
                    ,{field: 'testPaperStartTime', title: '开始时间', width:150}
                    ,{field: 'testPaperEndTime', title: '结束时间', width:150}
                    ,{field: 'testPaperFullMark', title: '总分', width:150}
                    ,{field: 'testPaperPassMark', title: '及格分', width:150}
                    //,{title: '操作', width: 300 ,toolbar: '#testCenter_demo'}
                ]]
            })

            /*  table.on('tool(testCenter_tab)',function (object) {
                  var data = object.data;
                  var layEvent = object.event;
                  if (layEvent==='testDetails'){
                      window.location.href="/jsps/markPapers/testDetail.jsp?id="+data.testPaperId;
                  }else if (layEvent==='outPaper'){

                  }
              })*/




            /*var $ = layui.$, active = {
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
            };*/

            /*$('#btn').on('click', function(){
                alert(123);
                var type = $(this).data('type');//data-type
                console.log(type)
                active[type] ? active[type].call(this) : '';
            })*/

        });
    }



</script>

</html>
