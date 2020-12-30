package com.bgs.examinationbackstage.service.serviceImp;

import com.bgs.examinationbackstage.mapper.ZhuzhiMapper;
import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.service.ZhuzhiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
     * 添加试卷操作
     * */
    @Transactional
    @Override
    public List<Map<String, Object>> examinationexamination(Map<String, Object> map) {
        Map<String, Object> tissue = (Map<String, Object>) map.get("tissue");
        List<User> users = (List<User>) map.get("userEx");
        System.out.println(users);

        String s = String.valueOf(tissue.get("dateExam"));
        String s1 = s.substring(0, 10);
        List<Integer> str = (List<Integer>) tissue.get("classify");
        String jin = "";
        for (Integer ks: str) {
            jin = jin + ks;
        }
        tissue.put("dateExam", s1);
        tissue.put("number", users.size());
        tissue.put("jin", jin);
        boolean b = zhuzhiMapper.examinationexamination(tissue);
        System.out.println("自增"+map);
        System.out.println(((Map<String, Object>) map.get("tissue")).get("test_paper_id"));

        return null;
    }
}
