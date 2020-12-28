package com.bgs.examinationbackstage.pojo;



public class TestPaperUser {

  private long testPaperId;
  private long userId;
  private String totalPoints;
  private String passState;
  private String joinState;
  private java.sql.Timestamp startTime;
  private java.sql.Timestamp endTime;


  public long getTestPaperId() {
    return testPaperId;
  }

  public void setTestPaperId(long testPaperId) {
    this.testPaperId = testPaperId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getTotalPoints() {
    return totalPoints;
  }

  public void setTotalPoints(String totalPoints) {
    this.totalPoints = totalPoints;
  }


  public String getPassState() {
    return passState;
  }

  public void setPassState(String passState) {
    this.passState = passState;
  }


  public String getJoinState() {
    return joinState;
  }

  public void setJoinState(String joinState) {
    this.joinState = joinState;
  }


  public java.sql.Timestamp getStartTime() {
    return startTime;
  }

  public void setStartTime(java.sql.Timestamp startTime) {
    this.startTime = startTime;
  }


  public java.sql.Timestamp getEndTime() {
    return endTime;
  }

  public void setEndTime(java.sql.Timestamp endTime) {
    this.endTime = endTime;
  }

}
