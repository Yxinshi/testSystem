package com.bgs.examinationbackstage.controller;

import com.bgs.examinationbackstage.config.ResultEntity;
import com.bgs.examinationbackstage.pojo.ExaminationPaper;
import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.service.ShujuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/shuju")
public class ShujuTongji {
    @Autowired
    private ShujuService shujuService;
    @GetMapping("/tongji")
    @ResponseBody
    public ResultEntity tongji(@RequestParam(defaultValue = "",value = "testPaperName")String testPaperName,
                       @RequestParam(defaultValue = "",value = "testPaperStartTime") String testPaperStartTime,
                       @RequestParam(defaultValue = "",value = "testPaperEndTime") String testPaperEndTime,
                       @RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
        System.out.println(testPaperName);
       ResultEntity resultEntity= shujuService.findAll(page,limit,testPaperName,testPaperStartTime,testPaperEndTime);
       return resultEntity;
    }
    @GetMapping("/detailshu")
    public String detailshu(ModelMap modelMap, @RequestParam("testPaperId") Integer testPaperId,@RequestParam("uId")Integer uId){
        System.out.println(testPaperId+"="+uId);
      ExaminationPaper examinationPaper=  shujuService.findAllParameter(testPaperId,uId); //考试详情信息
        //应参加人数
        int canjia=shujuService.canjia();
        //缺考人数
        int quekao=canjia-Integer.valueOf(examinationPaper.getTestPaperNumberOfParticipants());
        //正确的题
        double success=shujuService.selectTestOk(testPaperId);
        //总题数
        float zongti=shujuService.zongti(testPaperId);
        System.out.println(success+"="+zongti);
        String lv=success/zongti*100+"%";
        //最高分
        int gao=shujuService.zuigao(testPaperId);
        //最低分
        int zuidi=shujuService.zuidi(testPaperId);
        modelMap.addAttribute("examinationPaper",examinationPaper);
        modelMap.addAttribute("ycanjia",canjia);
        modelMap.addAttribute("quekao",quekao);
        modelMap.addAttribute("zhengque",lv);
        modelMap.addAttribute("zuigaofen",gao);
        modelMap.addAttribute("zuitifen",zuidi);
        return "kaoshidetail";
    }
    @RequestMapping("/quekaoperson")
    @ResponseBody
    public  List<User> quekao(@RequestParam("testPaperId") Integer testPaperId){
        List<User> users=shujuService.quekao(testPaperId);
        return users;
    }
    @RequestMapping("/renyuanxiangqing")
    @ResponseBody
    public  ResultEntity renyuanxiangqing(@RequestParam("page") Integer page,@RequestParam("limit")Integer limit,@RequestParam("testPaperId") Integer testPaperId){
        System.out.println(page+"=="+limit+"=="+testPaperId);
        ResultEntity users=shujuService.detail(testPaperId,page,limit);
        return users;
    }
}
