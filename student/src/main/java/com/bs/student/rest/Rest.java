package com.bs.student.rest;

import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Rest<T> {
	private int total;
	private List<T> rows;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	
	public Rest() {
		super();
	}
	public Rest(int total, List<T> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}
	public String toJson() throws JsonProcessingException{
		ObjectMapper om = new ObjectMapper();
		return om.writeValueAsString(this);
	}
}
