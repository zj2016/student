package com.bs.student.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.student.bean.Student;
import com.bs.student.query.Query;
import com.bs.student.rest.Rest;
import com.bs.student.service.StudentService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/grants")
public class GrantsController {

	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/{page}", method = RequestMethod.GET)
	public String page(@PathVariable("page") String page, ModelMap modelMap){
		
		modelMap.addAttribute("page", "grants");
		return page;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String list(Query query) throws JsonProcessingException{
		
		Map<String, Object> params = query.toMap();
		params.put("sort", "sum_sd");
		List<Student> stuList = studentService.getScoreDeduct(params);
		int count = studentService.getScoreDeductCount(params);
		
		Rest<Student> rest = new Rest<Student>(count, stuList);
		return rest.toJson();
	}
	
}
