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

import com.bs.student.bean.Marks;
import com.bs.student.query.MarkQuery;
import com.bs.student.rest.Rest;
import com.bs.student.rest.RestResult;
import com.bs.student.service.MarksService;
import com.bs.student.service.StudentService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/mark")
public class MarkController {

	@Autowired
	private MarksService markService;
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/{page}", method = RequestMethod.GET)
	public String page(@PathVariable("page") String page, String stuId, ModelMap modelMap){
		if(StringUtils.isNotBlank(stuId)){
			modelMap.addAttribute("student", studentService.get(stuId));
		}
		modelMap.addAttribute("page", "mark");
		return page;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String list(MarkQuery query) throws JsonProcessingException{
		
		Map<String, Object> params = query.toMap();
		List<Marks> stuList = markService.getList(params);
		int count = markService.getCount(params);
		
		Rest<Marks> rest = new Rest<Marks>(count, stuList);
		return rest.toJson();
	}
	
	@RequestMapping(value = "/edit/ad", method = RequestMethod.POST)
	@ResponseBody
	public RestResult edit(Marks mark, ModelMap modelMap){
		
		int result = 0;
		if(StringUtils.isNotBlank(mark.getMarkId())){
			result = markService.update(mark);
		}else{
			result = markService.add(mark);
		}
		if(result > 0){
			return RestResult.success().setInfo("成功");
		}
		
		return RestResult.error("失败");
	}
	
	@RequestMapping(value = "/remove/ad", method = RequestMethod.GET)
	@ResponseBody
	public RestResult remove(String markId, ModelMap map){
		int result = markService.remove(markId);
		if(result > 0){
			return RestResult.success();
		}
		return RestResult.error("失败");
	}
	
	@RequestMapping(value = "/add/ad", method = RequestMethod.POST)
	@ResponseBody
	public RestResult add(Marks mark, int type){
		mark.setDeduct(mark.getDeduct() * type);
		int result = markService.add(mark);
		if(result > 0){
			return RestResult.success().setInfo("添加成功");
		}
		return RestResult.error("添加失败，请重试");
	}
}
