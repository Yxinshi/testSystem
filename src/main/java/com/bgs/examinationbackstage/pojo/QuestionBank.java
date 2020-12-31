package com.bgs.examinationbackstage.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class QuestionBank  extends  Page{

  private  String testPaperName;

  private long questionBankId;
  private String questionBankContent;
  private String questionBankClassify;
  private String questionBankType;
  private String questionBankAnswer;
  private String questionBankScore;

  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date questionBankCreationTime;
  private long userId;
  private String optionA;
  private String optionB;
  private String optionC;
  private String optionD;
  private String sharedState;
  private String analysis;
  private String difficulty;



}
