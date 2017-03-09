package com.bs.student.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.student.bean.Student;
import com.bs.student.query.Query;
import com.bs.student.rest.Rest;
import com.bs.student.service.StudentService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String list(Query query) throws JsonProcessingException{
		
		Map<String, Object> params = query.toMap();
		List<Student> stuList = studentService.getList(params);
		int count = studentService.getCount(params);
		
		Rest<Student> rest = new Rest<Student>(count, stuList);
		return rest.toJson();
	}
	

}