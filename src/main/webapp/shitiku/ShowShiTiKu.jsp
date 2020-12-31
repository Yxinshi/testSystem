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


<body>

<form class="form-horizontal" role="form">
    <div style="width: 1300px; height: 780px; border:1px solid rgba(0,0,0,0.6); float: left; margin: 0px 0px 0px 50px; box-shadow: 0 0 8px black;">
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
            <input type="button" value="模板导入" class="btn-primary btn" onclick="updata()">
            &nbsp;
            <input type="button" value="新增试题" class="btn-primary btn" onclick="updata()">
            &nbsp;
            <input type="button" value="同步至共享库"  class="btn-primary btn " >

        </div>

        <div style="margin-top: 12%;margin-left: 40px;margin-right: 40px;height: 450px">
            <table  id="shiti_table"> </table>
        </div>

    </div>

</form>

</body>
</html>
<script>

    $(function () {
        getll();
        shitileixing();
        shitifenlei();
    })

    //请求成功方法
    function responseHandler(res){
        var data = res.list;
        return {
            'total': res.total, //总的数据长度
            'rows': res.list //单页查询返回的数据
        }
    };

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
                {title: '操作',    field: '',align: 'center'}
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
            success: function(data) {  //这里就是我出错的地方
                console.log(data.data)
                var obj ="";
                for (var j = 0; j < data.data.length; j++) {
                    obj += "<option value=\""  + data.data[j].questionBankClassify + "\">" + data.data[j].questionBankClassify + "</option>";
                }
                $("#xiala2").append("<option value='请选择'  >请选择...</option>"+ obj);

            },
        })
    }



</script>