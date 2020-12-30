/**
 *
 * bixiufeng
 * 2020-12-29 01:43
 *
 */
package com.bgs.examinationbackstage.controller;

import com.bgs.examinationbackstage.pojo.Page;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import com.bgs.examinationbackstage.service.BiService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("BiCon")
public class BiController {

    @Autowired
    private BiService biService;

    //查询所有试题
    @RequestMapping("/selectBankBi")
    public PageInfo<QuestionBank> selectBankBi(Page page){

        PageInfo<QuestionBank> questionBankPageInfo = biService.selectBankBi(page);


        return questionBankPageInfo;
    }

}
