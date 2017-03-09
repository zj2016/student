package com.bs.student.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.student.bean.Grade;
import com.bs.student.dao.GradeMapper;
import com.bs.student.service.GradeService;
import com.bs.student.utils.IdUtils;

@Service
public class GradeServiceImpl implements GradeService{

	@Autowired
	private GradeMapper gradeMapper;
	
	public int add(Grade t) {
		t.setGradeId(IdUtils.id());
		return gradeMapper.insert(t);
	}

	public int update(Grade t) {
		return gradeMapper.update(t);
	}

	public int remove(String id) {
		return gradeMapper.delete(id);
	}

	public Grade get(String id) {
		return gradeMapper.select(id);
	}

	public List<Grade> getList(Map<String, Object> params) {
		return gradeMapper.selectList(params);
	}

	public int getCount(Map<String, Object> params) {
		return gradeMapper.selectCount(params);
	}

}
