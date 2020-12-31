package com.bgs.examinationbackstage.service;

import com.bgs.examinationbackstage.pojo.Page;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import com.github.pagehelper.PageInfo;


public interface BiService {

    PageInfo<QuestionBank> selectBankBi(Page page);

}
