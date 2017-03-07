package com.bs.student.utils;

import java.io.UnsupportedEncodingException;

import org.springframework.util.DigestUtils;

public class CodeUtils {

	/**
	 * md5加密
	 * @param value
	 * @return
	 */
	public static String hexMD5(String value) {
		String mysign = value;

		try {
			mysign = DigestUtils.md5DigestAsHex(value.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mysign;
	}
	
	public static void main(String[] args) {
		String str = "123456";
		System.out.println(hexMD5(str));
	}
}
