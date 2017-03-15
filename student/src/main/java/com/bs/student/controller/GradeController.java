package com.bs.student.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.student.bean.Grade;
import com.bs.student.query.GradeQuery;
import com.bs.student.query.Query;
import com.bs.student.rest.Rest;
import com.bs.student.rest.RestResult;
import com.bs.student.service.CourseService;
import com.bs.student.service.GradeService;
import com.bs.student.service.StudentService;
import com.bs.student.utils.IdUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/grade")
public class GradeController {

	@Autowired
	private GradeService gradeService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping(value = "/{page}", method = RequestMethod.GET)
	public String page(@PathVariable("page") String page, String stuId, ModelMap modelMap){
		if(StringUtils.isNotBlank(stuId)){
			Query query = new Query();
			query.setLimit(1000);
			modelMap.addAttribute("courseList", courseService.getList(query.toMap()));
			modelMap.addAttribute("student", studentService.get(stuId));
		}
		modelMap.addAttribute("page", "grade");
		return page;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String list(GradeQuery query) throws JsonProcessingException{
		
		Map<String, Object> params = query.toMap();
		List<Grade> stuList = gradeService.getList(params);
		int count = gradeService.getCount(params);
		
		Rest<Grade> rest = new Rest<Grade>(count, stuList);
		return rest.toJson();
	}
	
	@RequestMapping(value = "/update/ad", method = RequestMethod.POST)
	@ResponseBody
	public RestResult edit(Grade grade, ModelMap modelMap){
		
		int result = gradeService.update(grade);
		if(result > 0){
			return RestResult.success().setInfo("成功");
		}
		
		return RestResult.error("失败");
	}
	
	@RequestMapping(value = "/batch/ad", method = RequestMethod.POST)
	@ResponseBody
	public RestResult batchAdd(@RequestBody String json) throws JsonProcessingException, IOException{
		
		List<Grade> gradeList = new ArrayList<Grade>();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readTree(json);
		Iterator<JsonNode> iterator = node.elements();
		while(iterator.hasNext()){
			JsonNode jsonNode = iterator.next();
			Grade grade = new Grade();
			grade.setStuId(jsonNode.get("stuId").asText());
			grade.setCouId(jsonNode.get("couId").asText());
			grade.setScore(jsonNode.get("score").asInt(0));
			grade.setGradeId(IdUtils.id());
			gradeList.add(grade);
		}
		
		int result = gradeService.batchAdd(gradeList);
		if(result > 0){
			return RestResult.success().setInfo("成功录入  " + result + " 条成绩记录");
		}
		return RestResult.error("录入成绩失败");
		
	}
	
}
