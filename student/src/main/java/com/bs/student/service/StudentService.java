package com.bs.student.service;

import java.util.List;
import java.util.Map;

import com.bs.student.bean.Student;

public interface StudentService extends BaseService<Student>{

	/**
	 * 查询学生的积分情况
	 * @return
	 */
	List<Student> getScoreDeduct(Map<String, Object> params);
	
	int getScoreDeductCount(Map<String, Object> params);
	
	//生成励志奖学金列表
	List<Student> getLZ();
	
	List<String> getClassList();
}
