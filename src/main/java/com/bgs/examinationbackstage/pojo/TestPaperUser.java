package com.bgs.examinationbackstage.pojo;


import java.sql.Timestamp;
import java.util.List;

public class TestPaperUser {
  private Integer id;
  private long testPaperId;
  private Integer userId;
  private Integer totalPoints;
  private Integer passMark;
  private Integer estimateStatus;
  private Integer passState;
  private Integer joinState;
  private java.sql.Timestamp startTime;
  private java.sql.Timestamp endTime;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public long getTestPaperId() {
    return testPaperId;
  }

  public void setTestPaperId(long testPaperId) {
    this.testPaperId = testPaperId;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public Integer getTotalPoints() {
    return totalPoints;
  }

  public void setTotalPoints(Integer totalPoints) {
    this.totalPoints = totalPoints;
  }

  public Integer getPassMark() {
    return passMark;
  }

  public void setPassMark(Integer passMark) {
    this.passMark = passMark;
  }

  public Integer getEstimateStatus() {
    return estimateStatus;
  }

  public void setEstimateStatus(Integer estimateStatus) {
    this.estimateStatus = estimateStatus;
  }

  public Integer getPassState() {
    return passState;
  }

  public void setPassState(Integer passState) {
    this.passState = passState;
  }

  public Integer getJoinState() {
    return joinState;
  }

  public void setJoinState(Integer joinState) {
    this.joinState = joinState;
  }

  public Timestamp getStartTime() {
    return startTime;
  }

  public void setStartTime(Timestamp startTime) {
    this.startTime = startTime;
  }

  public Timestamp getEndTime() {
    return endTime;
  }

  public void setEndTime(Timestamp endTime) {
    this.endTime = endTime;
  }

}
