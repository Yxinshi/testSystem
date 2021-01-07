package com.bgs.examinationbackstage.pojo;

import lombok.Data;

@Data
public class Result<T> {
    Integer code;
    String msg;
    Integer count;
    T data;
}
