package com.bgs.examinationbackstage.service.serviceImp;

import com.alibaba.fastjson.JSON;
import com.bgs.examinationbackstage.mapper.UserMapper;
import com.bgs.examinationbackstage.pojo.AccessTokenDto;
import com.bgs.examinationbackstage.pojo.AuthTokenModel;
import com.bgs.examinationbackstage.pojo.Permission;
import com.bgs.examinationbackstage.pojo.User;
import com.bgs.examinationbackstage.service.UserService;
import com.bgs.examinationbackstage.utils.BaseResponse;
import com.bgs.examinationbackstage.utils.Constant;
import com.bgs.examinationbackstage.utils.EncryptUtil;
import com.bgs.examinationbackstage.utils.StatusCode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

import java.util.concurrent.TimeUnit;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    @Autowired
    private ObjectMapper objectMapper;


    @Override
    public User userLogin(String name, String password) {
        return userMapper.userLogin(name,password);
    }

    @Override
    public List<Permission> showLeftList(Integer id) {
        return userMapper.showLeftList(id);
    }

    @Override
    public AuthTokenModel authUserAndCreateToken(String name, String password) throws Exception {
        User user = authUser(name,password);
        if (user != null){
            //失效掉以前仍然可以使用的accessToken
            //创建token对象
            AccessTokenDto accessTokenDto =
                    new AccessTokenDto(user.getId(),name,System.currentTimeMillis(), Constant.snowFlake.nextId().toString(),Constant.ACCESS_TOKEN_EXPIRE);
            //将对象转为字符串
            String accessTokenDtoJsonStr = objectMapper.writeValueAsString(accessTokenDto);
            //给定一个秘钥给字符串加密
            String accessToken = EncryptUtil.aesEncrypt(accessTokenDtoJsonStr, Constant.TOKEN_AUTH_KEY);
            //将token对象存储到redis中
            stringRedisTemplate.opsForValue().set(accessToken, JSON.toJSONString(user));
            stringRedisTemplate.expire(accessToken,3600L, TimeUnit.SECONDS);
            AuthTokenModel authTokenModel=new AuthTokenModel();
            authTokenModel.setAccessToken(accessToken);
            authTokenModel.setRoleName(user.getName());
            return authTokenModel;
        }
        return null;
    }

    private User authUser(String name, String password) {
        User user = userMapper.selUserInfoByName(name);
        if(user == null){
            throw new RuntimeException("当前用户未注册。");
        }
        if(!password.equals(user.getPassword())){
            throw new RuntimeException("您输入的密码有误，请重新输入。");
        }
        return user;
    }

    @Override
    public BaseResponse validateToken(String accessToken) {
        BaseResponse response = new BaseResponse(StatusCode.Success);
        try {
            if (StringUtils.isBlank(accessToken)) {
                return new BaseResponse(StatusCode.AccessTokenNotBlank);
            }
            //为了防止token伪造,会额外做异步操作解析token
            AccessTokenDto accessTokenDto;
            try {
                accessTokenDto = parseAccessToken(accessToken);
            } catch (Exception e) {
                return new BaseResponse(StatusCode.AccessTokenInvalidate);
            }
            if (accessTokenDto != null) {
                //判断token是否过期
                if (System.currentTimeMillis() - accessTokenDto.getTimestamp() > accessTokenDto.getExpire()) {
                    //失效token
                    this.invalidateByAccessToken(accessToken);
                    return new BaseResponse(StatusCode.TokenValidateExpireToken);
                }
            }
        } catch (Exception e) {
            return new BaseResponse(StatusCode.Fail, e.getMessage());
        }
        return response;
    }

    //解析token
    private AccessTokenDto parseAccessToken(String accessToken) throws Exception {
        String tokenJsonStr = EncryptUtil.aesDecrypt(accessToken, Constant.TOKEN_AUTH_KEY);
        return objectMapper.readValue(tokenJsonStr, AccessTokenDto.class);
    }

    //失效token
    private void invalidateByAccessToken(String accessToken) {
        if (StringUtils.isNotBlank(accessToken)){
            stringRedisTemplate.delete(accessToken);
        }
    }
}
