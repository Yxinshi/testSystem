package com.bgs.examinationbackstage.service;

import com.alibaba.fastjson.JSONObject;
import com.bgs.examinationbackstage.config.ResultEntity;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface QuestionService {
   ResultEntity selectQuestionAll(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit, @RequestParam("name") String name, @RequestParam("sharedState") String sharedState);

    QuestionBank selectQuestionAllParamId(Integer id);

    int updateStatus(@RequestParam("questionBankId") Integer questionBankId, @RequestParam("status") String status);
}
