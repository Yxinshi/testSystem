
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

    <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="resetPaper()">关联人员</el-button>
    <template>
        <el-table
                ref="multipleTable"
                :data="multipleSelection"
                tooltip-effect="dark"
                style="width: 100%"
                @selection-change="handleSelectionChange">
            <el-table-column
                    type="selection"
                    width="55">
            </el-table-column>
            <el-table-column
                    label="日期"
                    width="120">
                <template slot-scope="scope">{{ scope.row.date }}</template>
            </el-table-column>
            <el-table-column
                    prop="name"
                    label="姓名"
                    width="120">
            </el-table-column>
            <el-table-column
                    prop="address"
                    label="地址"
                    show-overflow-tooltip>
            </el-table-column>
            <el-table-column  label="操作">
                <template slot-scope="scope" >
                    <el-button
                            size="mini"
                            type="danger"
                            @click="handleDelete(scope.$index, multipleSelection)">删除</el-button>
                </template>
            </el-table-column>


        </el-table>
    </template>



    <el-dialog
            title="提示"
            :visible.sync="dialogVisible"
            width="45%"
            :before-close="handleClose">

        <template>
            <el-table
                    ref="multipleTable"
                    :data="tableData"
                    tooltip-effect="dark"
                    style="width: 100%;"
                    <%--height="250"--%>
                    @selection-change="handleSelectionChange">  <%--多选框的选择获取 当前一行的数据--%>
                <el-table-column
                        type="selection"
                        width="55">
                </el-table-column>
                <el-table-column
                        label="日期"
                        width="120">
                    <template slot-scope="scope">{{ scope.row.date }}</template>
                </el-table-column>
                <el-table-column
                        prop="name"
                        label="姓名"
                        width="120">
                </el-table-column>
                <el-table-column
                        prop="address"
                        label="地址"
                        show-overflow-tooltip>
                </el-table-column>
            </el-table>
        </template>


        <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
        </span>
    </el-dialog>


</div>

</body>

<script>
    new Vue({
        el: '#ListingLink',
        /*变量*/
        data() {
            return {
                tableData: [{
                    date: '2016-05-03',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-02',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-04',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-01',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-08',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-06',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-07',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }],
                dialogVisible:false,
                multipleSelection: []
            }
        },

        methods: {
            resetPaper() {
                this.dialogVisible = true;
            },
            handleSelectionChange(val) {
                console.log(val)
                this.multipleSelection = val;
            },
            handleDelete(index, row) {
                console.log(index, row);
                this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(function (res) {
                    this.$message({
                        type: 'success',
                        message: '删除成功!',
                        delete: row.splice(index, 1)   //splice 删除对象是数unfuntion组   如果是对象会出现错误  row.solice not is
                    });
                })
            }
        }
    })
</script>

</html>
