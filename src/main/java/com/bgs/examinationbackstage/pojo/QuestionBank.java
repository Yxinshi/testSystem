package com.bgs.examinationbackstage.pojo;


import lombok.Data;

@Data
public class QuestionBank  extends  Page{

  private  String testPaperName;

  private long questionBankId;
  private String questionBankContent;
  private String questionBankClassify;
  private String questionBankType;
  private String questionBankAnswer;
  private String questionBankScore;
  private java.sql.Timestamp questionBankCreationTime;
  private long userId;
  private String optionA;
  private String optionB;
  private String optionC;
  private String optionD;
  private String sharedState;
  private String analysis;
  private String difficulty;



}
