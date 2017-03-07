package com.bs.student.dao;

import org.apache.ibatis.annotations.Param;

import com.bs.student.bean.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
    
    Admin selectBy(@Param("name") String name, @Param("password") String password);
}