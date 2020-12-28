<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>组织考试</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<!-- 引入样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/element/index.css">
<!-- 引入组件库 -->
<script src="${pageContext.request.contextPath }/static/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>

<body>
<div id="ListingLink">

    <el-table
            highlight-current-row
            border
            :data="kaoshi"
            style="width: 90%;height: 75vh;">
        <el-table-column prop="itemId" type="index"></el-table-column>
        <el-table-column align="left" prop="itemId" label="项目id" show-overflow-tooltip v-if="show"></el-table-column>
        <el-table-column align="left" prop="test_paper_name" label="考卷名称" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="test_paper_date" label="考试日期" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="test_paper_start_time" label="考试时间" show-overflow-tooltip></el-table-column>
        <el-table-column  v-if="test_paper_state == 1"  align="left" prop="test_paper_state" label="状态" show-overflow-tooltip>未开始</el-table-column>
        <el-table-column  v-if="test_paper_state == 2"  align="left" prop="test_paper_state" label="状态" show-overflow-tooltip>进行中</el-table-column>
        <el-table-column  v-if="test_paper_state == 3"  align="left" prop="test_paper_state" label="状态" show-overflow-tooltip>已完成</el-table-column>
        <el-table-column label="操作">
            <template slot-scope="scope">
                <el-button @click="deleteThis(scope.row.itemId)" type="text" size="small">查看详情</el-button>
                <el-button @click="deleteThis(scope.row.itemId)" type="text" size="small">删除</el-button>
                <el-button @click="deleteThis(scope.row.itemId)" type="text" size="small">编辑</el-button>
            </template>
        </el-table-column>
    </el-table>
</div>

</body>

<script>
    new Vue({
        el: '#ListingLink',
        /*变量*/
        data() {
            return {
                kaoshi:[],
                currentPage: 1,//默认显示第几页
                total: 10,//总条数
                pageSizes: [10, 20, 30],//个数选择器
                pageSize: 10,//默认每页显示多少条

            }
        },

        //页面加载成功时完成
        mounted: function () {
            var _this = this;
            axios
                .post("/kaoshi/jurisdiction/")
                .then(function (res) {
                    _this.kaoshi = res.data;
                })
        },
        /*方法函数  事件等*/
        methods: {
            handleCurrentChange(){
            },
            handleSizeChange(){
            }
        },
    })
</script>

</html>
