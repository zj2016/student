package com.bs.student.service;

import java.util.List;
import java.util.Map;

public interface BaseService<T> {

	int add(T t);
	
	int update(T t);
	
	int remove(String id);
	
	T get(String id);
	
	List<T> getList(Map<String, Object> params);
	
	int getCount(Map<String, Object> params);
	
}
