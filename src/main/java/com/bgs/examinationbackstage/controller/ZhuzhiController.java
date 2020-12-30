package com.bgs.examinationbackstage.controller;


import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.service.ZhuzhiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/kaoshi")
public class ZhuzhiController {


    @Autowired
    ZhuzhiService zhuzhiService;

    /**
     * 考试显示 + 模糊查询
     * */
    @RequestMapping("/jurisdiction")
    public List<Map<String,Object>> Kaoshi(@RequestBody Map<String,Object> map) {
        System.out.println(map);
        if(map.get("timing") != null && map.get("timing") !="" ){
            List<String> lists = (List<String>) map.get("timing");
            String substring0 = lists.get(0).substring(0, 10);
            String substring1 = lists.get(1).substring(0, 10);
            map.put("start", substring0);
            map.put("finish", substring1);
        }
        List<Map<String,Object>> list = zhuzhiService.Kaoshi(map);
        System.out.println(list);
        return list;
    }

    /**
     * 考试信息删除  管理删除
     * */
    @RequestMapping("/deletePaper")
    public List<Map<String,Object>> deletePaper(@RequestBody Map<String,Object> map) {
        System.out.println(map.get("id"));
//        boolean b = zhuzhiService.deletePaper(map.get("id"));
        return null;
    }


    /**
     * 关联用户展示
     * */
    @RequestMapping("/addUser")
    public List<User>  addUser() {
        List<User> user = zhuzhiService.addUser();
        System.out.println(user);
        return user;
    }

    /**
     * 创建试卷信息
     * */
    @RequestMapping("/examination")
    public List<User>  examinationexamination(@RequestBody Map<String,Object> map) {

        System.out.println(map);
        return null;
    }

}
