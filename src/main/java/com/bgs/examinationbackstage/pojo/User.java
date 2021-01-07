package com.bgs.examinationbackstage.pojo;


import io.swagger.models.auth.In;
import lombok.Data;

import java.util.List;

@Data
public class User {
  private Integer id;
  private String name;
  private long jobNumber;
  private String identityUser;
  private long accountNumber;
  private String password;
  private String phone;
  private Integer roleId;
}
