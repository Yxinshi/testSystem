package com.bgs.examinationbackstage.service;

import com.bgs.examinationbackstage.pojo.User;

import java.util.List;
import java.util.Map;

public interface ZhuzhiService {

    List<Map<String,Object>> Kaoshi(Map<String,Object> map);

    boolean deletePaper(Object id);

    List<User> addUser();

    List<Map<String,Object>> examinationexamination(Map<String,Object> map);

    List<Map<String,Object>> ChooseQuestions();
}
