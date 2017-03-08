package com.bs.student.dao;

import org.apache.ibatis.annotations.Param;

import com.bs.student.bean.Admin;

public interface AdminMapper extends BaseMapper<Admin>{
   
    Admin selectBy(@Param("name") String name, @Param("password") String password);
}