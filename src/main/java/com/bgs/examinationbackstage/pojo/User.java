package com.bgs.examinationbackstage.pojo;


import io.swagger.models.auth.In;
import lombok.Data;

@Data
public class User {

  private Integer id;
  private String name;
  private Integer jobNumber;
  private String identityUser;
  private Integer accountNumber;
  private String password;
  private String phone;
  private Integer roleId;

  private String totalPoints;
  private Integer estimateStatus;
  private Integer testPaperId;
  private Integer userId;


}
