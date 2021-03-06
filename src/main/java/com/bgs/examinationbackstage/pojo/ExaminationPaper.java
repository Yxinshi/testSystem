package com.bgs.examinationbackstage.pojo;


import lombok.Data;

import java.util.Date;
@Data
public class ExaminationPaper {

  private Integer testPaperId;
  private String testPaperName;
  private Date testPaperDate;
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

  private Integer userId;

}
