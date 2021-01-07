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
    <link rel="stylesheet" href="/static/layui/css/modules/layer/default/layer.css">

    <script src="/static/layui/layui.js" type="text/javascript"></script>
    <script src="/static/layui/lay/modules/layer.js" type="text/javascript"></script>
    <script src="/static/layui/lay/modules/table.js" type="text/javascript"></script>
</head>
<body>
<%--<span>接收的值是：</span>--%>
<span id="show"></span>



    <div style="margin-left: 850px">
        <button class="layui-btn" style="
           border: none;
            color: white;
            text-align: right;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;" lay-filter="releaseGrade" id="releaseGrade" >发布成绩
        </button>
    </div>

    <div style="margin-left: 50px">
        <table id="shijuan_tab" lay-filter="shijuan_tab" style="width: 950px"></table>
    </div>

<p style="margin-left: 50px;font-size: 24px">人员列表</p>
    <div style="margin-left: 50px">
        <table id="testuser_tab" lay-filter="testuser_tab" style="margin-left: 50px"></table>
    </div>

<div style="margin-left: 500px">
    <button class="layui-btn" style="
           border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;" onclick="back()">返回
    </button>
</div>


<div hidden  id="addScore">
    <form id="addMark" class="layui-form layui-form-pane" lay-filter="formDemo1">
        <p><h2 style="text-align: center;margin-top: 50px">是否发布成绩？发布后判卷结果不可修改</h2></p>
        <%--<div style="width:410px;float:left;margin-left: 50px" hidden>
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <label class="layui-form-label">考试名称</label>
                    <div class="layui-input-block">
                        <input type="text" style="width: 130px" name="name" id="name" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <label class="layui-form-label">工号</label>
                    <div class="layui-input-block">
                        <input type="text" style="width: 130px" name="jobNumber" id="jobNumber" autocomplete="off" class="layui-input">

                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <label class="layui-form-label">考试成绩</label>
                    <div class="layui-input-block">
                        <input type="text" autocomplete="off" name="totalPoints" id="totalPoints"
                               style="width: 130px"  placeholder="" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <label class="layui-form-label">判卷状态</label>
                    <div class="layui-input-block" style="width: 200px">
                        <input type="text" autocomplete="off" name="estimateStatus" id="estimateStatus" class="layui-input">
                    </div>
                </div>
            </div>

        </div>--%>

    </form>
</div>




</body>

<script>
    function back() {
        window.location.href="/jsps/markPapers/testList.jsp"
    }


    layui.use(['table','form'], function(obj){
        var table = layui.table;
        var form = layui.form;


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
            table.render({
                elem: '#shijuan_tab'
                ,id: 'testPaperId'
                ,url: '/mark/showPaperDetails?id='+result //数据接口
                ,method:'get'
                ,page: true
                ,width:950
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
                elem: '#testuser_tab'
                ,url: '/mark/showTestUser?id='+result //数据接口
                ,method:'get'
                ,page: true
                ,width:950
                ,cols: [[ //表头
                     //{field: 'userId', title: '序号', width:100, fixed: 'center',sort:true,hide:true}
                    {field: 'name', title: '姓名', width:150}
                    ,{field: 'jobNumber', title: '工号', width:200}
                    ,{field: 'totalPoints', title: '成绩', width:150}
                    ,{field: 'estimateStatus', title: '判卷状态', width:150, templet:function (d) {
                            if (d.estimateStatus=='1'){
                                return "已判卷";
                            }else
                            if (d.estimateStatus=='0'){
                                return "未判卷";
                            }
                        }}
                    ,{title: '操作', field:'id', width: 300 ,templet:function (d) {
                            if (d.estimateStatus=="1"){
                                return "<a style='color: #9F9F9F'>去判卷</a>";
                            }else if (d.estimateStatus=="0"){
                                console.log(d.userId)
                                return "<a style='color: #1E9FFF' href="+'/jsps/markPapers/goGradepapers.jsp?id='+d.userId+">去判卷</a>"
                            }
                        }}
                ]]
            })

           /* table.render({
                done:function (res) {
                    var estimateStatus= res.estimateStatus;
                    alert(estimateStatus)

                }

            })*/


            //row监听单击事件
           /* table.on('row(testuser_tab)',function (obj) {
                form.val('formDemo1', {
                    "name":obj.data.name,
                    "jobNumber":obj.data.jobNumber,
                    "totalPoints":obj.data.totalPoints,
                    "estimateStatus":obj.data.estimateStatus

                })
                layer.open({
                    type: 1
                    ,title: "查看详情" //1--页面层，2--iframe层 ，4--如果是用layer.open执行tips层
                    ,closeBtn: false
                    ,area: ['50%','50%']
                    ,shade: 0
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['取消']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: $("#addScore")/!*'是否发布成绩？发布后判卷结果不可修改'*!/

                })

            })*/



            $("#releaseGrade").click(function () {
                $.ajax({
                    url:"/mark/selectEstimateStatusById",
                    type:"post",
                    data:{id:result},
                    dataType:"json",
                    success:function (data) {
                        console.log(data)
                        //var data1 = jQuery.parseJSON(data);
                        //var arr = JSON.parse(data);
                        //console.log(data1.estimateStatus)
                        if (data){
                            layer.open({
                                type: 1
                                ,title: "发布成绩" //1--页面层，2--iframe层 ，4--如果是用layer.open执行tips层
                                ,closeBtn: false
                                ,area: ['30%','30%']
                                ,shade: 0
                                ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                                ,btn: ['发布','取消']
                                ,btnAlign: 'c'
                                ,moveType: 1 //拖拽模式，0或者1
                                ,content: $("#addScore")
                                ,yes:function (index,btn1) {

                                }

                            })
                        }else {
                            layer.open({
                                type: 1
                                ,title: "发布成绩" //1--页面层，2--iframe层 ，4--如果是用layer.open执行tips层
                                ,closeBtn: false
                                ,area: ['30%','30%']
                                ,shade: 0
                                ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                                ,btn: ['确定']
                                ,btnAlign: 'c'
                                ,moveType: 1 //拖拽模式，0或者1
                                ,content: '请先完成判卷'

                            })
                        }

                    },
                    error:function (error) {
                        console.log(error)
                    }

                })
                /*var estimateStatus = $("#estimateStatus").val();
                console.log(estimateStatus)*/

            })




        }



    });



</script>

</html>
