package com.bgs.examinationbackstage.controller;

import com.bgs.examinationbackstage.pojo.ExaminationPaper;
import com.bgs.examinationbackstage.service.MarkPaperService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
}
