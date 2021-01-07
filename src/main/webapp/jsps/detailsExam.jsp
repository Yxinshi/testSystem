
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>

<link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/static/css/test.css" rel="stylesheet" type="text/css" />

<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.easy-pie-chart.js"></script>
<!--时间js-->
<script src="${pageContext.request.contextPath}/static/js/jquery.countdown.js"></script>


<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

<body >

<div id="abc" style="height: 600px">
    <div>
        <el-tabs v-model="activeName" @tab-click="handleClick" type="border-card">
            <el-tab-pane label="考试基本信息" name="first" class="tabPan">
                <%@include file="details/essentialInformation.jsp"%>
            </el-tab-pane>
            <el-tab-pane label="试卷预览" name="second" class="tabPan">
                <%@include file="details/PreviewTheInformation.jsp"%>
            </el-tab-pane>
        </el-tabs>
    </div>
</div>
</body>


<script>
    new Vue({
        el: '#abc',

        mounted: function(){
            //获取另个一页面的参数值
            this.getParameters();
            this.selectAs();
            console.log(this.id.key)
            var _this = this;
            axios
                .post('/kaoshi/essentialUser',{id:this.id.key})
                .then(function (res) {
                    _this.multipleSelection = res.data;
                })
            axios
                .post('/kaoshi/essentialExam',{id:this.id.key})
                .then(function (res) {
                    _this.list = res.data;
                })
        },
        data() {
            return {
                fileL:[],
                id:{},
                activeName: 'first',
                moneyStatus : 1,
                fileList:[],
                dialogVisible:false,
                contract:{},
                /*考试基本信息*/
                tissue:{},
                multipleSelection:[],
                list:{},
            };
        },
        methods: {
            wancheng(){

                location.href="${pageContext.request.contextPath}/jsps/SelectExam.jsp";
            },
            selectAs(){
                var _this = this;
                axios
                    .post('/kaoshi/essentialInformation',{id:this.id.key})
                    .then(function (res) {
                        _this.tissue = res.data;
                    })
            },
            handleClick(tab, event) {
                if(tab.name == 'second'){
                }else  if(tab.name == 'first'){
                }
            },

            //获取其他页面的参数
            getParameters(){
                var _this = this;
                var url = location.search //获取url中"?"符后的字串 ('?modFlag=business&role=1')
                var theRequest = new Object()
                if (url.indexOf('?') != -1) {
                    var str = url.substr(1) //substr()方法返回从参数值开始到结束的字符串；
                    var strs = str.split('&')
                    for (var i = 0; i < strs.length; i++) {
                        theRequest[strs[i].split('=')[0]] = strs[i].split('=')[1]
                    }
                    console.log(theRequest) //此时的theRequest就是我们需要的参数；
                    _this.id = theRequest

                };
            }

        }
    })
</script>



</html>
