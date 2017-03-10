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

import com.bs.student.bean.Course;
import com.bs.student.bean.Student;
import com.bs.student.query.Query;
import com.bs.student.rest.Rest;
import com.bs.student.rest.RestResult;
import com.bs.student.service.CourseService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseService courseService;
	
	@RequestMapping(value = "/{page}", method = RequestMethod.GET)
	public String page(@PathVariable("page") String page, String couId, ModelMap modelMap){
		if(StringUtils.isNotBlank(couId)){
			modelMap.addAttribute("course", courseService.get(couId));
		}
		modelMap.addAttribute("page", "course");
		return page;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String list(Query query) throws JsonProcessingException{
		
		Map<String, Object> params = query.toMap();
		List<Course> stuList = courseService.getList(params);
		int count = courseService.getCount(params);
		
		Rest<Course> rest = new Rest<Course>(count, stuList);
		return rest.toJson();
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public RestResult edit(Course course, ModelMap modelMap){
		
		int result = 0;
		if(StringUtils.isNotBlank(course.getCouId())){
			result = courseService.update(course);
		}else{
			result = courseService.add(course);
		}
		if(result > 0){
			return RestResult.success().setInfo("成功");
		}
		
		return RestResult.error("失败");
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	@ResponseBody
	public RestResult remove(String couId, ModelMap map){
		int result = courseService.remove(couId);
		if(result > 0){
			return RestResult.success();
		}
		return RestResult.error("失败");
	}
	
}
