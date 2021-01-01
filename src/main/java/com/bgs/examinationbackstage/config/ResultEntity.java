package com.bgs.examinationbackstage.config;

public class ResultEntity<T> {
	
	public static final Integer SUCCESS=0;
	private Integer code;
	private String message;
	private Integer count;
	// 要返回的数据
	private T data;

	public ResultEntity(Integer code, String message, Integer count, T data) {
		this.code = code;
		this.message = message;
		this.count = count;
		this.data = data;
	}

	public ResultEntity() {
	}

	public static Integer getSUCCESS() {
		return SUCCESS;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
}
