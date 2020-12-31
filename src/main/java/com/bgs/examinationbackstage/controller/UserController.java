package com.bgs.examinationbackstage.controller;

import com.bgs.examinationbackstage.pojo.AuthTokenModel;
import com.bgs.examinationbackstage.pojo.Permission;
import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.service.UserService;
import com.bgs.examinationbackstage.utils.BaseResponse;
import com.bgs.examinationbackstage.utils.StatusCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
@Api("登录+左侧导航栏展示")
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

/*    @RequestMapping("/userLogin")
    @ResponseBody
    @ApiOperation("用户登录")
    public BaseResponse userLogin(@RequestParam String name,@RequestParam String password){
        //判断用户名或者密码是否为空
        if(StringUtils.isBlank(name) || StringUtils.isBlank(password)){
            //提示用户名密码不能为空
            return new BaseResponse(StatusCode.UserNamePasswordNotBlank);
        }
        BaseResponse<AuthTokenModel> baseResponse = new BaseResponse<>(StatusCode.Success);
        try {
            //登录并创建token
            baseResponse.setData(userService.authUserAndCreateToken(name,password));
        }catch (Exception e){
            return new BaseResponse<>(StatusCode.Fail.getCode(),e.getMessage());
        }
        return baseResponse;
    }*/
    @GetMapping("/userLogin")
    @ApiOperation("用户登录")
    public BaseResponse userLogin(@RequestParam String name, @RequestParam String password, HttpSession
                                  session){

            User user =  userService.userLogin(name,password);
            if (user!=null){
                session.setAttribute("user",user);
                return new BaseResponse(200,"登录成功",user);
            }else {
                return new BaseResponse(-1,"失败");
            }
    }


    @GetMapping("/showLeftList")
    @ApiOperation("加载左侧导航栏")
    public List<Permission> showLeftList(HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Permission> list = userService.showLeftList(user.getRoleId());
        return list;
       /* if (list!=null){
            return new BaseResponse(200,"查询成功",list);
        }else {
            return new BaseResponse(-1,"失败");
        }*/
    }




}
