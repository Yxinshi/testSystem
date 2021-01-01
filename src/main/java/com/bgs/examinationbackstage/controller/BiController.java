/**
 *
 * bixiufeng
 * 2020-12-29 01:43
 *
 */
package com.bgs.examinationbackstage.controller;

import com.bgs.examinationbackstage.pojo.ExaminationPaper;
import com.bgs.examinationbackstage.pojo.Page;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.service.BiService;
import com.bgs.examinationbackstage.utils.BaseResponse;
import com.bgs.examinationbackstage.utils.StatusCode;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
@RequestMapping("BiCon")
public class BiController {

    @Autowired
    private BiService biService;

    //查询所有试题
    @RequestMapping("/selectBankBi")
    public PageInfo<QuestionBank> selectBankBi(Page page, String datetimestrat , String datetimeend, String xialakuang1, String xialakuang2, HttpSession session){

        User user = (User)session.getAttribute("user");
        Integer id = user.getId();


        System.out.println("起始时间:"+datetimestrat+"结束时间："+datetimeend+"试题类型"+xialakuang1+"试题分类"+xialakuang2);

        PageInfo<QuestionBank> questionBankPageInfo = biService.selectBankBi(page,id,datetimestrat,datetimeend,xialakuang1,xialakuang2);


        return questionBankPageInfo;
    }


    //查询试题类型

    @RequestMapping("/selectQuestionBankType")
    public BaseResponse selectQuestionBankType(){

        List<QuestionBank> questionBanks = biService.selectQuestionBankType();

        return new BaseResponse(StatusCode.Success,questionBanks);
    }

    @RequestMapping("/selectQuestionBankClassify")
    public BaseResponse selectQuestionBankClassify(){

        List<QuestionBank> selectQuestionBankClassify = biService.selectQuestionBankClassify();

        return new BaseResponse(StatusCode.Success,selectQuestionBankClassify);
    }


    //新添加试题
    @RequestMapping("Addquestion_bank")
    @ResponseBody
    public  BaseResponse  Addquestion_bank(HttpSession session,QuestionBank questionBank){
        Integer id=null;
       User u = (User) session.getAttribute("user");
       if(u!=null){
           id= u.getId();
           System.out.println(id);
       }

        System.out.println(questionBank.toString());

        int i = biService.Addquestion_bank(id,questionBank);

        return new BaseResponse(StatusCode.Success,i);
    }

    //申请吧试题 设置为共享题
    @RequestMapping("TopicUpTwo")
    @ResponseBody
    public  BaseResponse TopicUpTwo(String questionBankId){

        System.out.println(questionBankId+"修改成功！");

        int i = biService.TopicUpTwo(questionBankId);
        if(i>0){
            return new BaseResponse(StatusCode.Success);
        }

        return new BaseResponse(StatusCode.Fail);
    }


    //删除试题Deletequestion
    @RequestMapping("Deletequestion")
    @ResponseBody
    public  BaseResponse Deletequestion(String questionBankId){

        System.out.println(questionBankId+"删除成功！");

        int i = biService.Deletequestion(questionBankId);
        if(i>0){
            return new BaseResponse(StatusCode.Success);
        }

        return new BaseResponse(StatusCode.Fail);
    }


    //查看单条 试题  具体信息lookOnequestion
    @RequestMapping("lookOnequestion")
    @ResponseBody
    public  BaseResponse lookOnequestion(String questionBankId){

        System.out.println(questionBankId+"查看成功！");

        QuestionBank questionBank = biService.lookOnequestion(questionBankId);
        if(questionBank!=null){
            return new BaseResponse(StatusCode.Success,questionBank);
        }
        return new BaseResponse(StatusCode.Fail);
    }

    //修改试题UpOnequestionOK
    @RequestMapping("UpOnequestionOK")
    @ResponseBody
    public  BaseResponse UpOnequestionOK(String questionBankId,QuestionBank questionBank){

        int i  = biService.UpOnequestionOK(questionBankId,questionBank);
        if(i>0){
            return new BaseResponse(StatusCode.Success);
        }

        return new BaseResponse(StatusCode.Fail);
    }

}
