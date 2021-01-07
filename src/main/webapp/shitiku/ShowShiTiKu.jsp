<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>组织考试</title>
</head>
<link rel="stylesheet" href="/static\bootstrap\css\bootstrap.min.css">
<link rel="stylesheet" href="/static\bootstrap\table\bootstrap-table.css">
<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static\bootstrap\js\bootstrap.js"></script>
<script src="/static\bootstrap\table\bootstrap-table.js"></script>
<script src="/static\bootstrap\js\bootstrap-table-zh-CN.min.js"></script>

<script src="/static\bootstrap\table\bootstrap-table-export.js"></script>
<script src="/static\bootstrap\table\jquery.base64.js"></script>
<script src="/static\bootstrap\table\tableExport.js"></script>


<body style="height: auto">

    <div style="width: 1300px; height: 800px; border:1px solid rgba(0,0,0,0.6); float: left; margin: 0px 0px 0px 50px; box-shadow: 0 0 8px black;">
        <h3 style="margin-bottom: 40px">试题库</h3>

        <div style="float: left">
            <span style="float: left; font-size: 17px; line-height: 34px; margin-left: 40px;">创建时间：</span>
            <input class="form-control date_1" id="date_1" type="datetime-local" style="width: 230px; float: left;">
            <span style="float: left; font-size: 17px; line-height: 34px; margin-left: 1px;">——</span>
            <input class="form-control date_1" id="date_2" type="datetime-local" style="width: 230px;" >
        </div>

        <div style="float: left">
            <span style="float: left; font-size: 17px; line-height: 34px; margin-left: 40px;">试题类型：</span>
            <select class="form-control date_1" id="xiala"  style="width: 100px; float: left;">
            </select>
        </div>

        <div style="float: left">
            <span style="float: left; font-size: 17px; line-height: 34px; margin-left: 40px;">试题分类：</span>
            <select class="form-control date_1" id="xiala2"  style="width: 100px; float: left;">
            </select>
        </div>

        <div style="float: left; margin-left: 40px;" id="temp3">
            <input type="button" value="查询" class="btn-success btn" onclick="mohuchaxun()">
            &nbsp;
            <input type="reset" value="重置"  class="btn-danger btn " >

        </div>

        <div style="float: left ;margin-left: 40px; margin-top: 20px">
            <input type="button" value="模板导入" class="btn-primary btn">
            &nbsp;
            <input type="button" value="新增试题" class="btn-primary btn" onclick="addShiti()">
        </div>

        <div style="margin-top: 12%;margin-left: 40px;margin-right: 40px;height: 450px">
            <table  id="shiti_table"> </table>
        </div>

    </div>


<%--添加试题弹出模态框--%>
<div id="addQuestionModal" class="bootbox modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增题目</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" >

                    <div class="form-group">
                        <label class="col-sm-2 control-label">试题分类</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="questionBankClassifyId">
                            </select>
                        </div>
                    </div>



                    <div class="form-group">
                        <label class="col-sm-2 control-label">题目内容</label>
                        <div class="col-sm-8">
                            <textarea  id="questionBankContent" class="form-control" rows="8"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">题目类型</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="questionBankType">
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">A选项</label>
                        <div class="col-sm-8">
                            <input id="optionA" type="text" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">B选项</label>
                        <div class="col-sm-8">
                            <input id="optionB" type="text" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">C选项</label>
                        <div class="col-sm-8">
                            <input id="optionC" type="text" class="form-control" placeholder="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">D选项</label>
                        <div class="col-sm-8">
                            <input id="optionD" type="text" class="form-control" placeholder="" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">题目答案</label>
                        <div class="col-sm-8">
                            <textarea  id="questionBankAnswer" placeholder="例如（A，B，C，D）" class="form-control" rows="8"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">答案解析</label>
                        <div class="col-sm-8">
                            <textarea  id="analysis" class="form-control" rows="8"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">题目难度</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="difficulty">
                                <option th:value="1">
                                    一星难度
                                </option>
                                <option th:value="2">
                                    二星难度
                                </option>
                                <option th:value="3">
                                    三星难度
                                </option>
                                <option th:value="4">
                                    四星难度
                                </option>
                                <option th:value="5">
                                    五星难度
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">题目分值</label>
                        <div class="col-sm-8">
                            <input id="questionBankScore" type="text" class="form-control" placeholder="" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button data-bb-handler="confirm" type="button" id="confirmAddQuestionBtn" class="btn btn-success radius">
                    <span><i class="icon-ok"></i></span> 确定
                </button>
                <button data-bb-handler="cancel" type="button" id="cancelAddQuestionBtn" class="btn btn-danger radius">取消</button>
            </div>
        </div>
    </div>
</div>

<%--删出试题弹出模态框--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">确认框</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label class="control-label">确定要删除试题吗？</label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    <button type="button" class="btn btn-primary" id="DeletequestionIFOK">确认</button>
                </div>
            </div>
        </div>
</div>

<%--查看试题弹出模态框--%>
<div id="lookONEQuestionModal" class="bootbox modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="">查看详情</h4>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" role="form" >

                        <div class="form-group">
                            <label class="col-sm-2 control-label">试题分类</label>
                            <div class="col-sm-8">
                                <input readonly id="lookquestionBankClassifyId" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">题目内容</label>
                            <div class="col-sm-8">
                                <textarea readonly style="height: 60px"  id="lookquestionBankContent" class="form-control" rows="8"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">题目类型</label>
                            <div class="col-sm-8">
                                <input readonly id="lookquestionBankType" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">A选项</label>
                            <div class="col-sm-8">
                                <input readonly id="lookoptionA" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">B选项</label>
                            <div class="col-sm-8">
                                <input readonly id="lookoptionB" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">C选项</label>
                            <div class="col-sm-8">
                                <input readonly id="lookoptionC" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">D选项</label>
                            <div class="col-sm-8">
                                <input readonly id="lookoptionD" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">题目答案</label>
                            <div class="col-sm-8">
                                <textarea readonly  style="height: 60px" id="lookquestionBankAnswer" class="form-control" rows="8"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">答案解析</label>
                            <div class="col-sm-8">
                                <textarea readonly style="height: 60px"  id="lookanalysis" class="form-control" rows="8"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">题目难度</label>
                            <div class="col-sm-8">
                                <input readonly id="lookdifficulty" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">题目分值</label>
                            <div class="col-sm-8">
                                <input readonly id="lookquestionBankScore" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button data-bb-handler="cancel" type="button" data-dismiss="modal"  class="btn btn-success">返回</button>
                </div>
            </div>
        </div>
    </div>

<%--修改试题弹出模态框--%>
<div id="UpOneQuestionModal" class="bootbox modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >查看详情</h4>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" role="form" >

                        <div class="form-group">
                            <label class="col-sm-2 control-label">试题分类</label>
                            <div class="col-sm-8">
                                <select class="form-control" disabled id="questionBankClassifyId1">
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">题目内容</label>
                            <div class="col-sm-8">
                                <textarea style="height: 60px" id="questionBankContent1" class="form-control" rows="8"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">题目类型</label>
                            <div class="col-sm-8">
                                <select class="form-control" disabled id="questionBankType1">
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">A选项</label>
                            <div class="col-sm-8">
                                <input id="optionA1" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">B选项</label>
                            <div class="col-sm-8">
                                <input id="optionB1" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">C选项</label>
                            <div class="col-sm-8">
                                <input id="optionC1" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">D选项</label>
                            <div class="col-sm-8">
                                <input id="optionD1" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">题目答案</label>
                            <div class="col-sm-8">
                                <textarea  style="height: 60px"  id="questionBankAnswer1" placeholder="例如（A，B，C，D）" class="form-control" rows="8"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">答案解析</label>
                            <div class="col-sm-8">
                                <textarea style="height: 60px"  id="analysis1" class="form-control" rows="8"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">题目难度</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="difficulty1">
                                    <option th:value="1">
                                        一星难度
                                    </option>
                                    <option th:value="2">
                                        二星难度
                                    </option>
                                    <option th:value="3">
                                        三星难度
                                    </option>
                                    <option th:value="4">
                                        四星难度
                                    </option>
                                    <option th:value="5">
                                        五星难度
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">题目分值</label>
                            <div class="col-sm-8">
                                <input id="questionBankScore1" type="text" class="form-control" placeholder="" />
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button data-bb-handler="cancel" type="button" data-dismiss="modal"  class="btn btn-success">返回</button>
                    <button data-bb-handler="cancel" type="button" data-dismiss="modal" id="UpOnequestionIFOK" class="btn btn-success">修改</button>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
<script>


    //页面初始化
    $(function () {
        getll();
        shitileixing();
        shitifenlei();

    })

    //展示当前用户的添加的所有试题
    function getll(){
        $('#shiti_table').bootstrapTable({
            url: '/BiCon/selectBankBi',
            method: 'post',
            contentType:'application/x-www-form-urlencoded; charset=UTF-8',
            striped : true, //是否显示行间隔色
            pagination : true,//是否分页
            sidePagination : 'server',//server:服务器端分页|client：前端分页
            pageNumber: 1,
            pageSize: 10,
            pageList: [5, 10, 20, 40, 80, 100],
            cache: false,
            clickToSelect:true,		 //设置复选框头
            responseHandler:responseHandler,//请求数据成功后，渲染表格前的方法
            queryParams: function (params) {
                var aa = {
                    "limit":params.limit, //每页显示的记录数
                    "offset":params.offset, //当前第几页

                    "datetimestrat":$("#date_1").val(),
                    "datetimeend":$("#date_2").val(),
                    "xialakuang1":$("#xiala").val(),
                    "xialakuang2":$("#xiala2").val(),
                };
                return aa;
            },
            columns: [
                {checkbox: true,align: 'center',},
                {field: "questionBankId", title: "试题ID", align: 'center'},
                {title: '试题内容', field: 'questionBankContent', align: 'center' },
                {title: '试题分类',    field: 'questionBankClassify',align: 'center'},
                {title: '试题类型', field: 'questionBankType',align: 'center'},
                {title: '标准答案', field: 'questionBankAnswer',align: 'center'},
                {title: '分数',    field: 'questionBankScore',align: 'center'},
                {title: '共项库',    field: 'sharedState',align: 'center',
                    formatter: function (value, row, index) {

                        if(row.sharedState==3){
                            return  html='　<a href="javascript:TopicUpTwo(' + row.questionBankId + ')">添加到共享题库</a>';
                        }
                        else if(row.sharedState==1){
                            return  '审核中';
                        }else if(row.sharedState==2){
                            return '此题为共享题';
                        }
                    }
                },
                {title: '操作',    field: '',align: 'center',
                    formatter: function (value, row, index) {
                        var html = '<a href="javascript:UpOnequestion('+ row.questionBankId + ')">编辑</a>';
                        html += '　<a href="javascript:Deletequestion(' + row.questionBankId + ')">删除</a>';
                        html += '　<a href="javascript:lookOnequestion(' + row.questionBankId + ')">查看</a>';
                        return html;
                    }

                }
            ],

            showExport: true,  //是否显示导出按钮
            buttonsAlign:"right",  //按钮位置
            exportTypes:['excel','doc','txt'],  //导出文件类型，[ 'csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf']
            exportOptions: {//导出设置
                fileName: 'TableQuestions试题库',//下载文件名称
                ignoreColumn: [0,7],//忽略某一列的索引
                exportDataType: 'basic',//basic', 'all', 'selected'.
            },
        });
    }

    //请求成功方法
    function responseHandler(res){
        var data = res.list;
        return {
            'total': res.total, //总的数据长度
            'rows': res.list //单页查询返回的数据
        }
    };

    //修改单条试题  先查询
    function UpOnequestion(questionBankId) {
        $("#UpOneQuestionModal").modal('show')
        $.ajax({
            url: "/BiCon/lookOnequestion",
            dataType: "json",
            type: "post",
            data:{"questionBankId":questionBankId },//获取到试题ID
            success: function(data) {
                if(data.msg=="成功"){
                    var  questionOne = data.data;
                    $("#questionBankContent1").val(questionOne.questionBankContent)//题目内容
                    $("#questionBankType1").val(questionOne.questionBankType)//题目类型
                    $("#optionA1").val(questionOne.optionA)//A选项
                    $("#optionB1").val(questionOne.optionB)//B选项
                    $("#optionC1").val(questionOne.optionC)//C选项
                    $("#optionD1").val(questionOne.optionD)//D选项
                    $("#questionBankAnswer1").val(questionOne.questionBankAnswer)//题目答案
                    $("#analysis1").val(questionOne.analysis)//答案解析
                    $("#difficulty1").val(questionOne.difficulty);// 试题难度
                    $("#questionBankScore1").val(questionOne.questionBankScore);//题目分值
                    $("#questionBankClassifyId1").val(questionOne.questionBankClassify);//试题分类  语文数学英语
                }
            }
        })

        //确认修改UpOnequestionIFOK
        $("#UpOnequestionIFOK").click(function(){

            //判断是否没填写
            if($("#questionBankClassifyId1").val()=='请选择'){ alert("请选择试题分类！"); return false;}
            if($("#questionBankContent1").val()==''){ alert("题目内容不能为空！"); return false;}
            if($("#questionBankType1").val()=='请选择'){ alert("请选择题目类型"); return false;}
            if($("#questionBankAnswer1").val()==''){ alert("题目答案不能为空！"); return false;}
            if($("#analysis1").val()==''){ alert("答案解析不能为空！"); return false;}
            if($("#questionBankScore1").val()==''){ alert("题目分值不能为空！"); return false;}

            var  questionBankContent = $("#questionBankContent1").val();
            var  questionBankType = $("#questionBankType1").val();
            var questionBankClassify = $("#questionBankClassifyId1").val();
            var optionA  = $("#optionA1").val();
            var optionB  = $("#optionB1").val();
            var optionC  = $("#optionC1").val();
            var optionD  = $("#optionD1").val();
            var questionBankAnswer = $("#questionBankAnswer1").val();
            var analysis = $("#analysis1").val();
            var difficulty = $("#difficulty1").val();
            var questionBankScore = $("#questionBankScore1").val();

            $.ajax({
                url: "/BiCon/UpOnequestionOK",
                dataType: "json",
                type: "post",
                data:{
                    "questionBankId":questionBankId,
                    "questionBankContent": questionBankContent,
                    "questionBankType":questionBankType,
                    "questionBankClassify":questionBankClassify,
                    "optionA":optionA,
                    "optionB":optionB,
                    "optionC":optionC,
                    "optionD":optionD,
                    "questionBankAnswer":questionBankAnswer,
                    "analysis":analysis,
                    "difficulty":difficulty,
                    "questionBankScore":questionBankScore
                },
                traditional : true,
                async : false,
                success: function(data) {
                    console.log(data.msg)
                    if(data.msg=="成功"){
                        alert("修改成功")
                        $("#UpOneQuestionModal").modal('hide')
                        $('#shiti_table').bootstrapTable('refresh');
                    }else{
                        alert("请重新修改！！")
                    }
                },
            })


        });

    }



    //查看当前这条试题详情
    function  lookOnequestion(questionBankId) {

        $("#lookONEQuestionModal").modal("show")
        // console.log($("#lookquestionBankContent").val(''))//题目内容
        // console.log($("#lookquestionBankType").val())//题目类型
        // console.log($("#lookoptionA").val())//A选项
        // console.log($("#lookoptionB").val())//B选项
        // console.log($("#lookoptionC").val())//C选项
        // console.log($("#lookoptionD").val())//D选项
        // console.log($("#lookquestionBankAnswer").val())//题目答案
        // console.log($("#lookanalysis").val());//答案解析
        // console.log($("#lookdifficulty").val());// 试题难度
        // console.log($("#lookquestionBankScore").val());//题目分值
        // console.log($("#lookquestionBankClassify").val());//试题分类  语文数学英语

        $.ajax({
            url: "/BiCon/lookOnequestion",
            dataType: "json",
            type: "post",
            data:{"questionBankId":questionBankId },//获取到试题ID
            success: function(data) {
                if(data.msg=="成功"){
                    var  questionOne = data.data;

                    $("#lookquestionBankContent").val(questionOne.questionBankContent)//题目内容
                    $("#lookquestionBankType").val(questionOne.questionBankType)//题目类型
                    $("#lookoptionA").val(questionOne.optionA)//A选项
                    $("#lookoptionB").val(questionOne.optionB)//B选项
                    $("#lookoptionC").val(questionOne.optionC)//C选项
                    $("#lookoptionD").val(questionOne.optionD)//D选项
                    $("#lookquestionBankAnswer").val(questionOne.questionBankAnswer)//题目答案
                    $("#lookanalysis").val(questionOne.analysis)//答案解析
                    $("#lookdifficulty").val(questionOne.difficulty);// 试题难度
                    $("#lookquestionBankScore").val(questionOne.questionBankScore);//题目分值
                    $("#lookquestionBankClassifyId").val(questionOne.questionBankClassify);//试题分类  语文数学英语
                }
            }
        })

    }

    //点击删除弹出  是否确认
    function  Deletequestion(questionBankId) {
        $("#exampleModal").modal("show")

        //删除试题确认删除
        $("#DeletequestionIFOK").click(function(){
            $.ajax({
                url: "/BiCon/Deletequestion",
                dataType: "json",
                type: "post",
                data:{
                    //获取到试题ID
                    "questionBankId":questionBankId
                },
                success: function(data) {
                    if (data.msg == "成功") {
                        $("#exampleModal").modal("hide")
                        $('#shiti_table').bootstrapTable('refresh');
                    }
                }
            })
        })

    }

    //申请添加到共享题库
    function  TopicUpTwo(questionBankId) {

        $.ajax({
            url: "/BiCon/TopicUpTwo",
            dataType: "json",
            type: "post",
            data:{
                //获取到试题ID
                "questionBankId":questionBankId
            },
            success: function(data) {
                if(data.msg=="成功"){
                    alert("已提交申请")
                    $('#shiti_table').bootstrapTable('refresh');
                }else{
                    alert("！！Error重新申请！！")
                }
            }
        })

    }

    function  mohuchaxun() {
        console.log(".....模糊查询")

        $('#shiti_table').bootstrapTable("destroy");

        getll();
    }

    //查询试题类型
    function  shitileixing() {
        $.ajax({
            url: "/BiCon/selectQuestionBankType",
            dataType: "json",
            type: "post",
            processData: false,
            contentType: false,
            success: function(data) {  //这里就是我出错的地方
                console.log(data.data)
                var obj ="";
                for (var j = 0; j < data.data.length; j++) {
                    obj += "<option value=\""  + data.data[j].questionBankType + "\">" + data.data[j].questionBankType + "</option>";
                }
                $("#xiala").append("<option value='请选择'  >请选择...</option>"+ obj);
                $("#questionBankType").append("<option value='请选择'  >请选择...</option>"+ obj);
                $("#questionBankType1").append("<option value='请选择'  >请选择...</option>"+ obj);
            },
        })
    }

    //查询试题分类（语文  数学 英语等。。。）
    function  shitifenlei() {
        $.ajax({
            url: "/BiCon/selectQuestionBankClassify",
            dataType: "json",
            type: "post",
            processData: false,
            contentType: false,
            success: function(data) {
                console.log(data.data)
                var cc ="";
                for (var j = 0; j < data.data.length; j++) {
                    cc += "<option value=\""  + data.data[j].questionBankClassify + "\">" + data.data[j].questionBankClassify + "</option>";
                }
                $("#xiala2").append("<option value='请选择'  >请选择...</option>"+ cc);
                $("#questionBankClassifyId").append("<option value='请选择'  >请选择...</option>"+ cc);
                $("#questionBankClassifyId1").append("<option value='请选择'  >请选择...</option>"+ cc);

            },
        })
    }

    //    addShiti新增试题  弹出模态款
    function addShiti() {
        $("#addQuestionModal").modal('show')
    }

    //    addShiti新增试题  取消模态框
    $("#cancelAddQuestionBtn").click(function(){

        $("#addQuestionModal").modal('hide')

    });

    //    addShiti新增试题  提交模态框
    $("#confirmAddQuestionBtn").click(function(){

        console.log($("#questionBankContent").val())//题目内容
        console.log($("#questionBankType").val())//题目类型
        console.log($("#optionA").val())//A选项
        console.log($("#optionB").val())//B选项
        console.log($("#optionC").val())//C选项
        console.log($("#optionD").val())//D选项
        console.log($("#questionBankAnswer").val())//题目答案
        console.log($("#analysis").val());//答案解析
        console.log($("#difficulty").val());// 试题难度
        console.log($("#questionBankScore").val());//题目分值
        console.log($("#questionBankClassify").val());//试题匪类  语文数学英语

        //判断是否没填写
        if($("#questionBankClassifyId").val()=='请选择'){ alert("请选择试题分类！"); return false;}
        if($("#questionBankContent").val()==''){ alert("题目内容不能为空！"); return false;}
        if($("#questionBankType").val()=='请选择'){ alert("请选择题目类型"); return false;}
        if($("#questionBankAnswer").val()==''){ alert("题目答案不能为空！"); return false;}
        if($("#analysis").val()==''){ alert("答案解析不能为空！"); return false;}
        if($("#questionBankScore").val()==''){ alert("题目分值不能为空！"); return false;}

        var  questionBankContent = $("#questionBankContent").val();
        var  questionBankType = $("#questionBankType").val();
        var questionBankClassify = $("#questionBankClassifyId").val();
        var optionA  = $("#optionA").val();
        var optionB  = $("#optionB").val();
        var optionC  = $("#optionC").val();
        var optionD  = $("#optionD").val();
        var questionBankAnswer = $("#questionBankAnswer").val();
        var analysis = $("#analysis").val();
        var difficulty = $("#difficulty").val();
        var questionBankScore = $("#questionBankScore").val();

        $.ajax({
            url: "/BiCon/Addquestion_bank",
            dataType: "json",
            type: "post",
            data:{
                "questionBankContent": questionBankContent,
                "questionBankType":questionBankType,
                "questionBankClassify":questionBankClassify,
                "optionA":optionA,
                "optionB":optionB,
                "optionC":optionC,
                "optionD":optionD,
                "questionBankAnswer":questionBankAnswer,
                "analysis":analysis,
                "difficulty":difficulty,
                "questionBankScore":questionBankScore
            },
            traditional : true,
            async : false,
            success: function(data) {
                console.log(data.msg)
                if(data.msg=="成功"){
                    alert("添加成功")
                    $("#addQuestionModal").modal('hide')
                    $('#shiti_table').bootstrapTable('refresh');
                }else{
                    alert("请重新添加！！")
                }
            },
        })


    });





</script>