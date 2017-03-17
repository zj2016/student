package com.bs.student.query;

import org.apache.commons.lang3.StringUtils;

public class GradeQuery extends Query{

	private String stuId;

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = StringUtils.isBlank(stuId) ? null : stuId;
	}
	
	
}
