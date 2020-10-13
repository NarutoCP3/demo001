package com.mis.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mis.dictionary.domain.Dictionary;
import com.mis.user.domain.UserRole;
import com.mis.user.domain.Users;

@Repository
public interface UserMapper {
	public Integer selectCountByUser(Users user);
	
	public List<Map> selectUsers(@Param("status")String status,
			@Param("userName")String userName,
			@Param("pageNum")Integer pageNum,
			@Param("pageSize")Integer pageSize);
	
	public Integer selectCountByPages(Users user);
	
	public Integer insertUser(Users user);
	
	public Users selectUserById(Integer id);
	
	public Integer updateUserById(Users user);
	
	public Integer delUserById(Integer id);
	
	public Integer selectUserRoleCountByUsername(String username);
	
	public Integer updateUserRoleByUsername(@Param("role")String role,@Param("username")String username);
	
	public Integer insertUserRole(@Param("role")String role,@Param("username")String username);
	
	public String selectRoleCodeByUsername(String username);
	
	public Users selectUserByUserName(String username);
	
	public List<Dictionary> selectDicByType(String type);
	
	public List<Map<String, Object>> getRoles();
}
