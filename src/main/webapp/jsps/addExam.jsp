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
    <div>
        <el-row>
            <el-col :span="6"><span>&nbsp;</span></el-col>
            <el-col :span="12">
                <el-steps :active="issue" simple >
                    <el-step title="设计考试基本信息" icon="el-icon-edit"></el-step>
                    <el-step title="设计考卷" icon="el-icon-upload"></el-step>
                    <el-step title="完成发布" icon="el-icon-picture"></el-step>
                </el-steps>

                <%--设计考试基本信息--%>
                <div  :style="jiben1">
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration">考&nbsp;&nbsp;试&nbsp;&nbsp;日&nbsp;&nbsp;期</span>&nbsp;
                                    <el-date-picker v-model="tissue.dateExam" type="date" placeholder="选择日期时间">
                                    </el-date-picker>
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>
                        &nbsp;
                    </el-row>
                    <el-row>
                        <el-col :span="24">
                            <span>考&nbsp;&nbsp;试&nbsp;&nbsp;时&nbsp;&nbsp;间</span>&nbsp;
                            <el-time-select v-model="tissue.startExam" :picker-options="{
                   start: '08:30',
                    step: '00:15',
                    end: '19:30'
                  }" placeholder="选择时间"></el-time-select>
                            ---
                            <el-time-select v-model="tissue.finishExam" :picker-options="{
                    start: '08:30',
                    step: '00:15',
                    end: '19:30'
                  }" placeholder="选择时间"></el-time-select>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <span>进入考试次数</span>
                            <el-input style="width: 260px" v-model="tissue.time" placeholder="请输入内容"></el-input>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <span>参&nbsp;&nbsp;考&nbsp;&nbsp;人&nbsp;&nbsp;员</span>&nbsp;
                            <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="resetPaper()">关联人员</el-button>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="3">
                            <span>人&nbsp;&nbsp;员&nbsp;&nbsp;信&nbsp;&nbsp;息</span>
                        </el-col>
                        <el-col :span="21">
                            <template>
                                <el-table
                                        ref="multipleTable"
                                        :data="multipleSelection"
                                        tooltip-effect="dark"
                                        style="width: 100%"
                                        height="250"
                                        @selection-change="handleSelectionChange">
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
                                                    @click="handleDelete(scope.row)">删除</el-button>
                                        </template>
                                    </el-table-column>
                                </el-table>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="6">
                            <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="wancheng()">返回</el-button>
                        </el-col>
                        <el-col :span="6">
                            <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="nextStep()">下一步</el-button>
                        </el-col>
                    </el-row>
                </div>

                <%--固定试卷--%>
                <div  :style="jiben2">
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration">试卷名称</span>&nbsp;

                                    <el-input style="width: 260px" v-model="tissue.name" placeholder="请输入内容"></el-input>
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration">出题方式 :</span>&nbsp;
                                    <span style="font-size: 18px">固定试卷</span>
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <span class="demonstration">试题分类</span>&nbsp;
                                <el-select v-model="tissue.classify" placeholder="请选择">
                                    <el-option
                                            v-for="item in designOptions"
                                            :key="item.value"
                                            :label="item.label"
                                            :value="item.value">
                                    </el-option>
                                </el-select>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="ChooseQuestions()">选择试题</el-button>
                        </el-col>
                    </el-row>

                    <el-row>
                        <el-col :span="3">

                        </el-col>
                        <el-col :span="21">
                            <el-col :span="21">
                                <template>
                                    <el-table
                                            ref="multipleT"
                                            :data="settledTable"
                                            tooltip-effect="dark"
                                            style="width: 100%"
                                            height="250">
                                        <el-table-column
                                                label="序号"
                                                width="120">
                                            <template slot-scope="scope">{{ scope.row.date }}</template>
                                        </el-table-column>
                                        <el-table-column
                                                prop="question_bank_type"
                                                label="试题类型"
                                                width="120">
                                        </el-table-column>
                                        <el-table-column
                                                prop="question_bank_content"
                                                label="试题内容"
                                                show-overflow-tooltip>
                                        </el-table-column>
                                        <el-table-column
                                                prop="question_bank_classify"
                                                label="试题分类"
                                                show-overflow-tooltip>
                                        </el-table-column>
                                        <el-table-column  label="分数">
                                            <template slot-scope="scope" >
                                                <el-input v-model="scope.row.fenshu" @blur="blurS" placeholder="请输入内容"></el-input>
                                            </template>
                                        </el-table-column>
                                        <el-table-column  label="操作">
                                            <template slot-scope="scope" >
                                                <el-button
                                                        size="mini"
                                                        type="danger"
                                                        @click="xvanzeDelete(scope.row)">删除</el-button>
                                            </template>
                                        </el-table-column>
                                    </el-table>
                                </template>
                            </el-col>
                        </el-col>
                    </el-row>

                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration" style="font-size: 16px">及格分数</span>
                                    <el-input v-model="tissue.pass" style="width: 260px"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    >
                                        <template slot="append">满分{{tissue.fullMark}}</template>
                                    </el-input>
                                </div>
                            </template>

                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="6">
                            <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="returnPaper()">返回</el-button>
                        </el-col>
                        <el-col :span="6">
                            <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="fulfillStep1()">完成提交</el-button>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                </div>
                <%--抽提试卷--%>
                <div  :style="jiben3">
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration">试卷名称</span>&nbsp;
                                    <el-input style="width: 260px"  maxlength="20" v-model="tissue.name" placeholder="请输入内容"></el-input>
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <span class="demonstration">试题分类</span>&nbsp;
                                <el-select v-model="tissue.classify" placeholder="请选择">
                                    <el-option
                                            v-for="item in designOptions"
                                            :key="item.value"
                                            :label="item.label"
                                            :value="item.value">
                                    </el-option>
                                </el-select>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <div class="block">
                                        <span class="demonstration">出题方式 :</span>&nbsp;
                                        <span class="text" style="font-size: 16px">抽取试题</span>
                                    </div>
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>

                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration" style="font-size: 16px">单选题</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <el-input @blur="blur" style="width: 160px"  maxlength="2" v-model="tissue.singleCount"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    ></el-input>道
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="demonstration" style="font-size: 16px">每道题</span>
                                    <el-input style="width: 160px"
                                              @blur="blur"  maxlength="2" v-model="tissue.singleGrade"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    ></el-input>分
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration" style="font-size: 16px">多选题</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <el-input @blur="blur" style="width: 160px"  maxlength="2" v-model="tissue.multipleCount"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    ></el-input>道
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="demonstration" style="font-size: 16px">每道题</span>
                                    <el-input style="width: 160px"  @blur="blur"  maxlength="2" v-model="tissue.multipleGrade"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    ></el-input>分
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration" style="font-size: 16px">填空题</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <el-input @blur="blur" style="width: 160px"  maxlength="2" v-model="tissue.gapFillingCount"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    ></el-input>道
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="demonstration" style="font-size: 16px">每道题</span>
                                    <el-input style="width: 160px"  @blur="blur"  maxlength="2" v-model="tissue.gapFillingGrade"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    ></el-input>分
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration" style="font-size: 16px">判断题</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <el-input  @blur="blur" style="width: 160px"  maxlength="2" v-model="tissue.judgeCount"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    ></el-input>道
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="demonstration" style="font-size: 16px">每道题</span>
                                    <el-input style="width: 160px"   @blur="blur"  maxlength="2" v-model="tissue.judgeGrade"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    ></el-input>分
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration" style="font-size: 16px">简答题</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <el-input @blur="blur" style="width: 160px"  maxlength="2" v-model="tissue.shortAnswerCount"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    ></el-input>道
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="demonstration" style="font-size: 16px">每道题</span>
                                    <el-input style="width: 160px"  @blur="blur"  maxlength="2" v-model="tissue.shortAnswerGrade"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    ></el-input>分
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>

                    <el-row>
                        <el-col :span="24">
                            <template>
                                <div class="block">
                                    <span class="demonstration" style="font-size: 16px">及格分数</span>
                                    <el-input v-model="tissue.pass" style="width: 260px"
                                              oninput="value=value.replace(/[^\d]/g,'')"
                                    >
                                        <template slot="append">满分{{tissue.fullMark}}</template>
                                    </el-input>
                                </div>
                            </template>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>

                    <el-row>
                        <el-col :span="6">
                            <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="returnPaper()">返回</el-button>
                        </el-col>
                        <el-col :span="6">
                            <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="fulfillStep()">完成提交</el-button>
                        </el-col>
                    </el-row>
                    <el-row>&nbsp;</el-row>
                </div>

                <%--  完成发布--%>
                <div  :style="jiben4">
                    <div style="text-align: center;">
                        试卷创建成功

                        <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="wancheng()" >完成</el-button>

                    </div>
                </div>
            </el-col>
        </el-row>
    </div>


    <%--参与人员--%>
    <el-dialog
            title="选择参与人员"
            :visible.sync="dialogVisible"
            width="45%"
    >
        <template>
            <el-table
                    ref="multipleTable"
                    :data="tableData"
                    tooltip-effect="dark"
                    style="width: 100%"
                    @selection-change="handleSelectionChange">  <%--多选框的选择获取 当前一行的数据--%>
                <el-table-column
                        type="selection"
                        width="55">
                </el-table-column>
                <el-table-column
                        label="名字"
                        width="120">
                    <template slot-scope="scope">{{ scope.row.name }}</template>
                </el-table-column>
                <el-table-column
                        prop="jobNumber"
                        label="工号"
                        width="120">
                </el-table-column>
                <el-table-column
                        prop="phone"
                        label="手机号"
                        show-overflow-tooltip>
                </el-table-column>
            </el-table>
        </template>

        <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
        </span>
    </el-dialog>

    <%--设计试卷  出题类型--%>
    <el-dialog
            title="设计试卷---出题类型"
            :visible.sync="dialogVisible1"
            width="45%"
            :before-close="handleClose">
        <div  style="text-align: center">
            <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="FixedPapers()">固定试卷</el-button>
            --------
            <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="QuestionPapers()">抽题试卷</el-button>
        </div>
    </el-dialog>

    <el-dialog
            title="固定试题筛选"
            :visible.sync="dialogVisible2"
            width="45%"
            :before-close="handleClose">
        <div  style="text-align: center">
            <template>
                <el-table
                        ref="multipleT"
                        :data="questionsData.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                        tooltip-effect="dark"
                        style="width: 100%"
                        :row-key="getRowKeys"
                        @selection-change="GudingSelectionChange">  <%--多选框的选择获取 当前一行的数据--%>
                    <el-table-column
                            :reserve-selection="true"
                            type="selection"
                            width="55">
                    </el-table-column>
                    <el-table-column
                            prop="question_bank_content"
                            label="试题内容"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="question_bank_classify"
                            label="分类"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="question_bank_score"
                            label="分数"
                            show-overflow-tooltip>
                    </el-table-column>
                    <el-table-column
                            prop="question_bank_type"
                            label="试题类型"
                            show-overflow-tooltip>
                    </el-table-column>
                </el-table>
            </template>

            <el-pagination
                    @size-change="handleSizeChange"
                    @current-change="handleCurrentChange"
                    :current-page="currentPage"
                    :page-sizes="[5, 10, 20, 40]"
                    :page-size="pagesize"
                    layout="total, sizes, prev, pager, next, jumper"
                    :total="questionsData.length">
            </el-pagination>

        </div>
    </el-dialog>

</div>

</body>

<script>
    new Vue({
        el: '#ListingLink',
        /*变量*/
        data() {
            return {
                king:123,
                startExam:'', /*考试开始时间*/
                finishExam:'',/*结束时间*/
                time:'',  /*考试次数*/
                dateExam:'',/*考试日期*/
                issue:1,   /*步骤条*/
                jiben1:'display:block',
                jiben2:'display:none',
                jiben3:'display:none',
                jiben4:'display:none',

                dateExam:'',
                timeExam:'',
                dialogVisible: false,
                tableData: [],

                multipleSelection: [],
                dialogVisible1:false,
                dialogVisible2:false,
                img:'',
                designOptions:[
                    {value:1,label:'java'},
                    {value:2,label:'vue'},
                    {value:3,label:'C++'},
                    {value:4,label:'计算机'},

                ],
                design:'',
                tissue:{
                    singleCount:0,
                    multipleCount:0,
                    gapFillingCount:0,
                    judgeCount:0,
                    shortAnswerCount:0,
                   singleGrade:0,
                   multipleGrade:0,
                   gapFillingGrade:0,
                   judgeGrade:0,
                   shortAnswerGrade:0,
                   fullMark:'',
                },

                settledTable:[],
                questionsData:[],
                currentPage:1, //初始页
                pagesize:5,    //    每页的数据
            }
        },

        //页面加载成功时完成
        mounted: function () {
            var _this = this;

        },
        /*方法函数  事件等*/
        methods: {

            getRowKeys(row) {
                return row.question_bank_id
            },

            // 初始页currentPage、初始每页数据数pagesize和数据data
            handleSizeChange: function (size) {
                this.pagesize = size;
                console.log(this.pagesize)  //每页下拉显示数据
            },
            handleCurrentChange: function (currentPage) {
                this.currentPage = currentPage;
                console.log(this.currentPage)  //点击第几页
            },

        /* 固定试题----选择试题*/
            ChooseQuestions(){
                this.dialogVisible2 = true;
                var _this = this;
                if (_this.questionsData.length == 0){
                    axios
                        .post("/kaoshi/ChooseQuestions/")
                        .then(function (res) {
                            _this.questionsData = res.data;
                        })
                }
            },
            //跳转
            wancheng(){
                location.href="${pageContext.request.contextPath}/jsps/SelectExam.jsp";
            },
            /*抽选试题满分*/
            blur(){
                if (isNaN(parseInt(this.tissue.singleGrade))){
                    this.tissue.singleGrade = 0
                }
                if (isNaN(parseInt(this.tissue.singleCount))){
                    this.tissue.singleCount = 0
                }
                if (isNaN(parseInt(this.tissue.multipleGrade))){
                    this.tissue.multipleGrade = 0
                }
                if (isNaN(parseInt(this.tissue.multipleCount))){
                    this.tissue.multipleCount = 0
                }
                if (isNaN(parseInt(this.tissue.gapFillingGrade))){
                    this.tissue.gapFillingGrade = 0
                }
                if (isNaN(parseInt(this.tissue.gapFillingCount))){
                    this.tissue.gapFillingCount = 0
                }
                if (isNaN(parseInt(this.tissue.judgeGrade))){
                    this.tissue.judgeGrade = 0
                }
                if (isNaN(parseInt(this.tissue.judgeCount))){
                    this.tissue.judgeCount = 0
                }
                if (isNaN(parseInt(this.tissue.shortAnswerGrade))){
                    this.tissue.shortAnswerGrade = 0
                }
                if (isNaN(parseInt(this.tissue.shortAnswerCount))){
                    this.tissue.shortAnswerCount = 0
                }
                var j = (parseInt(this.tissue.singleGrade)*parseInt(this.tissue.singleCount)) +
                    (parseInt(this.tissue.multipleGrade)*parseInt(this.tissue.multipleCount)) +
                    (parseInt(this.tissue.gapFillingGrade)*parseInt(this.tissue.gapFillingCount)) +
                    (parseInt(this.tissue.judgeGrade)*parseInt(this.tissue.judgeCount)) +
                    (parseInt(this.tissue.shortAnswerGrade)*parseInt(this.tissue.shortAnswerCount));
                this.tissue.fullMark = j;
            },
            /*固定试题满分*/
            blurS(){
                var s = this.settledTable;
                var k = 0;
                for (var i = 0; i <s.length ; i++) {
                    if(s[i].fenshu!= null){
                        if (isNaN(parseInt(s[i].fenshu))){
                            s[i].fenshu = 0
                        }
                        k = (parseInt(k))+(parseInt(s[i].fenshu));
                        if (s[i].fenshu == 0){
                            s[i].fenshu = '';
                        }
                    }
                }
                if (isNaN(parseInt(k))){
                    k = ''
                }
                this.tissue.fullMark = k;
            },

        /*返回上一层*/
            returnPaper(){
                this.issue = 1;
                this.jiben1='display:block';
                this.jiben2='display:none';
                this.jiben3='display:none';
                this.jiben4='display:none';
            },
            //抽选试题试卷表
            fulfillStep(){
                this.issue = 3;
                this.jiben1='display:none';
                this.jiben2='display:none';
                this.jiben3='display:none';
                this.jiben4='display:block';
                axios
                    .post("/kaoshi/examination/",{tissue:this.tissue,userEx:this.multipleSelection,})
                    .then(function (res) {

                    })
            },
            /*固定试题试卷*/
            fulfillStep1(){
                this.issue = 3;
                this.jiben1='display:none';
                this.jiben2='display:none';
                this.jiben3='display:none';
                this.jiben4='display:block';
                axios
                    .post("/kaoshi/FixedSubmitted/",{userEx:this.multipleSelection,settledTable:this.settledTable,tissue:this.tissue})
                    .then(function (res) {

                    })
            },

            /*设计考试基本信息 下一步*/
            nextStep(){
                this.dialogVisible1 = true;
            },
            /*固定试卷模板*/
            FixedPapers(){
                this.dialogVisible1 = false;
                this.tissue.singleWay = '固定试题';
                this.issue = 2;
                this.jiben1='display:none';
                this.jiben2='display:block';
                this.jiben3='display:none';
                this.jiben4='display:none';

            },
            /*抽选试题模板*/
            QuestionPapers(){
                this.dialogVisible1 = false;
                this.tissue.singleWay = '抽选试题';
                this.issue = 2;
                this.jiben1='display:none';
                this.jiben2='display:none';
                this.jiben3='display:block';
                this.jiben4='display:none';
            },
            //选择创建样式
            handleClose(done) {
                this.$confirm('确认关闭？')
                    .then(function (res){
                        done();
                    })
                    .catch(function (res){

                    });
            },
            /*点击关联人员弹框*/
            resetPaper(){
                var _this = this;
                this.dialogVisible=true;
                console.log(_this.tableData)
                if (_this.tableData.length==0){
                    axios
                        .post("/kaoshi/addUser/")
                        .then(function (res) {
                            _this.tableData = res.data;
                        })
                }

            },

            GudingSelectionChange(val){
                console.log(val)
                this.settledTable = val;
            },
            //选择人员信息方法
            handleSelectionChange(val) {
                console.log(val)
                this.multipleSelection = val;
            },
            /*删除table 一行 */
            // handleDelete(index, row) {
            //     console.log(index, row);
            //     this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
            //         confirmButtonText: '确定',
            //         cancelButtonText: '取消',
            //         type: 'warning'
            //     }).then(function (res) {
            //         this.$refs.multipleTable && this.$refs.multipleTable.toggleRowSelection(item, false);
            //         this.$message({
            //             type: 'success',
            //             message: '删除成功!',
            //             delete: row.splice(index,1)   //splice 删除对象是数unfuntion组   如果是对象会出现错误  row.solice not is
            //         });
            //     })
            // },
            //根据table  一行的数据 进行控制多选框
            /*删除table 一行 */
            handleDelete(item) {
                console.log(item);
                this.$refs.multipleTable && this.$refs.multipleTable.toggleRowSelection(item, false)
            },

            xvanzeDelete(item) {
                console.log(item);
                this.$refs.multipleT && this.$refs.multipleT.toggleRowSelection(item, false)
                this.blurS();
    }

        }
    })
</script>

</html>
