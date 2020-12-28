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

    <el-row>
        <el-col :span="12">
            <template>
                <div class="block">
                    <span class="demonstration">发布时间</span>
                    <el-date-picker
                            v-model="timing"
                            type="datetimerange"
                            range-separator="至"
                            start-placeholder="开始日期"
                            end-placeholder="结束日期"
                            align="right">
                    </el-date-picker>
                </div>
            </template>
        </el-col>
        <el-col :span="12">
            <span class="demonstration">试卷名称</span>
            <el-input style="width: 260px" v-model="paperName" placeholder="请输入内容"></el-input>
        </el-col>

        <el-col :span="12">
            <span class="demonstration">考试状态</span>
            <template>
                <el-select v-model="paperStatic" placeholder="请选择">
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </template>
        </el-col>
        <el-col :span="12">
            <el-button size="small" type="success" icon="el-icon-search" @click="">搜索</el-button>
            <el-button size="small" type="primary" icon="el-icon-refresh-right">重置</el-button>
        </el-col>
        <el-col :span="12">
            <el-button size="small" type="success" icon="el-icon-search">新增考试</el-button>
        </el-col>
    </el-row>

    <el-table
            highlight-current-row
            border
            :data="userList.slice((currentPage-1)*pagesize,currentPage*pagesize)"
            style="width: 90%;height: 75vh;">
        <el-table-column prop="itemId" type="index"></el-table-column>
        <el-table-column align="left" prop="itemId" label="项目id" show-overflow-tooltip v-if="show"></el-table-column>
        <el-table-column align="left" prop="test_paper_name" label="考卷名称" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="test_paper_date" label="考试日期" show-overflow-tooltip></el-table-column>
        <el-table-column align="left" prop="test_paper_start_time" label="考试时间" show-overflow-tooltip></el-table-column>
        <el-table-column  label="状态">
            <template slot-scope="scope">
                <el-button v-if="scope.row.test_paper_state == 1"
                           type="text"
                           >
                    未开始
                </el-button>
                <el-button v-if="scope.row.test_paper_state == 2"
                           type="text"
                           >
                    进行中
                </el-button>
                <el-button v-if="scope.row.test_paper_state == 3"
                           type="text"
                           >
                    已完成
                </el-button>
            </template>
        </el-table-column>
        <el-table-column  label="操作">
            <template slot-scope="scope" v-if="scope.row.test_paper_state == 1">
                <el-button >
                    查看详情
                </el-button>
                <el-button >
                    删除
                </el-button>
                <el-button >
                    编辑
                </el-button>
            </template>
            <template slot-scope="scope" v-if="scope.row.test_paper_state == 2">
                <el-button >
                    查看详情
                </el-button>
            </template>
            <template slot-scope="scope" v-if="scope.row.test_paper_state == 3">
                <el-button >
                    查看详情
                </el-button>
                <el-button >
                    删除
                </el-button>
            </template>
        </el-table-column>
    </el-table>
    <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :page-sizes="[5, 10, 20, 40]"
            :page-size="pagesize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="userList.length">
    </el-pagination>
</div>

</body>

<script>
    new Vue({
        el: '#ListingLink',
        /*变量*/
        data() {
            return {
                userList: [],
                currentPage:1, //初始页
                pagesize:10,    //    每页的数据
                timing: '',
                options: [{
                    value: '1',
                    label: '未开始'
                }, {
                    value: '2',
                    label: '进行中'
                }, {
                    value: '3',
                    label: '已完成'
                },],

            }
        },

        //页面加载成功时完成
        mounted: function () {
            var _this = this;
            axios
                .post("/kaoshi/jurisdiction/")
                .then(function (res) {
                    _this.userList = res.data;
                })
        },
        /*方法函数  事件等*/
        methods: {
            // 初始页currentPage、初始每页数据数pagesize和数据data
            handleSizeChange: function (size) {
                this.pagesize = size;
                console.log(this.pagesize)  //每页下拉显示数据
            },
            handleCurrentChange: function (currentPage) {
                this.currentPage = currentPage;
                console.log(this.currentPage)  //点击第几页
            },

        }
    })
</script>

</html>
