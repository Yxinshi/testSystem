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

}
