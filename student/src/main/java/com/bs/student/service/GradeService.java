package com.bs.student.service;

import java.util.List;

import com.bs.student.bean.Grade;

public interface GradeService extends BaseService<Grade>{

	int batchAdd(List<Grade> gradeList);
	
}
