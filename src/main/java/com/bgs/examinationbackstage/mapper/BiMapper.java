package com.bgs.examinationbackstage.mapper;

import com.bgs.examinationbackstage.pojo.Page;
import com.bgs.examinationbackstage.pojo.QuestionBank;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BiMapper {

    //查询所有试题
    List<QuestionBank> selectBankBi();

}
