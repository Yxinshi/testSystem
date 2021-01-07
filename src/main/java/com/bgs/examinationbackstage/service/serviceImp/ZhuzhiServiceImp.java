package com.bgs.examinationbackstage.service.serviceImp;

import com.bgs.examinationbackstage.mapper.ZhuzhiMapper;
import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.service.ZhuzhiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
//        boolean b3 = zhuzhiMapper.deleteAnswer(id);
        if(b==true && b1 == true && b2==true ){
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

    @Override
    public Map<String, Object> essentialInformation(Object id) {
        return zhuzhiMapper.essentialInformation(id);
    }

    @Override
    public List<Map<String, Object>> essentialUser(Map<String, Object> map) {
        return  zhuzhiMapper.essentialUser(map.get("id"));
    }

    @Override
    public  HashMap<String, List<Map<String, Object>>> essentialExam(Map<String, Object> map) {
        HashMap<String, List<Map<String, Object>>> stringListHashMap = new HashMap<>();

        List<Map<String, Object>> lists1 = new ArrayList<>();
        List<Map<String, Object>> lists2 = new ArrayList<>();
        List<Map<String, Object>> lists3 = new ArrayList<>();
        List<Map<String, Object>> lists4 = new ArrayList<>();
        List<Map<String, Object>> lists5 = new ArrayList<>();

        List<Map<String, Object>> list = zhuzhiMapper.essentialExam(map.get("id"));
        System.out.println(list);
        for (Map<String, Object> mapps:list) {
            if(mapps.get("question_bank_type").equals("单选题")){
                lists1.add(mapps);
            }
            if(mapps.get("question_bank_type").equals("多选题")){
                lists2.add(mapps);
            }
            if(mapps.get("question_bank_type").equals("判断题")){
                lists3.add(mapps);
            }
            if(mapps.get("question_bank_type").equals("填空题")){
                lists4.add(mapps);
            }
            if(mapps.get("question_bank_type").equals("简答题")){
                lists5.add(mapps);
            }
        }
        stringListHashMap.put("danxvan", lists1);
        stringListHashMap.put("duoxvan", lists2);
        stringListHashMap.put("panduan", lists3);
        stringListHashMap.put("tiankong", lists4);
        stringListHashMap.put("jianda", lists5);
        System.out.println("打印测试=="+stringListHashMap);

        return stringListHashMap;
    }

    @Override
    public List<Map<String, Object>> analyseExam() {
        List<Map<String, Object>> list = zhuzhiMapper.analyseExam();
        NumberFormat nf = NumberFormat.getNumberInstance();
        // 保留两位小数
        nf.setMaximumFractionDigits(2);
        // 如果不需要四舍五入，可以使用RoundingMode.DOWN
        nf.setRoundingMode(RoundingMode.UP);

        for (int i = 0; i < list.size(); i++) {
            int count = Integer.parseInt(String.valueOf(list.get(i).get("aCount"))); //参加次数
            int count1 = Integer.parseInt(String.valueOf(list.get(i).get("bCount")));//通过次数
            if(count1 != 0 && count != 0){
                double is = (Double.valueOf(count1)/Double.valueOf(count)) * 100;
                System.out.println(count1+"/"+count+"="+is);
                list.get(i).put("tongg",nf.format(is) );
            }else{
                list.get(i).put("tongg",0 );
            }
        }
        return list;
    }

    @Override
    public List<Map<String, Object>> selectPaper(Object id) {
        return zhuzhiMapper.selectPaper(id);
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


class ssds{

    public static void main(String[] args) {

        NumberFormat nf = NumberFormat.getNumberInstance();
        // 保留两位小数
        nf.setMaximumFractionDigits(2);
        // 如果不需要四舍五入，可以使用RoundingMode.DOWN
        nf.setRoundingMode(RoundingMode.UP);
        double s = 2.0;
        double sd = 3.0;
        double  kk =  (s/sd) * 100;

        System.out.println(nf.format(kk));
    }

}