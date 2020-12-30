package com.bgs.examinationbackstage.service;

import com.bgs.examinationbackstage.pojo.AuthTokenModel;
import com.bgs.examinationbackstage.pojo.Permission;
import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.utils.BaseResponse;

import java.util.List;
import java.util.Map;

public interface UserService {
    User userLogin(String name, String password);

    AuthTokenModel authUserAndCreateToken(String name, String password) throws Exception;

    BaseResponse validateToken(String accessToken);

    List<Permission> showLeftList(Integer id);
}
