package com.mis.user.service;

import java.util.List;
import java.util.Map;

import com.mis.base.PageModel;
import com.mis.dictionary.domain.Dictionary;
import com.mis.user.domain.Users;

public interface UserService {
	public int login(Users user);
	public PageModel pageList(Users user,PageModel pageModel);
	public Users getUserByUserName(String username);
	public String getUserRole(String username);
	public List<Dictionary> getSelect(String type);
	public List<Map<String, Object>> getRoles();
	public int add(Users user);
	public Users getUser(Integer id);
	public int update(Users user);
	public int del(Integer id);
	public int addUserRole(String username,String role);
}
