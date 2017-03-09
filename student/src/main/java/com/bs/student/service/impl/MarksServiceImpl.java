package com.bs.student.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.student.bean.Marks;
import com.bs.student.dao.MarksMapper;
import com.bs.student.service.MarksService;
import com.bs.student.utils.IdUtils;

@Service
public class MarksServiceImpl implements MarksService{

	@Autowired
	private MarksMapper markMapper;
	
	public int add(Marks t) {
		t.setMarkId(IdUtils.id());
		return markMapper.insert(t);
	}

	public int update(Marks t) {
		return markMapper.update(t);
	}

	public int remove(String id) {
		return markMapper.delete(id);
	}

	public Marks get(String id) {
		return markMapper.select(id);
	}

	public List<Marks> getList(Map<String, Object> params) {
		return markMapper.selectList(params);
	}

	public int getCount(Map<String, Object> params) {
		return markMapper.selectCount(params);
	}

}
