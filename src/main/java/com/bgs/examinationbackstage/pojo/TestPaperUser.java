package com.bgs.examinationbackstage.pojo;


import io.swagger.models.auth.In;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class TestPaperUser {

  private Integer testPaperId;
  private Integer userId;
  private String totalPoints;
  private Integer estimateStatus;
  private Integer passState;
  private Integer joinState;
  private Date startTime;
  private Date endTime;

  private List<TestPaperUser> paperUserList;
  private Integer id;


}
