package com.bgs.examinationbackstage.pojo;

import lombok.Data;

@Data
public class Page {
    private int limit;
    private int offset;
    private String sort;
    private String order;
}