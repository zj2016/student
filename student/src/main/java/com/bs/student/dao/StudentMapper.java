package com.bs.student.dao;

import java.util.List;
import java.util.Map;

import com.bs.student.bean.Student;

public interface StudentMapper extends BaseMapper<Student>{
	
	//生成奖学金列表
	List<Student> selectScoreDeduct(Map<String, Object> params);
	
	int selectScoreDeductCount(Map<String, Object> params);
	
	//生成励志奖学金列表
	List<Student> selectLZ();
	
	//获得班级列表
	List<String> selectClass();
}