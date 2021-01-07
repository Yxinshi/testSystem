package com.bgs.examinationbackstage.mapper;

import com.bgs.examinationbackstage.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ZhuzhiMapper {
    List<Map<String,Object>> Kaoshi(Map<String,Object> map);

    boolean deletePaper(Object id);

    boolean deleteQues(Object id);

    boolean deleteUser(Object id);

    boolean deleteAnswer(Object id);

    List<User> addUser();

    boolean examinationexamination(Map<String, Object> tissue);

    boolean userAddKao(Map<String,Object> map);

    List<Integer> singleCount(Integer singleCount);

    List<Integer> multipleCount(Integer multipleCount);

    List<Integer> gapFillingCount(Integer gapFillingCount);

    List<Integer> judgeCount(Integer judgeCount);

    List<Integer> shortAnswerCount(Integer shortAnswerCount);

    void singleCountAdd(@Param("inLis") List<Integer> inLis, @Param("tid") Object tid, @Param("singleGrade") Object singleGrade);

    void multipleCountAdd(@Param("inLis") List<Integer> inLis, @Param("tid") Object tid, @Param("multipleCount") Object multipleCount);

    void gapFillingCountAdd(@Param("inLis") List<Integer> inLis, @Param("tid") Object tid, @Param("gapFillingCount") Object gapFillingCount);

    void judgeCountCountAdd(@Param("inLis") List<Integer> inLis, @Param("tid") Object tid, @Param("judgeCount") Object judgeCount);

    void shortAnswerCountCountAdd(@Param("inLis") List<Integer> inLis, @Param("tid") Object tid, @Param("shortAnswerCount") Object shortAnswerCount);

    List<Map<String,Object>> ChooseQuestions();

    boolean questionsAddS(@Param("inLis")List<Map<String,Object>> list,@Param("tid") Object tid);

    Map<String,Object> essentialInformation(Object id);

    List<Map<String,Object>> essentialUser(Object id);

    List<Map<String,Object>> essentialExam(Object id);

    List<Map<String,Object>> analyseExam();

    List<Map<String,Object>> selectPaper(Object id);
}