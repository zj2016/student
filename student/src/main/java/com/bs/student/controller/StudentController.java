package com.bs.student.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
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
import com.bs.student.rest.RestResult;
import com.bs.student.service.StudentService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/{page}", method = RequestMethod.GET)
	public String page(@PathVariable("page") String page, String stuId, ModelMap modelMap){
		if(StringUtils.isNotBlank(stuId)){
			modelMap.addAttribute("student", studentService.get(stuId));
		}
		modelMap.addAttribute("page", "student");
		return page;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String list(Query query) throws JsonProcessingException{
		
		Map<String, Object> params = query.toMap();
		List<Student> stuList = studentService.getList(params);
		int count = studentService.getCount(params);
		
		Rest<Student> rest = new Rest<Student>(count, stuList);
		return rest.toJson();
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public RestResult edit(Student student, ModelMap modelMap){
		
		int result = 0;
		if(student.getId() != null){
			result = studentService.update(student);
		}else{
			Student stu = studentService.get(student.getStuId());
			if(stu != null){
				return RestResult.error("学号已经存在");
			}
			result = studentService.add(student);
		}
		if(result > 0){
			return RestResult.success().setInfo("成功");
		}
		
		return RestResult.error("失败");
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	@ResponseBody
	public RestResult remove(String stuId, ModelMap map){
		int result = studentService.remove(stuId);
		if(result > 0){
			return RestResult.success();
		}
		return RestResult.error("失败");
	}
}
