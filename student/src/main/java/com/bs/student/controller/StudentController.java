package com.bs.student.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.student.bean.Admin;
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
	
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public String reset(String stuId, ModelMap modelMap){
		if(StringUtils.isNotBlank(stuId)){
			modelMap.addAttribute("student", studentService.get(stuId));
		}
		modelMap.addAttribute("page", "reset");
		return "student_reset";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String list(Query query, String stuId) throws JsonProcessingException{
		
		Map<String, Object> params = query.toMap();
		params.put("stuId", StringUtils.isBlank(stuId) ? null : stuId);
		List<Student> stuList = studentService.getList(params);
		int count = studentService.getCount(params);
		
		Rest<Student> rest = new Rest<Student>(count, stuList);
		return rest.toJson();
	}
	
	@RequestMapping(value = {"/edit/ad","/edit"}, method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/remove/ad", method = RequestMethod.GET)
	@ResponseBody
	public RestResult remove(String stuId, ModelMap map){
		int result = studentService.remove(stuId);
		if(result > 0){
			return RestResult.success();
		}
		return RestResult.error("失败");
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public RestResult login(Query query, String name, String password, HttpServletRequest request){
		
		Map<String, Object> params = query.toMap();
		params.put("stuId", name);
		params.put("password", password);
		List<Student> list = studentService.getList(params);
		if(list.size() <= 0){
			return RestResult.error("用户名密码不匹配");
		}
		request.getSession().setAttribute("_student", list.get(0));
		
		return RestResult.success();
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute("_student");
		return "redirect:/index";
	}
}
