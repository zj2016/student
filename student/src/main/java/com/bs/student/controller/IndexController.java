package com.bs.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping
public class IndexController {

	@RequestMapping("/{page}")
	public String page(@PathVariable("page") String page,ModelMap modelMap){
		return page;
	}
	
}
