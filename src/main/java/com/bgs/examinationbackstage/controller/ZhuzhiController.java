package com.bgs.examinationbackstage.controller;


import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.service.ZhuzhiService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.bgs.examinationbackstage.utils.AliOSSUtilS;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
    public boolean deletePaper(@RequestBody Map<String,Object> map) {
        System.out.println(map.get("id"));
        boolean b = zhuzhiService.deletePaper(map.get("id"));
        return b;
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
     * 创建试卷 抽选试题卷
     * */
    @RequestMapping("/examination")
    public List<User>  examinationexamination(@RequestBody Map<String,Object> map,HttpSession session) {
        System.out.println(map);
        List<Map<String,Object>> list = zhuzhiService.examinationexamination(map,session);
        System.out.println(list);
        return null;
    }


    /**
     * 创建试卷 选试题信息
     * */
    @RequestMapping("/ChooseQuestions")
    public List<Map<String,Object>>  ChooseQuestions() {
        List<Map<String,Object>> list = zhuzhiService.ChooseQuestions();
        System.out.println(list);
        return list;
    }

    /**
     * 创建试卷 固定试题卷
     * */
    @RequestMapping("/FixedSubmitted")
    public List<Map<String,Object>>  FixedSubmitted(@RequestBody Map<String,Object> map,HttpSession session) {

        System.out.println("controller==="+map);

        List<Map<String,Object>> list = zhuzhiService.FixedSubmitted(map,session);
        return null;
    }

    /**
     * 创建试卷 固定试题卷
     * */
    @RequestMapping("/essentialInformation")
    public Map<String,Object>   essentialInformation(@RequestBody Map<String,Object> map) {
        Map<String,Object> map1 = zhuzhiService.essentialInformation(map.get("id"));
        System.out.println(map1);
        return map1;
    }

    @RequestMapping("/essentialUser")
    public List<Map<String,Object>>  essentialUser(@RequestBody Map<String,Object> map) {
        List<Map<String,Object>> list = zhuzhiService.essentialUser(map);
        System.out.println(list);
        return list;
    }

    @RequestMapping("/essentialExam")
    public  HashMap<String, List<Map<String, Object>>>   essentialExam(@RequestBody Map<String,Object> map) {
        HashMap<String, List<Map<String, Object>>> list = zhuzhiService.essentialExam(map);
        System.out.println(list);
        return list;
    }

    /**
     * 考生分析
     * */
    @RequestMapping("/analyseExam")
    public   List<Map<String, Object>>   analyseExam() {
        List<Map<String, Object>>  list = zhuzhiService.analyseExam();
        System.out.println(list);
        return list;
    }


    /**
     * 考生试卷列表
     * */
    @RequestMapping("/selectPaper")
    public   List<Map<String, Object>>   selectPaper(@RequestBody  Map<String,Object> map) {

        System.out.println(map);
        List<Map<String, Object>>  list = zhuzhiService.selectPaper(map.get("id"));
        return list;
    }

    //实现接收的方法
    @CrossOrigin
    @PostMapping(value = "/api/uploadVidoe3")
    @ResponseBody
    public Map<String,String> savaVideotest(
            @RequestParam("file") MultipartFile[] fileyu,
            @RequestParam("videoState") String videoState,
             @RequestParam("headline") String headline
    ) throws IllegalStateException, IOException {
        System.out.println(videoState);
        System.out.println(headline);

        //视频上传
        Map<String, String> map = VideoTransmission(fileyu[0]);

        //图片上传
        Map<String, String> imageUpload =  imageUpload(fileyu[1]);

//
//        Map<String, String> resultMap = new HashMap<>();
//        try {
//            //获取文件后缀，因此此后端代码可接收一切文件，上传格式前端限定
//            String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1)
//                    .toLowerCase();
//            // 重构文件名称
//            System.out.println("前端传递的保存路径：" + SavePath);
//            String pikId = UUID.randomUUID().toString().replaceAll("-", "");
//            String newVidoeName = pikId + "." + fileExt;
//            System.out.println("重构文件名防止上传同名文件：" + newVidoeName);
//            //保存视频
//            File fileSave = new File(SavePath, newVidoeName);
//            file.transferTo(fileSave);
//            //构造Map将视频信息返回给前端
//            //视频名称重构后的名称
//            resultMap.put("newVidoeName", newVidoeName);
//            //正确保存视频则设置返回码为200
//            resultMap.put("resCode", "200");
//            //返回视频保存路径
//            resultMap.put("VideoUrl", SavePath + "/" + newVidoeName);
//            return resultMap;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            e.getMessage();
//            //保存视频错误则设置返回码为400
//            resultMap.put("resCode", "400");
//            return resultMap;
//
//        }
        return null;
    }
    /**
     * 图片上传
     * */
    public  Map<String,String>  imageUpload(MultipartFile picture) throws IOException {
        String filename = picture.getOriginalFilename();
        File file  = new File(filename);
        FileUtils.copyInputStreamToFile(picture.getInputStream(), file);
        System.out.println(picture.getInputStream().toString()+"====");
        //调用阿里云工具类 返回文件地址
        //创建文件路径..
        String fileUrl = "img/" + (UUID.randomUUID().toString().replace("-", "") + "-" + file.getName());
        String upload = AliOSSUtilS.uploadFileInputSteam(fileUrl,file);
        System.out.println(upload);
        return null;
    }
    /**
     * 视频上传
     * */
    public  Map<String,String>  VideoTransmission(MultipartFile file){
        String SavePath = "H:\\ja";
        Map<String, String> resultMap = new HashMap<>();
        try {
            //获取文件后缀，因此此后端代码可接收一切文件，上传格式前端限定
            String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1)
                    .toLowerCase();
            // 重构文件名称
            System.out.println("前端传递的保存路径：" + SavePath);
            String pikId = UUID.randomUUID().toString().replaceAll("-", "");
            String newVidoeName = pikId + "." + fileExt;
            System.out.println("重构文件名防止上传同名文件：" + newVidoeName);
            //保存视频
            File fileSave = new File(SavePath, newVidoeName);
            file.transferTo(fileSave);
            //构造Map将视频信息返回给前端
            //视频名称重构后的名称
            resultMap.put("newVidoeName", newVidoeName);
            //正确保存视频则设置返回码为200
            resultMap.put("resCode", "200");
            //返回视频保存路径
            resultMap.put("VideoUrl", SavePath + "/" + newVidoeName);
            return resultMap;

        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
            //保存视频错误则设置返回码为400
            resultMap.put("resCode", "400");
            return resultMap;

        }

        }


    @PostMapping(value = "/api/tupian")
    @ResponseBody
    public Map<String,String> tupian(@RequestParam("file") MultipartFile[] file,@RequestParam("ces") String ces) throws IllegalStateException {
        System.out.println(file[0].getOriginalFilename());
        System.out.println(file[1].getOriginalFilename());

        System.out.println(ces);
        return null;
        }

}
