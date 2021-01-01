package com.bgs.examinationbackstage.mapper;

import com.bgs.examinationbackstage.pojo.QuestionBank;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionMapper {
    List<QuestionBank> selectQuestionAll(@Param("pageNum") Integer pageNum, @Param("limit") Integer limit, @Param("name") String name, @Param("sharedState") String sharedState);

    int selectCount(@Param("name") String name, @Param("sharedState") String sharedState);

    QuestionBank selectQuestionAllParamId(Integer id);

    int updateStatus(@Param("questionBankId") Integer questionBankId, @Param("status") String status);

    int selectCount1();
}
