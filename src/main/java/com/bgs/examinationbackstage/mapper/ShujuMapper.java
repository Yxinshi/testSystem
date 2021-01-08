package com.bgs.examinationbackstage.mapper;

import com.bgs.examinationbackstage.pojo.ExaminationPaper;
import com.bgs.examinationbackstage.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
public interface ShujuMapper {
    List<ExaminationPaper> findAll(@Param("pageNum") Integer pageNum, @Param("limit") Integer limit, @Param("testPaperName") String testPaperName, @Param("testPaperStartTime") String testPaperStartTime,
                                   @Param("testPaperEndTime") String testPaperEndTime);

    int selectCount(Integer testPaperId);

    int selectCount1(Integer testPaperId);

    int selectCount2(Integer testPaperId);


    void insert(String valueOf, String valueOf1, String lv, String valueOf2, String valueOf3);

    int selectshujuCount(@Param("testPaperName") String testPaperName, @Param("testPaperStartTime") String testPaperStartTime, @Param("testPaperEndTime") String testPaperEndTime);

    List<ExaminationPaper> findAll1();

    ExaminationPaper findAllParameter(@Param("testPaperId") Integer testPaperId, @Param("uId") Integer uId);
    //应参加人数
    int selectCanjiaCount();

    int selectTestOk(@Param("testPaperId") Integer testPaperId);

    int zongti(@Param("testPaperId") Integer testPaperId);

    int zuigao(Integer testPaperId);

    int zuidi(Integer testPaperId);

    List<User> quekao(Integer testPaperId);

    List<ExaminationPaper> detail(@Param("pageNum") int pageNum, @Param("limit") Integer limit, @Param("testPaperId") Integer testPaperId);


    int selectCounts(@Param("testPaperId") Integer testPaperId, @Param("pageNum") int pageNum, @Param("limit") Integer limit);
}
