package com.bgs.examinationbackstage.mapper;

import com.bgs.examinationbackstage.pojo.ExaminationPaper;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BiMapper {

    //查询所有试题
    List<QuestionBank> selectBankBi(@Param("id") Integer id, @Param("datetimestrat") String datetimestrat, @Param("datetimeend") String datetimeend,
                                    @Param("xialakuang1")String xialakuang1, @Param("xialakuang2") String xialakuang2);

    List<QuestionBank> selectQuestionBankType();

    List<QuestionBank> selectQuestionBankClassify();
}
