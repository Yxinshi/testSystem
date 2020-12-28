package com.bgs.examinationbackstage.pojo;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 认证token模型
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("Token")
public class AuthTokenModel {

    private String accessToken;//token

    private Long accessExpire;//过期时间

    private String roleName;//角色名
}
