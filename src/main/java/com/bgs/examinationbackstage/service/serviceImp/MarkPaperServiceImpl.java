package com.bgs.examinationbackstage.service.serviceImp;

import com.bgs.examinationbackstage.mapper.MarkPaperMapper;
import com.bgs.examinationbackstage.pojo.*;
import com.bgs.examinationbackstage.service.MarkPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MarkPaperServiceImpl implements MarkPaperService {
    @Autowired
    private MarkPaperMapper markPaperMapper;

    @Override
    public List<ExaminationPaper> markPaperListShow(ExaminationPaper paper) {
        return markPaperMapper.markPaperListShow(paper);
    }

    @Override
    public List<ExaminationPaper> showPaperDetails(Integer id) {
        return markPaperMapper.showPaperDetails(id);
    }

    @Override
    public List<User> showTestUser(Integer id) {
        return markPaperMapper.showTestUser(id);
    }

    @Override
    public  List<TestPaperUser> selectEstimateStatus(Integer id) {
        return markPaperMapper.selectEstimateStatus(id);
    }

    @Override
    public List<QuestionBank> showTestPaperById(Integer id) {
        return markPaperMapper.showTestPaperById(id);
    }

    @Override
    public List<ExaminationAnswer> addScore(ExaminationAnswer examinationAnswer) {
        return markPaperMapper.addScore(examinationAnswer);
    }
}
