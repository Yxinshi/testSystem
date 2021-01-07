package com.bgs.examinationbackstage.service;

import com.bgs.examinationbackstage.pojo.User;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ZhuzhiService {

    List<Map<String,Object>> Kaoshi(Map<String,Object> map);

    boolean deletePaper(Object id);

    List<User> addUser();

    List<Map<String,Object>> examinationexamination(Map<String, Object> map, HttpSession session);

    List<Map<String,Object>> ChooseQuestions();

    List<Map<String,Object>> FixedSubmitted(Map<String,Object> map, HttpSession session);

    Map<String,Object> essentialInformation(Object id);

    List<Map<String,Object>> essentialUser(Map<String,Object> map);

    HashMap<String, List<Map<String, Object>>> essentialExam(Map<String,Object> map);

    List<Map<String,Object>> analyseExam();

    List<Map<String,Object>> selectPaper(Object id);
}
