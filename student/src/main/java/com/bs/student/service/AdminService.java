package com.bs.student.service;

import com.bs.student.bean.Admin;

public interface AdminService {

	Admin login(String name, String password);
	
}
