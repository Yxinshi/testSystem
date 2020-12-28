package com.bgs.examinationbackstage.pojo;



public class QuestionBank {

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


  public long getQuestionBankId() {
    return questionBankId;
  }

  public void setQuestionBankId(long questionBankId) {
    this.questionBankId = questionBankId;
  }


  public String getQuestionBankContent() {
    return questionBankContent;
  }

  public void setQuestionBankContent(String questionBankContent) {
    this.questionBankContent = questionBankContent;
  }


  public String getQuestionBankClassify() {
    return questionBankClassify;
  }

  public void setQuestionBankClassify(String questionBankClassify) {
    this.questionBankClassify = questionBankClassify;
  }


  public String getQuestionBankType() {
    return questionBankType;
  }

  public void setQuestionBankType(String questionBankType) {
    this.questionBankType = questionBankType;
  }


  public String getQuestionBankAnswer() {
    return questionBankAnswer;
  }

  public void setQuestionBankAnswer(String questionBankAnswer) {
    this.questionBankAnswer = questionBankAnswer;
  }


  public String getQuestionBankScore() {
    return questionBankScore;
  }

  public void setQuestionBankScore(String questionBankScore) {
    this.questionBankScore = questionBankScore;
  }


  public java.sql.Timestamp getQuestionBankCreationTime() {
    return questionBankCreationTime;
  }

  public void setQuestionBankCreationTime(java.sql.Timestamp questionBankCreationTime) {
    this.questionBankCreationTime = questionBankCreationTime;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getOptionA() {
    return optionA;
  }

  public void setOptionA(String optionA) {
    this.optionA = optionA;
  }


  public String getOptionB() {
    return optionB;
  }

  public void setOptionB(String optionB) {
    this.optionB = optionB;
  }


  public String getOptionC() {
    return optionC;
  }

  public void setOptionC(String optionC) {
    this.optionC = optionC;
  }


  public String getOptionD() {
    return optionD;
  }

  public void setOptionD(String optionD) {
    this.optionD = optionD;
  }


  public String getSharedState() {
    return sharedState;
  }

  public void setSharedState(String sharedState) {
    this.sharedState = sharedState;
  }


  public String getAnalysis() {
    return analysis;
  }

  public void setAnalysis(String analysis) {
    this.analysis = analysis;
  }


  public String getDifficulty() {
    return difficulty;
  }

  public void setDifficulty(String difficulty) {
    this.difficulty = difficulty;
  }

}
