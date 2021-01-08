<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--考试基本信息--%>

<div>
    <div>
        <el-row>
            <el-col :span="24">
                <template>
                    <div class="block">
                        <span class="demonstration">考&nbsp;&nbsp;试&nbsp;&nbsp;日&nbsp;&nbsp;期</span>&nbsp;
                        <el-date-picker v-model="tissue.test_paper_date" type="date" placeholder="选择日期时间">
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
                <el-time-select v-model="tissue.test_paper_start_time" :picker-options="{
                   start: '08:30',
                    step: '00:15',
                    end: '19:30'
                  }" placeholder="选择时间"></el-time-select>
                ---
                <el-time-select v-model="tissue.test_paper_end_time" :picker-options="{
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
                <el-input style="width: 260px" v-model="tissue.test_paper_time" placeholder="请输入内容"></el-input>
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
                            style="width: 50%"
                            height="250"
                            >
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="job_number"
                                label="工号"
                                show-overflow-tooltip>
                        </el-table-column>
                    </el-table>
                </template>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="6">
                <el-button size="medium" type="primary" icon="el-icon-user-solid" @click="wancheng()">返回</el-button>
            </el-col>
        </el-row>
</div>
</div>
