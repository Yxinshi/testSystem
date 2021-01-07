package com.bgs.examinationbackstage.pojo;

import lombok.Data;

@Data
public class ExaminationAnswer {

  private Integer userId;
  private String answer;
  private String score;
  private Integer examinationId;
  private Integer questionId;



}
