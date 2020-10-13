package com.mis.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mis.base.PageModel;
import com.mis.dictionary.domain.Dictionary;
import com.mis.user.dao.UserMapper;
import com.mis.user.domain.Users;
import com.mis.user.service.UserService;
import com.mis.utils.MD5Util;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	/**1
	 * MyBatis框架的操作sql,sql语句写在xml中，这个方法用来调用接口映射器方法
	 * @param user
	 * @return
	 */
	@Override
	public int login(Users user) {
		String password = MD5Util.encrypt(user.getPassword());//从user对象获取密码进行MD5密码加密
		user.setPassword(password);//再把加密后的密码set回去
		int count = userMapper.selectCountByUser(user);
		return count;
	}
	
	/**2
	 * MyBatis版本的分页查询用户
	 * @param user
	 * @param pageModel
	 * @return
	 */
	@Override
	public PageModel pageList(Users user,PageModel pageModel) {
		//分页查询，limit中第一个参数 从第几条开始（pageNum）
		Integer pageNum = (pageModel.getPageNum() - 1)*pageModel.getPageSize();
		//limit中，第二个参数 每页查询显示几条（pageSize）。
		Integer pageSize = pageModel.getPageSize();
		
		List<Map> list = userMapper.selectUsers(user.getStatus(), user.getUserName(), pageNum, pageSize);
		
		pageModel.list = list;
		/**
		 * 原来JDBC的分页查询，是把rs进行遍历，得到字段的值，放到Map集合中，Map的key是自己指定的，网页调用也是这些
		 * 例如map.put("realName", rs.getObject(4))，key是realName，值是real_name的值
		 * 
		 * 现在mybatis的分页查询，返回的集合泛型是Map，key都是查询结果的字段名，value是字段值，直接赋值给了pageModel中的list
		 * 例如map中的key是real_name，值是real_name的值
		 * 
		 * 这个key的差别必须解决，因为在页面展示数据的时候是根据key来获取值
		 * 解决方案:就是给mybatis版本的sql的相应查询字段的位置取别名
		 */
		int count = userMapper.selectCountByPages(user);
		
		int lastNum = count/pageModel.pageSize;
		//例如：10条数据，每页显示3条，三页余1条，所以总共要4页
		if(count % pageModel.pageSize != 0) {//没有整除
			lastNum = lastNum + 1;
		}
		pageModel.setLastNum(lastNum);
			
		return pageModel;//设置了pageModel对象的list和lastNum属性，返回pageModel对象
	}
	
	/**9
	 * MyBatis版本根据userName查询用户
	 */
	@Override
	public Users getUserByUserName(String username) {
		Users user = userMapper.selectUserByUserName(username);
		return user;
	}
	
	/**7
	 * Mybatis版本根据用户名查询该用户关联的角色
	 */
	@Override
	public String getUserRole(String username) {
		String roleCode = userMapper.selectRoleCodeByUsername(username);
		return roleCode;
	}
	
	/**
	 * MyBatis版本查询根据字段不同在数据字典中查询下拉的值和中文含义
	 * @param type
	 * @return
	 */
	@Override
	public List<Dictionary> getSelect(String type) {
		List<Dictionary> list = userMapper.selectDicByType(type);
		return list;
	}

	@Override
	public List<Map<String, Object>> getRoles() {
		List<Map<String, Object>> list = userMapper.getRoles();
		return list;
	}
	
	/**3
	 * MyBatis版本添加用户
	 */
	@Override
	public int add(Users user) {
		String password = MD5Util.encrypt(user.getPassword());
		user.setPassword(password);
		int count = userMapper.insertUser(user);
		return count;
	}
	
	/**4
	 * MyBatis版本根据id查询用户
	 */
	@Override
	public Users getUser(Integer id) {
		Users user = userMapper.selectUserById(id);
		return user;
	}
	
	/**5
	 * MyBatis版本修改用户
	 */
	@Override
	public int update(Users user) {
		int res = userMapper.updateUserById(user);
		return res;
	}
	
	/**6
	 * MyBatis版本删除用户
	 */
	@Override
	public int del(Integer id) {
		int res = userMapper.delUserById(id);
		return res;
	}
	
	/**8
	 * MyBatis版本给用户设置角色信息
	 */
	@Override
	public int addUserRole(String username,String role) {
		int res = 0;
		
		int count = userMapper.selectUserRoleCountByUsername(username);
		
		if(count > 0) {
			res = userMapper.updateUserRoleByUsername(role, username);
		}else if(count == 0) {
			res = userMapper.insertUserRole(role, username);
		}
		return res;
	}
}
