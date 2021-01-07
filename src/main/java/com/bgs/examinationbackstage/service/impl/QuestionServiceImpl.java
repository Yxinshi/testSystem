package com.bgs.examinationbackstage.service.impl;

import com.bgs.examinationbackstage.config.ResultEntity;
import com.bgs.examinationbackstage.mapper.QuestionMapper;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import com.bgs.examinationbackstage.service.QuestionService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionMapper questionMapper;
    @Override
    public ResultEntity selectQuestionAll(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit,@RequestParam("name")String name,@RequestParam("sharedState") String sharedState) {
         int count=questionMapper.selectCount(name,sharedState);
        System.out.println(count);
       int pageNum= (page-1)*5;
        System.out.println(pageNum);
        System.out.println(count);
        List<QuestionBank> questionBanks = questionMapper.selectQuestionAll(pageNum,limit,name,sharedState);
        ResultEntity resultEntity=new ResultEntity();
     if(questionBanks!=null){
         resultEntity.setCode(0);
         resultEntity.setMessage("");
         resultEntity.setCount(count);
         resultEntity.setData(questionBanks);
     }
        return resultEntity;
    }

    @Override
    public QuestionBank selectQuestionAllParamId(Integer id) {
        QuestionBank questionBank=questionMapper.selectQuestionAllParamId(id);
        return questionBank;
    }

    @Override
    public int updateStatus(@RequestParam("questionBankId")Integer questionBankId,@RequestParam("status") String status) {
    int statu=questionMapper.updateStatus(questionBankId,status);
    return statu;
    }
}
