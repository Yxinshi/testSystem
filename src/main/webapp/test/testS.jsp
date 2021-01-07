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
    <el-row>
        <el-col :span="8"><div class="grid-content bg-purple"> &nbsp;</div></el-col>
        <el-col :span="8">
            视频标题:
            <el-input v-model="headline" style="width: 260px" placeholder="请输入内容"></el-input>

        </el-col>
        <el-col :span="8"><div class="grid-content bg-purple"></div></el-col>
    </el-row>


    <el-row>
        <el-col :span="8"><div class="grid-content bg-purple"> &nbsp;</div></el-col>
        <el-col :span="8">    <template>
            <div class="test2">
                <el-upload style="margin-left:14%;margin-top:5%; text-align: center"
                           class="avatar-uploader el-upload--text"
                           :drag="Plus"
                           action="/kaoshi/api/uploadVidoe3"
                           multiple
                           :show-file-list="false"
                <%--  :data="{SavePath: this.Path.url}"--%>
                           :on-success="handleVideoSuccess"
                           :on-change="handleVideoChange"
                           :before-upload="beforeUploadVideo"
                           :on-progress="uploadVideoProcess"
                           :auto-upload="false"
                           :limit = "lim"
                >
                    <i v-if="Plus" class="el-icon-upload"></i>
                    <div v-if="Plus" class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
                    <el-progress v-if="videoFlag == true" type="circle" :percentage="videoUploadPercent" style="margin-top:30px;"></el-progress>
                    <div class="el-upload__tip" slot="tip">只能上传mp4/flv/avi文件，且不超过300M</div>
                </el-upload>
            </div>
        </template></el-col>
        <el-col :span="8"><div class="grid-content bg-purple"></div></el-col>
    </el-row>
    <el-row>
        &nbsp;
    </el-row>
    <el-row>
        <el-col :span="8"><div class="grid-content bg-purple"> &nbsp;</div></el-col>
        <el-col :span="8">
            <el-upload
                    style="text-align: center"
                class="upload-demo"
                ref="upload"
                action="/kaoshi/api/tupian"
                :on-remove="handleRemove"
                :on-change="handleChange"
                :file-list="fileList"
                :limit = "lim"
                :auto-upload="false">
            <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
            <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button>
            <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
        </el-upload>

        </el-col>
        <el-col :span="8"><div class="grid-content bg-purple"></div></el-col>
    </el-row>

    <el-row>
        &nbsp;
    </el-row>
    <el-row>
        <el-col :span="8"><div class="grid-content bg-purple"> &nbsp;</div></el-col>
        <el-col :span="8">
            <el-switch
                    v-model="videoState"
                    active-color="#13ce66"
                    inactive-color="#ff4949"
                    active-value="1" <%--打开值--%>
                    inactive-value="0"<%--关闭值--%>
            >
            </el-switch>
        </el-col>
        <el-col :span="8"><div class="grid-content bg-purple"></div></el-col>
    </el-row>

</div>

</body>

<script>
    new Vue({
        el: '#ListingLink',
        name: 'test2',

        data() {
            return {
                videoState:'0',
                headline:'',
                ceshi1:{},
                ceshi2:{},
                lim:1,
                fileList: [],
                videoForm: {
                    videoId: '',
                    videoUrl: ''
                },
                videoFlag: false,
                Plus: true,
                Path: {
                    url: 'H:\\ja'
                },
                videoUploadPercent: 0,
            };
        },
        methods: {

            // 视频上传前执行
            beforeUploadVideo (file) {
                const isLt300M = file.size / 1024 / 1024 < 300
                if (['video/mp4', 'video/ogg', 'video/flv', 'video/avi', 'video/wmv', 'video/rmvb'].indexOf(file.type) === -1) {
                    this.$message.error('请上传正确的视频格式')
                    return false
                }
                if (!isLt300M) {
                    this.$message.error('上传视频大小不能超过300MB哦!')
                    return false
                }
            },
            // 视频上传过程中执行
            uploadVideoProcess (event, file, fileList) {
                this.Plus = false
                this.videoFlag = true
                this.videoUploadPercent = file.percentage.toFixed(0)
            },
            // 视频上传成功是执行
            handleVideoSuccess (res, file) {
                this.Plus = false
                this.videoUploadPercent = 100
                console.log(res)
                // 如果为200代表视频保存成功
                if (res.resCode === '200') {
                    // 接收视频传回来的名称和保存地址
                    // 至于怎么使用看你啦~
                    this.videoForm.videoId = res.newVidoeName
                    this.videoForm.videoUrl = res.VideoUrl
                    this.$message.success('视频上传成功！')
                } else {
                    this.$message.error('视频上传失败，请重新上传！')
                }
            },

            submitUpload() {
                var _this = this;
                var chuansong = new FormData()  //手动传送文件必备  注意 必须key一样!!!
                chuansong.append("file",this.ceshi1);
                chuansong.append("file",this.ceshi2);
                chuansong.append("videoState",this.videoState);
                chuansong.append("headline",this.headline);
                axios
                    .post('/kaoshi/api/uploadVidoe3',chuansong)
                    .then(function (res) {

                    })
            },

            handleRemove(file, fileList) {
                console.log(file, fileList);
            },
            handleChange(file){
                this.ceshi2 = file.raw
                console.log(file.raw)
            },

            handleVideoChange(file){
                this.ceshi1 = file.raw
                console.log(file.raw)
            }
        },


        mounted: function () {
        },


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