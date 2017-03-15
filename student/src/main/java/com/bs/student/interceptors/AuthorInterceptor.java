package com.bs.student.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bs.student.bean.Admin;
import com.bs.student.bean.Student;
import com.bs.student.rest.RestResult;


public class AuthorInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Admin admin = (Admin) request.getSession().getAttribute("_admin");
		if(admin != null){
			return true;
		}
		
		Student student = (Student) request.getSession().getAttribute("_student");
		if(student != null){
			//是否含有ad标致
			String path = request.getServletPath();
			if(path.contains("/ad")){
				response.getWriter().write("权限不够");
				return false;
			}
			return true;
		}
		
		response.sendRedirect("/student/index");
		return false;
	}
	
}
