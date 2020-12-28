package com.bgs.examinationbackstage.pojo;


import lombok.Data;

import java.util.List;
@Data
public class Permission {

  private long pId;
  private String pName;
  private String path;
  private long parentId;

  private List<Permission> perList;



}
