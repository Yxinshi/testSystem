package com.bgs.examinationbackstage.pojo;


import lombok.Data;


@Data
public class ExaminationPaper {
  private Integer testPaperId;
  private String testPaperName;
  private java.sql.Timestamp testPaperDate;
  private String testPaperStartTime;
  private String testPaperEndTime;
  private String testPaperState;
  private String testPaperTime;
  private String itemBankClassify;
  private String wayToDraw;
  private String testPaperPassMark;
  private String testPaperFullMark;
  private String testPaperNumberOfParticipants;
  private String testPaperByTheNumberOf;
  private String testPaperPassingRate;
  private String testPaperAverageScore;
  private String testPaperFounder;
  private Integer id;
  private String name;//姓名
  private String jobNumber;
  private Integer totalPoints;
  private Integer passState;

}
