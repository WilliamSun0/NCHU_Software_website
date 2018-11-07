package com.nchu.software.commons;

import java.util.Map;

public class ResultDate {

	private static final String SUCCESS = "success";
	
	private String success = SUCCESS;
	
	private String msg;
	
	private Object data;
	
	private Map<String, ?> map;

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Map<String, ?> getMap() {
		return map;
	}

	public void setMap(Map<String, ?> map) {
		this.map = map;
	}
	
}
