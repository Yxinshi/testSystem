package com.bgs.examinationbackstage.controller;

import com.alibaba.fastjson.JSONObject;
import com.bgs.examinationbackstage.pojo.*;
import com.bgs.examinationbackstage.service.MarkPaperService;
import com.bgs.examinationbackstage.utils.BaseResponse;
import com.bgs.examinationbackstage.utils.StatusCode;
import com.google.gson.Gson;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Api("考试中心--判卷")
@RequestMapping("mark")
@RestController
public class MarkPaperController {

    @Autowired
    private MarkPaperService markPaperService;


    @GetMapping("/markPaperListShow")
    @ApiOperation("考试信息列表展示")
    public Map<String,Object> markPaperListShow(ExaminationPaper paper){
        List<ExaminationPaper> list = markPaperService.markPaperListShow(paper);
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("count",1);
        map.put("message","查询成功");
        map.put("data",list);
        return map;
    }

    @GetMapping("/showPaperDetails")
    @ApiOperation("展示试卷详情")
    public Map<String,Object> showPaperDetails(Integer id){
        System.out.println(id);
        List<ExaminationPaper> list = markPaperService.showPaperDetails(id);
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("count",1);
        map.put("message","查询成功");
        map.put("data",list);
        return map;
    }

    @GetMapping("/showTestUser")
    @ApiOperation("考试人员列表展示")
    public Map<String,Object> showTestUser(Integer id){
        List<User> list = markPaperService.showTestUser(id);
        Map m = new HashMap<>();
        m.put("code",0);
        m.put("count",1);
        m.put("message","查询成功");
        m.put("data",list);
        return m;
    }

    @RequestMapping("/selectEstimateStatusById")
    @ResponseBody
    @ApiOperation("查找判卷状态")
    public String selectEstimateStatus(Integer id){
        List<TestPaperUser> list = markPaperService.selectEstimateStatus(id);
        Gson gson = new Gson();
        String li = gson.toJson(list);
        System.out.println(li);
        return li;
    }

    @RequestMapping("showTestPaperById")
    @ResponseBody
    @ApiOperation("展示某同学试卷")
    public List<QuestionBank> showTestPaperById(Integer id, HttpSession session){
        //User user = (User) session.getAttribute("user");
        System.out.println(id);
        List<QuestionBank> list = markPaperService.showTestPaperById(id);

        System.out.println(list);
        return list;
    }

    @ResponseBody
    @RequestMapping("/addScore")
    @ApiOperation("添加得分")
    public BaseResponse addScore(ExaminationAnswer examinationAnswer){
        List<ExaminationAnswer> answers = markPaperService.addScore(examinationAnswer);

        return new BaseResponse(StatusCode.Success,answers);


    }

}
