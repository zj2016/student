package com.bs.student.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.student.bean.Student;
import com.bs.student.dao.StudentMapper;
import com.bs.student.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentMapper studentMapper;
	
	public int add(Student t) {
		return studentMapper.insert(t);
	}

	public int update(Student t) {
		return studentMapper.update(t);
	}

	public int remove(String id) {
		return studentMapper.delete(id);
	}

	public Student get(String id) {
		return studentMapper.select(id);
	}

	public List<Student> getList(Map<String, Object> params) {
		return studentMapper.selectList(params);
	}

	public int getCount(Map<String, Object> params) {
		return studentMapper.selectCount(params);
	}

	public List<Student> getScoreDeduct(Map<String, Object> params) {
		return studentMapper.selectScoreDeduct(params);
	}

	public int getScoreDeductCount(Map<String, Object> params) {
		return studentMapper.selectScoreDeductCount(params);
	}

	public List<Student> getLZ() {
		return studentMapper.selectLZ();
	}

	public List<String> getClassList() {
		return studentMapper.selectClass();
	}

}
