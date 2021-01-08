<%--
  Created by IntelliJ IDEA.
  User: HQKJ
  Date: 2021/1/2
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>判卷</title>
    <%-- 告诉IE浏览器,用最新版本的IE来渲染页面--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <%-- 设置移动设备优先--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/layui/css/modules/layer/default/layer.css">
    <link href="/static/css/gradePaper.css" rel="stylesheet">
    <link href="/static/myjs/home/main.css" rel="stylesheet" type="text/css"/>
    <link href="/static/myjs/home/test.css" rel="stylesheet" type="text/css"/>

    <script src="/static/layui/layui.js" type="text/javascript"></script>
    <script src="/static/layui/lay/modules/table.js" type="text/javascript"></script>

    <style>
        .hasBeenAnswer {
            background: #5d9cec;
            color: #fff;
        }

        .reading h2 {
            width: 100%;
            margin: 20px 0 70px;
            text-align: center;
            line-height: 2;
            font-size: 20px;
            color: #59595b;
        }

        .reading h2 a {
            text-decoration: none;
            color: #59595b;
            font-size: 20px;
        }

        .reading h2 a:hover {
            color: #2183f1;
        }
    </style>
</head>
<body>
<div class="main">
    <!--nr start-->
    <div class="test_main">
        <div class="nr_left">
            <div class="test">
                <form action="" method="post" id="userpaperForm">
                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>单选题</h2>
                            <p>
                                <span>共</span><i class="content_lit">60</i><span>题，</span><span>合计</span><i
                                    class="content_fs">60</i><span>分</span>
                            </p>
                        </div>
                    </div>
                    <div class="test_content_nr">
                        <ul id="danxuan"></ul>
                    </div>

                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>多选题</h2>
                            <p>
                                <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i
                                    class="content_fs">30</i><span>分</span>
                            </p>
                        </div>
                    </div>


                    <div class="test_content_nr">
                        <ul id="duoxuan"></ul>
                    </div>

                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>判断题</h2>
                            <p>
                                <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i
                                    class="content_fs">30</i><span>分</span>
                            </p>
                        </div>
                    </div>

                    <div class="test_content_nr">
                        <ul id="panduan"></ul>
                    </div>


                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>填空题</h2>
                            <p>
                                <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i
                                    class="content_fs">30</i><span>分</span>
                            </p>
                        </div>
                    </div>

                    <div class="test_content_nr">
                        <ul id="tiankong"></ul>
                    </div>

                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>简答题</h2>
                            <p>
                                <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i
                                    class="content_fs">30</i><span>分</span>
                            </p>
                        </div>
                    </div>

                    <div class="test_content_nr">
                        <ul id="jiandati"></ul>
                    </div>

                </form>


            </div>
            <div style="margin-left: 300px;margin-top: 30px">
                <button class="layui-btn" style="
           border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;" onclick="pigaiFinish()">批改完成
                </button>
            </div>
        </div>

    </div>
</div>
<div style="margin-left: 500px">
    <button class="layui-btn" style="
           border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;" onclick="goback()">返回
    </button>
</div>
</body>
<script>
    $(function () {
        $("#show").html(oneValues());
    })

    //接收一个值
    function oneValues() {
        var result;
        var url = window.location.search; //获取url中"?"符后的字串
        if (url.indexOf("?") != -1) {
            result = url.substr(url.indexOf("=") + 1);
        }
        //return result;
        showUserTestPaper(result);
        console.log(result)
    }

    function goback() {
        window.location.href = "/jsps/markPapers/testDetail.jsp"
    }

    function showUserTestPaper(result) {
        //alert(result)
        $.ajax({
            url: '/mark/showTestPaperById',
            type: 'post',
            dataType: 'json',
            data: {id: result},
            success: function (data) {

                console.log(data);
                var c = 0;//定一个c 单选是几号题
                var d = 0;
                var p = 0;
                var j = 0;
                var a = 0;
                console.log(data.questionBankType)

                for (var i = 0; i < data.length; i++) {

                    if (data[i].questionBankType == "单选题") {
                        c++;
                        $("#danxuan").append("")
                        $("#danxuan").append(
                            " <li id=\"qu_0_" + c + "\">\n" +
                            "     <div class=\"test_content_nr_tt\">\n" +
                            "          <i>" + c + "</i><span>(" + data[i].questionBankScore + "分)</span><font>" + data[i].questionBankContent + "</font><b class=\"icon iconfont\">&#xe881;</b>\n" +
                            "     </div>\n" +
                            "\n" +
                            "     <div class=\"test_content_nr_main\">\n" +
                            "          <ul>\n" +
                            "\n" +
                            "             <li class=\"option\">\n" +
                            "\n" +
                            "                <input type=\"radio\" class=\"radioOrCheck\" value='A' name=\"option" + c + "\"\n" +
                            "                    id=\"0_answer_" + c + "_option_1\" />\n" +
                            "\n" +
                            "\n" +
                            "                <label for=\"0_answer_" + c + "_option_1\">\n" +
                            "                        A.\n" +
                            "                   <p class=\"ue\" style=\"display: inline;\">" + data[i].optionA + "</p>\n" +
                            "                </label>\n" +
                            "             </li>\n" +
                            "\n" +
                            "              <li class=\"option\">\n" +
                            "\n" +
                            "                   <input type=\"radio\" class=\"radioOrCheck\" value='B' name=\"option" + c + "\"\n" +
                            "                    id=\"0_answer_" + c + "_option_2\" />\n" +
                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + c + "_option_2\">\n" +
                            "                        B.\n" +
                            "                        <p class=\"ue\" style=\"display: inline;\">" + data[i].optionB + "</p>\n" +
                            "                    </label>\n" +
                            "                </li>\n" +
                            "\n" +
                            "              <li class=\"option\">\n" +
                            "\n" +
                            "                   <input type=\"radio\" class=\"radioOrCheck\" value='C' name=\"option" + c + "\"\n" +
                            "                    id=\"0_answer_" + c + "_option_2\" />\n" +
                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + c + "_option_2\">\n" +
                            "                       C.\n" +
                            "                        <p class=\"ue\" style=\"display: inline;\">" + data[i].optionC + "</p>\n" +
                            "                    </label>\n" +
                            "                </li>\n" +
                            "\n" +
                            "              <li class=\"option\">\n" +
                            "\n" +
                            "                   <input type=\"radio\" class=\"radioOrCheck\" value='D' name=\"option" + c + "\"\n" +
                            "                    id=\"0_answer_" + c + "_option_2\" />\n" +
                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + c + "_option_2\">\n" +
                            "                        D.\n" +
                            "                        <p class=\"ue\" style=\"display: inline;\">" + data[i].optionD + "</p>\n" +
                            "                    </label>\n" +
                            "                </li>\n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + c + "_option_4\">\n" +
                            "                        答案：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].questionBankAnswer + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + c + "_option_4\">\n" +
                            "                        分值：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].questionBankScore + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                 <li>" +
                            "\n" +
                            "                      得分：\n" +
                            "                      <input type='text' name='score'>" +
                            "                 </li>" +
                            "\n" +
                            "         </ul>\n" +
                            "     </div>\n" +
                            "</li> "
                        )


                         $('input[type="radio"]:checked').val();

                         $("input[type='radio']").val(data[a].answer).prop("checked", "true");



                        console.log(data[i].answer)
                    }

                    if (data[i].questionBankType == "多选题") {
                        d++;
                        $("#duoxuan").append(" " +
                            "<li id=\"qu_1_" + d + "\">\n" +
                            "                                    <div class=\"test_content_nr_tt\">\n" +
                            "                                        <i>" + d + "</i><span>(" + data[i].questionBankScore + "分)</span><font>" + data[i].questionBankContent + "</font><b class=\"icon iconfont\">&#xe881;</b>\n" +
                            "                                    </div>\n" +
                            "\n" +
                            "                                    <div class=\"test_content_nr_main\">\n" +
                            "                                        <ul>\n" +
                            "\n" +
                            "                                            <li class=\"option\">\n" +
                            "\n" +
                            "\n" +
                            "                                                <input type=\"checkbox\" class=\"radioOrCheck\" name=\"answer" + d + "\"\n" +
                            "                                                       id=\"1_answer_" + d + "_option_1\" />\n" +
                            "\n" +
                            "                                                <label for=\"1_answer_" + d + "_option_1\">\n" +
                            "                                                    A.\n" +
                            "                                                    <p class=\"ue\" style=\"display: inline;\">" + data[i].optionA + "</p>\n" +
                            "                                                </label>\n" +
                            "                                            </li>\n" +
                            "\n" +
                            "                                            <li class=\"option\">\n" +
                            "\n" +
                            "\n" +
                            "                                                <input type=\"checkbox\" class=\"radioOrCheck\" name=\"answer\"\n" +
                            "                                                       id=\"1_answer_" + d + "_option_2\" />\n" +
                            "\n" +
                            "                                                <label for=\"1_answer_" + d + "_option_2\">\n" +
                            "                                                    B.\n" +
                            "                                                    <p class=\"ue\" style=\"display: inline;\">" + data[i].optionB + "</p>\n" +
                            "                                                </label>\n" +
                            "                                            </li>\n" +
                            "\n" +
                            "                                            <li class=\"option\">\n" +
                            "\n" +
                            "\n" +
                            "                                                <input type=\"checkbox\" class=\"radioOrCheck\" name=\"answer\"\n" +
                            "                                                       id=\"1_answer_" + d + "_option_3\" />\n" +
                            "\n" +
                            "                                                <label for=\"1_answer_" + d + "_option_3\">\n" +
                            "                                                    C.\n" +
                            "                                                    <p class=\"ue\" style=\"display: inline;\">" + data[i].optionC + "</p>\n" +
                            "                                                </label>\n" +
                            "                                            </li>\n" +
                            "\n" +
                            "                                            <li class=\"option\">\n" +
                            "\n" +
                            "\n" +
                            "                                                <input type=\"checkbox\" class=\"radioOrCheck\" name=\"answer\"\n" +
                            "                                                       id=\"1_answer_" + d + "_option_4\" />\n" +
                            "\n" +
                            "                                                <label for=\"1_answer_" + d + "_option_4\">\n" +
                            "                                                    D.\n" +
                            "                                                    <p class=\"ue\" style=\"display: inline;\">" + data[i].optionD + "</p>\n" +
                            "                                                </label>\n" +
                            "                                            </li>\n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + d + "_option_4\">\n" +
                            "                        答案：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].questionBankAnswer + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + d + "_option_4\">\n" +
                            "                        分值：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].questionBankScore + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                 <li>" +
                            "\n" +
                            "                      得分：\n" +
                            "                      <input type='text' name='score'>" +
                            "                 </li>" +
                            "\n" +
                            "                                        </ul>\n" +
                            "                                    </div>\n" +
                            "                                </li>\n")

                        /* $('input[type="checkbox"]:checked').val();
                         console.log(data[i].answer)
                         //var a = $("input:radio[value='"+data[i].answer+"']").attr("checked", "true");
                         $("input[type='checkbox']").val(data[i].answer).prop("checked", "true");*/
                        var check = data[i].answer;
                        console.log(check);
                        var box = check.split(",");
                          $("input[type=checkbox]").each(function () {
                              $(this).prop("checked",true);

                          })



                    }

                    if (data[i].questionBankType == "判断题") {
                        p++;
                        $("#panduan").append("<li id=\"qu_2_" + p + "\">\n" +
                            "                                    <div class=\"test_content_nr_tt\">\n" +
                            "                                        <i>" + p + "</i><span>(" + data[i].questionBankScore + "分)</span><font>" + data[i].questionBankContent + "</font><b class=\"icon iconfont\">&#xe881;</b>\n" +
                            "                                    </div>\n" +
                            "\n" +
                            "                                    <div class=\"test_content_nr_main\">\n" +
                            "                                        <ul>\n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + j + "_option_4\">\n" +
                            "                        答案：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].answer + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                           /* "                                            <li class=\"option\">\n" +
                            "\n" +
                              "                                                <input type=\"radio\" class=\"radioOrCheck\" name=\"answer"+p+"\"\n" +
                              "                                                       id=\"2_answer_"+p+"_option_1\" />\n" +
                            "\n" +
                            "\n" +
                            "                                                <label for=\"2_answer_" + p + "_option_1\">\n" +
                            "                                                   正确\n" +
                            "                                                </label>\n" +
                            "                                            </li>\n" +
                            "\n" +*/
                            /*"                                            <li class=\"option\">\n" +
                            "\n" +
                            "                                                <input type=\"radio\" class=\"radioOrCheck\" name=\"answer"+p+"\"\n" +
                            "                                                       id=\"2_answer_"+p+"_option_2\" />\n" +
                            "\n" +
                            "\n" +
                            "                                                <label for=\"2_answer_" + p + "_option_2\">\n" +
                            "                                                    错误\n" +
                            "                                                </label>\n" +
                            "                                            </li>\n" +*/
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + p + "_option_4\">\n" +
                            "                        正确答案：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].questionBankAnswer + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + p + "_option_4\">\n" +
                            "                        分值：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].questionBankScore + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                 <li>" +
                            "\n" +
                            "                      得分：\n" +
                            "                     <input type='text' name='score'>" +
                            "                 </li>" +
                            "\n" +
                            "                                           \n" +
                            "                                        </ul>\n" +
                            "                                    </div>\n" +
                            "                                </li>");

                    }

                    if (data[i].questionBankType == "填空题") {
                        a++;
                        $("#tiankong").append("<li id=\"qu_4_" + a + "\">\n" +
                            "                                    <div class=\"test_content_nr_tt\">\n" +
                            "                                        <i>" + a + "</i><span>(" + data[i].questionBankScore + "分)</span><font>" + data[i].questionBankContent + "</font><b class=\"icon iconfont\">&#xe881;</b>\n" +
                            "                                    </div>\n" +
                            "\n" +
                            "                                    <div class=\"test_content_nr_main\">\n" +
                            "                                        <ul>\n" +
                            "\n" +
                            "                                            <li class=\"option\">\n" +
                            "\n" +
                            "\n" +
                            /*"                                              <textarea style=\"height: 100px;width: 765px\"  id=\"analysis"+j+"\" class=\"form-control\" rows=\"8\"></textarea>\n" +*/
                            "                                            </li>\n" +
                            "\n" +
                            "                                          \n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + j + "_option_4\">\n" +
                            "                        答案：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].answer + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + a + "_option_4\">\n" +
                            "                        正确答案：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].questionBankAnswer + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + a + "_option_4\">\n" +
                            "                        分值：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].questionBankScore + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                 <li>" +
                            "\n" +
                            "                      得分：\n" +
                            "                      <input type='text' name='score'>" +
                            "                 </li>" +
                            "\n" +
                            "                                        </ul>\n" +

                            "                                    </div>\n" +

                            "                                </li>")
                    }

                    //
                    if (data[i].questionBankType == "简答题") {
                        j++;
                        $("#jiandati").append("<li id=\"qu_4_" + j + "\">\n" +
                            "                                    <div class=\"test_content_nr_tt\">\n" +
                            "                                        <i>" + j + "</i><span>(" + data[i].questionBankScore + "分)</span><font>" + data[i].questionBankContent + "</font><b class=\"icon iconfont\">&#xe881;</b>\n" +
                            "                                    </div>\n" +
                            "\n" +
                            "                                    <div class=\"test_content_nr_main\">\n" +
                            "                                        <ul>\n" +
                            "\n" +
                            /*"                                            <li class=\"option\">\n" +
                            "\n" +
                            "\n" +
                            "                                              <textarea style=\"height: 100px;width: 765px\"  id=\"analysis" + j + "\" class=\"form-control\" rows=\"8\"></textarea>\n" +
                            "                                            </li>\n" +*/
                            "\n" +
                            "                                          \n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + j + "_option_4\">\n" +
                            "                        答案：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].answer + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + j + "_option_4\">\n" +
                            "                        正确答案：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].questionBankAnswer + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                <li class=\"option\">\n" +

                            "\n" +
                            "\n" +
                            "                    <label for=\"0_answer_" + j + "_option_4\">\n" +
                            "                        分值：\n" +
                            "                       <p class=\"ue\" style=\"display: inline;\">" + data[i].questionBankScore + "</p>\n" +
                            "                    </label>\n" +
                            "                 </li>\n" +
                            "\n" +
                            "                 <li>" +
                            "\n" +
                            "                      得分：\n" +
                            "                      <input type='text' name='score' id=''>" +
                            "                 </li>" +
                            "\n" +
                            "                                        </ul>\n" +

                            "                                    </div>\n" +

                            "                                </li>");
                    }


                }
            }

        })
    }
    
    function pigaiFinish() {
        var data = new FormData($("#userpaperForm")[0]);
        $.ajax({
            type:'post',
            url:"/mark/addScore",
            dataType:"json",
            data:data,
            processData: false,// true  ajax 提交的时候不会序列化 data，而是直接使用data
            contentType: false,
            success:function (data) {
                if (data){
                    alert("success")
                    subtable(json)
                }else {
                    alert("failed")
                }
            },
            error:function (data) {
                alert("Error")
            }
        })

    }

</script>
</html>
