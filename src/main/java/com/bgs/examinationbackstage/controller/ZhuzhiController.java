package com.bgs.examinationbackstage.controller;


import com.bgs.examinationbackstage.service.ZhuzhiService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @ResponseBody
    @RequestMapping("/jurisdiction")
    public List<Map<String,Object>> Kaoshi(HttpSession session) {
        List<Map<String,Object>> list = zhuzhiService.Kaoshi();

        System.out.println(list);
        return list;
    }

}
