package com.bgs.examinationbackstage.mapper;

import com.bgs.examinationbackstage.pojo.ExaminationPaper;

import java.util.List;

public interface MarkPaperMapper {
    List<ExaminationPaper> markPaperListShow(ExaminationPaper paper);

    List<ExaminationPaper> showPaperDetails(Integer id);
}
