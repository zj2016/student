package com.bs.student.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.student.bean.Admin;
import com.bs.student.dao.AdminMapper;
import com.bs.student.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;

	public Admin login(String name, String password) {
		return adminMapper.selectBy(name, password);
	}

}
