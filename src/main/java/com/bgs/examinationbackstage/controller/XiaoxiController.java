<<<<<<< 3e24a113af69e2f55475d03813cdd7b69c5b75ba
package com.bgs.examinationbackstage.controller;

import com.bgs.examinationbackstage.config.ResultEntity;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import com.bgs.examinationbackstage.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


@RequestMapping("/demo")
@Controller
public class XiaoxiController {
    @Autowired
    private QuestionService questionService;
    @GetMapping("/xiaoxi")
    @ResponseBody
    public ResultEntity xiaoxichakan(@RequestParam(defaultValue = "",value = "name")String name,
                                     @RequestParam(defaultValue = "",value = "sharedState") String sharedState,
                                     @RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
        ResultEntity resultEntity = questionService.selectQuestionAll(page, limit,name,sharedState);
        return resultEntity;
    }
    @RequestMapping("/detailcha")
    public String detailcha(@RequestParam("id") Integer id, ModelMap modelMap){
       QuestionBank questionBank= questionService.selectQuestionAllParamId(id);
       modelMap.addAttribute("questionBank",questionBank);
       return "xiaoxidetail";
    }
    //修改状态
    @RequestMapping("/updatestatus")
    @ResponseBody
    public int updatestatus(@RequestParam("questionBankId") Integer questionBankId,@RequestParam("status") String status){
        int statu=questionService.updateStatus(questionBankId,status);
        return statu;
    }
}
=======
package com.bgs.examinationbackstage.controller;

import com.bgs.examinationbackstage.config.ResultEntity;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import com.bgs.examinationbackstage.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


@RequestMapping("/demo")
@Controller
public class XiaoxiController {
    @Autowired
    private QuestionService questionService;
    @GetMapping("/xiaoxi")
    @ResponseBody
    public ResultEntity xiaoxichakan(@RequestParam(defaultValue = "",value = "name")String name,
                                     @RequestParam(defaultValue = "",value = "sharedState") String sharedState,
                                     @RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
        System.out.println(page+"========="+limit);
        ResultEntity resultEntity = questionService.selectQuestionAll(page, limit,name,sharedState);
        return resultEntity;
    }
    @RequestMapping("/detailcha")
    public String detailcha(@RequestParam("id") Integer id, ModelMap modelMap){
       QuestionBank questionBank= questionService.selectQuestionAllParamId(id);
       modelMap.addAttribute("questionBank",questionBank);
       return "xiaoxidetail";
    }
    //修改状态
    @RequestMapping("/updatestatus")
    @ResponseBody
    public int updatestatus(@RequestParam("questionBankId") Integer questionBankId,@RequestParam("status") String status){
        int statu=questionService.updateStatus(questionBankId,status);
        return statu;
    }
}
>>>>>>> hfhfb
