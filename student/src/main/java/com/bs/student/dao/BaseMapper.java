package com.bs.student.dao;

import java.util.List;
import java.util.Map;

public interface BaseMapper<T> {

	int delete(String couId);

    int insert(T record);

    T select(String couId);

    int update(T record);
    
    List<T> selectList(Map<String, Object> params);
    
    int selectCount(Map<String, Object> params);
}
