package com.bs.student.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bs.student.bean.Admin;


public class AuthorInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Admin admin = (Admin) request.getSession().getAttribute("_admin");
		if(admin != null){
			return true;
		}
		
		response.sendRedirect("/index");
		return false;
	}
	
}
