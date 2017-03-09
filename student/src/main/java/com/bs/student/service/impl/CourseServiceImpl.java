package com.bs.student.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.student.bean.Course;
import com.bs.student.dao.CourseMapper;
import com.bs.student.service.CourseService;
import com.bs.student.utils.IdUtils;

@Service
public class CourseServiceImpl implements CourseService{
	
	@Autowired
	private CourseMapper courseMapper;

	public int add(Course t) {
		t.setCouId(IdUtils.id());
		return courseMapper.insert(t);
	}

	public int update(Course t) {
		return courseMapper.update(t);
	}

	public int remove(String id) {
		return courseMapper.delete(id);
	}

	public Course get(String id) {
		return courseMapper.select(id);
	}

	public List<Course> getList(Map<String, Object> params) {
		return courseMapper.selectList(params);
	}

	public int getCount(Map<String, Object> params) {
		return courseMapper.selectCount(params);
	}

}
