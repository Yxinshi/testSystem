package com.bgs.examinationbackstage.service;

import com.bgs.examinationbackstage.pojo.ExaminationPaper;
import com.bgs.examinationbackstage.pojo.Page;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import com.github.pagehelper.PageInfo;

import java.util.*;


public interface BiService {

    PageInfo<QuestionBank> selectBankBi(Page page, Integer id, String datetimestrat, String datetimeend, String xialakuang1, String xialakuang2);

    List<QuestionBank> selectQuestionBankType();

    List<QuestionBank> selectQuestionBankClassify();
}
