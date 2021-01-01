package com.bgs.examinationbackstage.mapper;

import com.bgs.examinationbackstage.pojo.ExaminationPaper;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import javax.annotation.security.PermitAll;
import java.util.List;

@Mapper
public interface BiMapper {

    //查询所有试题
    List<QuestionBank> selectBankBi(@Param("id") Integer id, @Param("datetimestrat") String datetimestrat, @Param("datetimeend") String datetimeend,
                                    @Param("xialakuang1")String xialakuang1, @Param("xialakuang2") String xialakuang2);

    List<QuestionBank> selectQuestionBankType();

    List<QuestionBank> selectQuestionBankClassify();

    int Addquestion_bank(@Param("id") Integer id, @Param("questionBank") QuestionBank questionBank);

    int TopicUpTwo(String questionBankId);

    int Deletequestion(String questionBankId);

    QuestionBank lookOnequestion(String questionBankId);

    int UpOnequestionOK(@Param("questionBankId") String questionBankId, @Param("questionBank") QuestionBank questionBank);
}
