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
@RequestMapping("/burse")
public class BurseController {

	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/{page}", method = RequestMethod.GET)
	public String page(@PathVariable("page") String page, ModelMap modelMap){
		modelMap.addAttribute("classList", studentService.getClassList());
		modelMap.addAttribute("page", "burse");
		return page;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String list(Query query, String clazz) throws JsonProcessingException{
		
		Map<String, Object> params = query.toMap();
		params.put("clazz",clazz);
		params.put("sort", "sum_score");
		List<Student> stuList = studentService.getScoreDeduct(params);
		int count = studentService.getScoreDeductCount(params);
		
		Rest<Student> rest = new Rest<Student>(count, stuList);
		return rest.toJson();
	}
	
	
	@RequestMapping(value = "/listLZ",method = RequestMethod.GET)
	@ResponseBody
	public String listLZ() throws JsonProcessingException{
		
		List<Student> stuList = studentService.getLZ();
		Rest<Student> rest = new Rest<Student>(stuList.size(), stuList);
		return rest.toJson();
	}
	
}
