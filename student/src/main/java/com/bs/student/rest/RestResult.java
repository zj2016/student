package com.bs.student.rest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class RestResult {
	
	public static final Integer SUCCESS = 10000;
	
	public static final Integer FAIL = 10500;
	
	private Integer code;
	
	private String info;
	
	private Object response;

	public Integer getCode() {
		return code;
	}

	public RestResult setCode(Integer code) {
		this.code = code;
		return this;
	}

	public String getInfo() {
		return info;
	}

	public RestResult setInfo(String info) {
		this.info = info;
		return this;
	}

	public Object getResponse() {
		return response;
	}

	public RestResult setResponse(Object response) {
		this.response = response;
		return this;
	}
	
	public RestResult(){};
	
	public RestResult(Integer code, String info){
		this.code = code;
		this.info = info;
	}
	
	public static RestResult error(Integer code, String info){
		return new RestResult(code, info);
	}
	
	public static RestResult error(String info){
		return error(FAIL,info);
	}
	
	public static RestResult success(){
		return new RestResult(SUCCESS, "success");
	}

}
