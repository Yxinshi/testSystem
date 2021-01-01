package com.bgs.examinationbackstage.service.serviceImp;

import com.bgs.examinationbackstage.mapper.ZhuzhiMapper;
import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.service.ZhuzhiService;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service
public class ZhuzhiServiceImp  implements ZhuzhiService {

    @Autowired
    ZhuzhiMapper zhuzhiMapper;


    @Override
    public List<Map<String, Object>> Kaoshi(Map<String,Object> map) {
        return zhuzhiMapper.Kaoshi(map);
    }


    @Transactional
    @Override
    public boolean deletePaper(Object id) {
        boolean b = zhuzhiMapper.deletePaper(id);
        boolean b1 = zhuzhiMapper.deleteQues(id);
        boolean b2 = zhuzhiMapper.deleteUser(id);
        boolean b3 = zhuzhiMapper.deleteAnswer(id);

        if(b==true && b1 == true && b2==true && b3 == true){
            return true;
        }
        return false;
    }



    @Override
    public List<User> addUser() {
        return zhuzhiMapper.addUser();
    }

    /**
     * 试题查询
     * */
    @Override
    public List<Map<String, Object>> ChooseQuestions() {
        return zhuzhiMapper.ChooseQuestions();
    }
    /**
     * 添加试卷操作
     * */
    @Transactional
    @Override
    public List<Map<String, Object>> examinationexamination(Map<String, Object> map, HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        Map<String, Object> tissue = (Map<String, Object>) map.get("tissue");
//        List<User> users = (List<User>) map.get("userEx");
//        String s = String.valueOf(tissue.get("dateExam"));
//        String s1 = s.substring(0, 10);
//        List<Integer> str = (List<Integer>) tissue.get("classify");
//        String jin = "";
//        for (Integer ks: str) {
//            jin = jin + ks;
//        }
//        tissue.put("dateExam", s1);
//        tissue.put("number", users.size());
//        tissue.put("jin", jin);
//        tissue.put("user", user.getId());
//        boolean b = zhuzhiMapper.examinationexamination(tissue);
//        System.out.println("自增"+map);
//        System.out.println();
//        Object o = ((Map<String, Object>) map.get("tissue")).get("test_paper_id");
//        map.put("tid", o);
        Map map1 = examinationeAdd(map, session);
        boolean b1 = userAdd(map1);
        boolean b2 =questionsAdd(map1);

        return null;
    }


    @Transactional
    @Override
    public List<Map<String, Object>> FixedSubmitted(Map<String, Object> map, HttpSession session) {
        Map map1 = examinationeAdd(map, session);
        boolean b1 = userAdd(map1);
        boolean b = questionsAddS(map1);
        return null;
    }


    /**
     * 添加试卷信息
     *
     * */
    @Transactional
    public Map examinationeAdd(Map<String,Object> map,HttpSession session) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> tissue = (Map<String, Object>) map.get("tissue");
        List<User> users = (List<User>) map.get("userEx");
        String s = String.valueOf(tissue.get("dateExam"));
        String s1 = s.substring(0, 10);
        String str = String.valueOf(tissue.get("classify"));

        tissue.put("dateExam", s1);
        tissue.put("number", users.size());
        tissue.put("jin", str);
        tissue.put("user", user.getId());
        boolean b = zhuzhiMapper.examinationexamination(tissue);
        System.out.println("自增"+map);
        System.out.println();
        Object o = ((Map<String, Object>) map.get("tissue")).get("test_paper_id");
        map.put("tid", o);

        return map;
    }

    /**
     * 添加试卷 抽选试题 试题信息
     * */
    @Transactional
    public boolean questionsAdd(Map<String,Object> map) {
        Map<String, Object> tissue = (Map<String, Object>) map.get("tissue");
        tissue.get("singleCount"); /*单选题*/
        tissue.get("multipleCount");/*多选题*/
        tissue.get("gapFillingCount");/*填空题*/
        tissue.get("judgeCount");/*判断题*/
        tissue.get("shortAnswerCount");/*简答题*/
        List<Integer> inLis = zhuzhiMapper.singleCount(Integer.parseInt(String.valueOf(tissue.get("singleCount"))));
        List<Integer> inLis1 = zhuzhiMapper.multipleCount(Integer.parseInt(String.valueOf(tissue.get("multipleCount"))));
        List<Integer> inLis2 = zhuzhiMapper.gapFillingCount(Integer.parseInt(String.valueOf(tissue.get("gapFillingCount"))));
        List<Integer> inLis3 = zhuzhiMapper.judgeCount(Integer.parseInt(String.valueOf(tissue.get("judgeCount"))));
        List<Integer> inLis4 = zhuzhiMapper.shortAnswerCount(Integer.parseInt(String.valueOf(tissue.get("shortAnswerCount"))));

        zhuzhiMapper.singleCountAdd(inLis,map.get("tid"),tissue.get("singleGrade"));
        zhuzhiMapper.multipleCountAdd(inLis1,map.get("tid"),tissue.get("multipleCount"));
        zhuzhiMapper.gapFillingCountAdd(inLis2,map.get("tid"),tissue.get("gapFillingCount"));
        zhuzhiMapper.judgeCountCountAdd(inLis3,map.get("tid"),tissue.get("judgeCount"));
        zhuzhiMapper.shortAnswerCountCountAdd(inLis4,map.get("tid"),tissue.get("shortAnswerCount"));

        return false;
    }

    /**
     * 添加试卷 抽选试题 试题信息
     * */
    @Transactional
    public boolean questionsAddS(Map<String,Object> map) {
        List<Map<String,Object>> list = (List<Map<String, Object>>) map.get("settledTable");
        boolean b = zhuzhiMapper.questionsAddS(list,map.get("tid"));
        return false;
    }
    /***
     *
     * 添加试卷  人员信息
     */
    @Transactional
    public  boolean userAdd(Map<String, Object> map) {
        System.out.println("人员添加"+map);
        List<Map<String,Object>> userEx = (List<Map<String, Object>>) map.get("userEx");
        for (Map<String,Object> use: userEx) {
            use.put("tid", map.get("tid"));
            boolean b = zhuzhiMapper.userAddKao(use);
            if(!b){
                return false;
            }
        }
        return true;
    }
}
