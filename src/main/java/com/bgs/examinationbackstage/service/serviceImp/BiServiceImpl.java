package com.bgs.examinationbackstage.service.serviceImp;

import com.bgs.examinationbackstage.mapper.BiMapper;
import com.bgs.examinationbackstage.pojo.ExaminationPaper;
import com.bgs.examinationbackstage.pojo.Page;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import com.bgs.examinationbackstage.service.BiService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BiServiceImpl implements BiService {

    @Autowired
    private BiMapper biMapper;

    @Override
    public PageInfo<QuestionBank> selectBankBi(Page page, Integer id, String datetimestrat, String datetimeend, String xialakuang1, String xialakuang2) {
        PageHelper.offsetPage(page.getOffset(),page.getLimit());

        PageInfo<QuestionBank> pageInfo = new PageInfo<>(biMapper.selectBankBi(id,datetimestrat,datetimeend,xialakuang1,xialakuang2));
        return pageInfo;
    }

    @Override
    public List<QuestionBank> selectQuestionBankType() {
        return biMapper.selectQuestionBankType();
    }

    @Override
    public List<QuestionBank> selectQuestionBankClassify() {
        return biMapper.selectQuestionBankClassify();
    }


}
