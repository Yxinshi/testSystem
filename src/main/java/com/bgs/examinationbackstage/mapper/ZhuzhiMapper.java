package com.bgs.examinationbackstage.mapper;

import com.bgs.examinationbackstage.pojo.User;

import java.util.List;
import java.util.Map;

public interface ZhuzhiMapper {
    List<Map<String,Object>> Kaoshi(Map<String,Object> map);

    boolean deletePaper(Object id);

    boolean deleteQues(Object id);

    boolean deleteUser(Object id);

    boolean deleteAnswer(Object id);

    List<User> addUser();
}
