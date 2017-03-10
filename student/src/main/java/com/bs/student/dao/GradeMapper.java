package com.bs.student.dao;

import java.util.List;

import com.bs.student.bean.Grade;

public interface GradeMapper extends BaseMapper<Grade>{
	
	int insertBatch(List<Grade> gradeList);
	
}

