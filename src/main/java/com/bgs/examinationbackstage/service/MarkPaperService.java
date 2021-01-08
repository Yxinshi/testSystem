package com.bgs.examinationbackstage.service;

import com.bgs.examinationbackstage.pojo.*;

import java.util.List;

public interface MarkPaperService {
    List<ExaminationPaper> markPaperListShow(ExaminationPaper paper);

    List<ExaminationPaper> showPaperDetails(Integer id);

    List<User> showTestUser(Integer id);

    List<TestPaperUser> selectEstimateStatus(Integer id);

    List<QuestionBank> showTestPaperById(Integer id);

   List<ExaminationAnswer> addScore(ExaminationAnswer examinationAnswer);
}
