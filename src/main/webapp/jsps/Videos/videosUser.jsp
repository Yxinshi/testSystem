<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>组织考试</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->

<!-- 引入组件库 -->
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

<body>
<div id="ListingLink">

    姓名：
    <el-input v-model="name" placeholder="请输入内容" style="width: 260px"></el-input>
    工号：
    <el-input v-model="number" placeholder="请输入内容" style="width: 260px"></el-input>
    <br>

    <el-button type="primary" plain>导出</el-button>
    <el-button type="primary" plain>查询</el-button>
    <el-button type="primary" plain>重置</el-button>

    <template>
        <el-table
                :data="tableData"
                border
                style="width: 80%">
            <el-table-column
                    prop="name"
                    label="姓名"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="job_number"
                    label="工号"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="aCount"
                    label="参加次数">
            </el-table-column>
            <el-table-column
                    prop="bCount"
                    label="通过次数">
            </el-table-column>
            <el-table-column
                    label="通过率">
                <template slot-scope="scope">{{ scope.row.tongg }}%</template>
            </el-table-column>
            <el-table-column  label="操作">
                <template slot-scope="scope" >
                <el-button @click="selectPaper(scope.row)">
                    查看详情
                </el-button>
                </template>
            </el-table-column>
        </el-table>
    </template>

</div>

</body>

<script>
    new Vue({
        el: '#ListingLink',
        /*变量*/
        data() {
            return {
                name:"",
                number:"",
                tableData: [],
                dialogVisible:false,
                ta:[],
                examList:[],
            }
        },
        mounted: function () {
            var _this =this;
            axios
                .post('/kaoshi/analyseExam')
                .then(function (res) {
                    _this.tableData = res.data;
                })
        },
        methods :{
            selectPaper:function (row) {
                var  _this = this;
                this.dialogVisible = true;
                this.ta[0] = row;
                axios
                    .post('/kaoshi/selectPaper',{id:row.id})
                    .then(function (res) {
                        _this.examList = res.data;
                    })
            }
        },

        // 爱情里的山盟海誓不过是虚无缥缈的东西
    })
</script>

</html>
