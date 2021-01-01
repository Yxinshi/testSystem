package com.bgs.examinationbackstage.service;


import com.bgs.examinationbackstage.pojo.Page;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import com.github.pagehelper.PageInfo;

import java.util.*;

public interface BiService {

    PageInfo<QuestionBank> selectBankBi(Page page, Integer id, String datetimestrat, String datetimeend, String xialakuang1, String xialakuang2);

    List<QuestionBank> selectQuestionBankType();

    List<QuestionBank> selectQuestionBankClassify();

    int Addquestion_bank(Integer id, QuestionBank questionBank);

    int TopicUpTwo(String questionBankId);

    int Deletequestion(String questionBankId);

    QuestionBank lookOnequestion(String questionBankId);

    int UpOnequestionOK(String questionBankId, QuestionBank questionBank);
}

