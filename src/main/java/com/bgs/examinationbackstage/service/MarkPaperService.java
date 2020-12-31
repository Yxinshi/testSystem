package com.bgs.examinationbackstage.service;

import com.bgs.examinationbackstage.pojo.ExaminationPaper;

import java.util.List;

public interface MarkPaperService {
    List<ExaminationPaper> markPaperListShow(ExaminationPaper paper);

    List<ExaminationPaper> showPaperDetails(Integer id);
}
