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
    <el-form :model="ruleForm" ref="ruleForm" label-width="120px" class="demo-ruleForm">
        <el-form-item label="名称">
            <el-input v-model="ruleForm.location"></el-input>
        </el-form-item>
        <el-form-item label="添加视频" class="video-upload">
            <el-upload
                    class="avatar-uploader"
                    action="/kaoshi/api/uploadVidoe3"
                    accept='.mp4,.qlv,.qsv,.ogg,.flv,.avi,.wmv,.rmvb'
                    :auto-upload= "false"
                    :show-file-list="false"
                    id = 'video'
                    :on-change="handleChangeVideo">
                <video
                        v-if="Video !=''"
                        :src="Video"
                        width="350"
                        height="180"
                        controls="controls"
                >您的浏览器不支持视频播放
                </video>
                <i
                        v-else-if="Video ==''"
                        class="el-icon-plus avatar-uploader-icon"
                ></i>            <!--没选择视频之前显示-->
            </el-upload>
        </el-form-item>
        <el-form-item>
            <el-button type="danger">取消</el-button>
            <el-button type="primary" @click="checkSubmit('ruleForm')">确认</el-button>
        </el-form-item>
    </el-form>

</div>

</body>

<script>
    new Vue({
        el: '#ListingLink',
        data() {
            return {
                ruleForm: {
                    location: ''
                },
                Video: ''
            }
        },
        methods:{
            handleChangeVideo(file) {
                this.Video = URL.createObjectURL(file.raw)
                console.log(file)
                this.ruleForm.file = file.raw
            },
            checkSubmit() {
                const formData = new FormData()
                Object.keys(this.ruleForm).forEach((ele) => {
                    formData.append(ele, this.ruleForm[ele])
                })
                this.$api.post('v1/video', formData, response => {
                    if (response.status >= 200 && response.status < 300) {
                        this.$message({
                            type: 'success',
                            message: '添加成功！'
                        })
                    } else {
                        console.log(response.message);
                    }
                });
            }
        }
    })
</script>



</html>

<style>
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .avatar-uploader .el-upload:hover {
        border-color: #409eff;
    }
    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 178px;
        height: 178px;
        line-height: 178px;
        text-align: center;
    }
    .avatar {
        width: 178px;
        height: 178px;
        display: block;
    }
    .video-avatar {
        width: 400px;
        height: 200px;
    }


</style>