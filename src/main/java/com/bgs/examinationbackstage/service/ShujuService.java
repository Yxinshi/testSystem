package com.bgs.examinationbackstage.service;

import com.bgs.examinationbackstage.config.ResultEntity;
import com.bgs.examinationbackstage.pojo.ExaminationPaper;
import com.bgs.examinationbackstage.pojo.User;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface ShujuService {

    ResultEntity findAll(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit, @RequestParam("testPaperName") String testPaperName, @RequestParam("testPaperStartTime") String testPaperStartTime, @RequestParam("testPaperEndTime") String testPaperEndTime);

    ExaminationPaper findAllParameter(@RequestParam("testPaperId") Integer testPaperId, @RequestParam("uId") Integer uId);
    //应参加人数
    int canjia();
    //正确的题
    int selectTestOk(Integer testPaperId);

    int zongti(Integer testPaperId);
    //最高分
    int zuigao(Integer testPaperId);

    int zuidi(Integer testPaperId);

    List<User> quekao(Integer testPaperId);

    ResultEntity detail(Integer testPaperId, Integer page, Integer limit);
}
