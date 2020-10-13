package com.mis.utils;

import java.security.MessageDigest;
/**
 * MD5密码加密工具类
 * @author lby
 *
 */
public class MD5Util  {
	private static final String slat = "&%5123***&&%%$$#@";
	public static String encrypt(String dataStr) {
		try {
			dataStr = dataStr + slat;
			MessageDigest m = MessageDigest.getInstance("MD5");
			m.update(dataStr.getBytes("UTF8"));
			byte s[] = m.digest();
			String result = "";
			for (int i = 0; i < s.length; i++) {
				result += Integer.toHexString((0x000000FF & s[i]) | 0xFFFFFF00).substring(6);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}
	
	public static void main(String[] args) {
		String s = "admin";
		System.out.println(encrypt(s));
	}
}
