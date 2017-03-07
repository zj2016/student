package com.bs.student.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.student.bean.Admin;
import com.bs.student.rest.RestResult;
import com.bs.student.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public RestResult login(String name, String password, HttpServletRequest request){
		
		Admin admin = adminService.login(name, password);
		
		if(admin == null){
			return RestResult.error("鐢ㄦ埛鍚嶅拰瀵嗙爜涓嶅尮閰�");
		}
		
		request.getSession().removeAttribute("_user");
		request.getSession().setAttribute("_admin", admin);
		
		return RestResult.success();
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute("_admin");
		return "login";
	}
	
}
