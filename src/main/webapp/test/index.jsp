<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>jQuery在线考试倒计时界面</title>

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
<div id="ListingLink">
    <div class="main">
        <!--nr start-->
        <div class="test_main">
            <div class="nr_left">
                <div class="test">
                    <form action="" method="post">
                        <div class="test_title">
                            <p class="test_time">
                                <i class="icon iconfont">&#xe6fb;</i><b class="alt-1">01:40</b>
                            </p>
                            <font><input type="button" name="test_jiaojuan" value="交卷"></font>
                        </div>

                        <div class="test_content">
                            <div class="test_content_title">
                                <h2>单选题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">60</i><span>题，</span><span>合计</span><i class="content_fs">60</i><span>分</span>
                                </p>
                            </div>
                        </div>
                        <div class="test_content_nr">
                            <ul>

                                <li :id="item.test_questions_id"
                                    v-for="(item,index) in list.danxvan"
                                    :key="index"
                                    v-if="item.question_bank_type=='单选题'"
                                >
                                    <div class="test_content_nr_tt">
                                        <i>{{index}}</i><span>（{{item.test_grade}}分）</span><font>
                                        {{item.question_bank_content}}</font>
                                        <b class="icon iconfont">&#xe881;</b>
                                    </div>
                                    <div class="test_content_nr_main">
                                        <ul>
                                            <li class="option">
                                                <input type="radio" class="radioOrCheck" />
                                                <label>
                                                    A.
                                                    <p class="ue" style="display: inline;">{{item.optionA}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <input type="radio" class="radioOrCheck" />
                                                <label>
                                                    B.
                                                    <p class="ue" style="display: inline;">{{item.optionB}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <input type="radio" class="radioOrCheck" />
                                                <label>
                                                    C.
                                                    <p class="ue" style="display: inline;">{{item.optionC}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <input type="radio" class="radioOrCheck" />
                                                <label>
                                                    D.
                                                    <p class="ue" style="display: inline;">{{item.optionD}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <label>
                                                    <p class="ue" style="display: inline;"> 答案:{{item.question_bank_answer}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <label>
                                                    <p class="ue" style="display: inline;"> 分值:{{item.test_grade}}</p>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="test_content">
                            <div class="test_content_title">
                                <h2>多选题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i class="content_fs">30</i><span>分</span>
                                </p>
                            </div>
                        </div>
                        <div class="test_content_nr">
                            <ul>
                                <li :id="item.test_questions_id"
                                    v-for="(item,index) in list.duoxvan"
                                    :key="index"
                                    v-if="item.question_bank_type=='多选题'">
                                    <div class="test_content_nr_tt">
                                        <i>{{index}}</i><span>({{item.test_grade}}分)</span><font>
                                        {{item.question_bank_content}}</font><b class="icon iconfont">&#xe881;</b>
                                    </div>
                                    <div class="test_content_nr_main">
                                        <ul>
                                            <li class="option">
                                                <input type="checkbox" class="radioOrCheck" name="answer1"
                                                       id="1_answer_1_option_1" />
                                                <label for="1_answer_1_option_1">
                                                    A.
                                                    <p class="ue" style="display: inline;">{{item.optionA}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <input type="checkbox" class="radioOrCheck" name="answer1"
                                                       id="1_answer_1_option_2" />
                                                <label for="1_answer_1_option_2">
                                                    B.
                                                    <p class="ue" style="display: inline;">{{item.optionB}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <input type="checkbox" class="radioOrCheck" name="answer1"
                                                       id="1_answer_1_option_3" />
                                                <label for="1_answer_1_option_3">
                                                    C.
                                                    <p class="ue" style="display: inline;">{{item.optionC}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <input type="checkbox" class="radioOrCheck" name="answer1"
                                                       id="1_answer_1_option_4" />
                                                <label for="1_answer_1_option_4">
                                                    D.
                                                    <p class="ue" style="display: inline;">{{item.optionD}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <label>
                                                    <p class="ue" style="display: inline;"> 答案:{{item.question_bank_answer}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <label>
                                                    <p class="ue" style="display: inline;"> 分值:{{item.test_grade}}</p>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>


                        <div class="test_content">
                            <div class="test_content_title">
                                <h2>判断题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i class="content_fs">30</i><span>分</span>
                                </p>
                            </div>
                        </div>
                        <div class="test_content_nr">
                            <ul>
                                <li :id="item.test_questions_id"
                                    v-for="(item,index) in list.panduan"
                                    :key="index"
                                    v-if="item.question_bank_type=='判断题'">
                                    <div class="test_content_nr_tt">
                                        <i>{{index}}</i><span>({{item.test_grade}}分)</span><font>
                                        {{item.question_bank_content}}</font><b class="icon iconfont">&#xe881;</b>
                                    </div>
                                    <div class="test_content_nr_main">
                                        <ul>
                                            <li class="option">
                                                <input type="checkbox" class="radioOrCheck" />
                                                <label >
                                                    正确
                                                </label>
                                            </li>
                                            <li class="option">
                                                <input type="checkbox" class="radioOrCheck"/>
                                                <label >
                                                    错误
                                                </label>
                                            </li>
                                            <li class="option">
                                                <label>
                                                    <p class="ue" style="display: inline;"> 答案:{{item.question_bank_answer}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <label>
                                                    <p class="ue" style="display: inline;"> 分值:{{item.test_grade}}</p>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>


                        <div class="test_content">
                            <div class="test_content_title">
                                <h2>填空题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i class="content_fs">30</i><span>分</span>
                                </p>
                            </div>
                        </div>
                        <div class="test_content_nr">
                            <ul>
                                <li :id="item.test_questions_id"
                                    v-for="(item,index) in list.tiankong"
                                    :key="index"
                                    v-if="item.question_bank_type=='填空题'">
                                    <div class="test_content_nr_tt">
                                        <i>{{index}}</i><span>({{item.test_grade}}分)</span><font>
                                        {{item.question_bank_content}}</font><b class="icon iconfont">&#xe881;</b>
                                    </div>
                                    <div class="test_content_nr_main">
                                        <ul>
                                            <li class="option">
                                                <label>
                                                    <p class="ue" style="display: inline;"> 答案:{{item.question_bank_answer}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <label>
                                                    <p class="ue" style="display: inline;"> 分值:{{item.test_grade}}</p>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>


                        <div class="test_content">
                            <div class="test_content_title">
                                <h2>简答题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i class="content_fs">30</i><span>分</span>
                                </p>
                            </div>
                        </div>
                        <div class="test_content_nr">
                            <ul>
                                <li :id="item.test_questions_id"
                                    v-for="(item,index) in list.jianda"
                                    :key="index"
                                    v-if="item.question_bank_type=='简答题'">
                                    <div class="test_content_nr_tt">
                                        <i>{{index}}</i><span>({{item.test_grade}}分)</span><font>
                                        {{item.question_bank_content}}</font><b class="icon iconfont">&#xe881;</b>
                                    </div>
                                    <div class="test_content_nr_main">
                                        <ul>
                                            <li class="option">
                                                <label>
                                                    <p class="ue" style="display: inline;"> 答案:{{item.question_bank_answer}}</p>
                                                </label>
                                            </li>
                                            <li class="option">
                                                <label>
                                                    <p class="ue" style="display: inline;"> 分值:{{item.test_grade}}</p>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </form>
                </div>

            </div>
            <div class="nr_right">
                <div class="nr_rt_main">
                    <div class="rt_nr1">
                        <div class="rt_nr1_title">
                            <h1>
                                <i class="icon iconfont">&#xe692;</i>答题卡
                            </h1>
                            <p class="test_time">
                                <i class="icon iconfont">&#xe6fb;</i><b class="alt-1">01:40</b>
                            </p>
                        </div>

                        <div class="rt_content">
                            <div class="rt_content_tt">
                                <h2>单选题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">60</i><span>题</span>
                                </p>
                            </div>
                            <div class="rt_content_nr answerSheet">
                                <ul>
                                    <li
                                        v-for="(item,index) in list.danxvan"
                                        :key="index"
                                    ><a :href="'#'+item.test_questions_id">{{index}}</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="rt_content">
                            <div class="rt_content_tt">
                                <h2>多选题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">30</i><span>题</span>
                                </p>
                            </div>
                            <div class="rt_content_nr answerSheet">
                                <ul>
                                    <li
                                            v-for="(item,index) in list.duoxvan"
                                            :key="index"

                                    ><a :href="'#'+item.test_questions_id">{{index}}</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="rt_content">
                            <div class="rt_content_tt">
                                <h2>判断题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">30</i><span>题</span>
                                </p>
                            </div>
                            <div class="rt_content_nr answerSheet">
                                <ul>
                                    <li
                                            v-for="(item,index) in list.panduan"
                                            :key="index"
                                    ><a :href="'#'+item.test_questions_id">{{index}}</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="rt_content">
                            <div class="rt_content_tt">
                                <h2>填空题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">30</i><span>题</span>
                                </p>
                            </div>
                            <div class="rt_content_nr answerSheet">
                                <ul>
                                    <li
                                            v-for="(item,index) in list.tiankong"
                                            :key="index"
                                    ><a :href="'#'+item.test_questions_id">{{index}}</a></li>
                                </ul>
                            </div>
                        </div>


                        <div class="rt_content">
                            <div class="rt_content_tt">
                                <h2>简答题</h2>
                                <p>
                                    <span>共</span><i class="content_lit">30</i><span>题</span>
                                </p>
                            </div>
                            <div class="rt_content_nr answerSheet">
                                <ul>
                                    <li
                                            v-for="(item,index) in list.jianda"
                                            :key="index"
                                    ><a :href="'#'+item.test_questions_id">{{index}}</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!--nr end-->


        <div class="foot"></div>


    </div>

</div>

    <script>
        window.jQuery(function ($) {
            "use strict";

            $('time').countDown({
                with_separators: false
            });
            $('.alt-1').countDown({
                css_class: 'countdown-alt-1'
            });
            $('.alt-2').countDown({
                css_class: 'countdown-alt-2'
            });

        });


        $(function () {
            $('li.option label').click(function () {
                debugger;
                var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); /*得到题目ID*/
                var cardLi = $('a[href=#' + examId + ']'); /*根据题目ID找到对应答题卡*/
                /*设置已答题*/
                if (!cardLi.hasClass('hasBeenAnswer')) {
                    cardLi.addClass('hasBeenAnswer');
                }

            });
        });
    </script>


</body>



<script>
    new Vue({
        el: '#ListingLink',
        /*变量*/
        data() {
            return {
                list:{},
                radio: ''
            }
        },

        //页面加载成功时完成
        mounted: function () {
            var _this =this;
            axios
                .post('/kaoshi/essentialExam',{id:24})
                .then(function (res) {
                    _this.list = res.data;
                })
        },
        /*方法函数  事件等*/

        methods :{

        },

    })
</script>

</html>
