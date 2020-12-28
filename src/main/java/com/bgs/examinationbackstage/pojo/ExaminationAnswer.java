package com.bgs.examinationbackstage.pojo;


public class ExaminationAnswer {

  private long userId;
  private String answer;
  private String score;
  private long examinationId;
  private long questionId;


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getAnswer() {
    return answer;
  }

  public void setAnswer(String answer) {
    this.answer = answer;
  }


  public String getScore() {
    return score;
  }

  public void setScore(String score) {
    this.score = score;
  }


  public long getExaminationId() {
    return examinationId;
  }

  public void setExaminationId(long examinationId) {
    this.examinationId = examinationId;
  }


  public long getQuestionId() {
    return questionId;
  }

  public void setQuestionId(long questionId) {
    this.questionId = questionId;
  }

}
