package com.mis.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mis.base.CommonSelect;
import com.mis.base.PageModel;
import com.mis.dictionary.domain.Dictionary;
import com.mis.user.domain.Users;
import com.mis.user.service.UserService;
import com.mis.utils.JedisPoolUtil;
import com.mis.utils.SerializeUtil;

import redis.clients.jedis.Jedis;

@Controller
@RequestMapping("user")
public class UserController {
	
	/*
	 * @Autowired注解，spring自动寻找接口类型的实现类的bean注入
	 */
	@Autowired
	UserService userService;
	
	@Autowired
	HttpServletRequest request;
	
	Jedis jedis = JedisPoolUtil.getJedis();
	
	/**
	 * 跳转登录页
	 */
	@RequestMapping("loginPage")
	public String loginPage(Integer loginFlag) {
		System.out.println("ssm框架的跳转登录页");
		//用springMVC给页面传递参数要在值放在域对象中
		request.setAttribute("loginFlag", loginFlag);
		
		return "login";
	}
	
	/**
	 * 登录功能
	 */
	@RequestMapping("login")
	public String login(Users user) {
		System.out.println(user.getUserName());
		System.out.println(user.getPassword());
		
		int count = userService.login(user);//ssm版本的登录查询
		
		if(count > 0) {//登陆成功
			System.out.println("登录成功");
			
			Users fullUser = userService.getUserByUserName(user.getUserName());
			//登陆成功，把用户对象存到session,再在BorrowAction从session取到这个Attribute，就能搞出登录的对象的信息
			request.getSession().setAttribute("currentUser", fullUser);
			
			//将roleCode放在会话中，在页面左侧栏配置c:if标签
			String roleCode = userService.getUserRole(user.getUserName());
			request.getSession().setAttribute("roleCode", roleCode);
			
//			//设置当前时间,再放到Session中在jsp中用EL表达式获取(也可以直接用fmt标签)
//			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String currentTime = df.format(new Date());
//			request.getSession().setAttribute("currentTime", currentTime);
//			session.put("currentTime", currentTime);
			
			return "redirect:/user/index";//跳过视图解析器
			
		}else {
			System.out.println("登录失败");
			return "redirect:/user/loginPage?loginFlag=0";
		}
	}
	
	/**
	 * 登录成功跳转首页
	 */
	@RequestMapping("index")
	public String index() {
		
		return "index";
	}
	
	/**
	 * 查看用户列表
	 */
	@RequestMapping("userList")
	public String userList(Users user,Integer pageNum,Integer deleteFlag) {
		
		PageModel pageModel = new PageModel();
		
		if(pageNum != null) {
			pageModel.setPageNum(pageNum);
		}
		
		pageModel = userService.pageList(user, pageModel);//ssm版本的分页查询
		
		request.setAttribute("user", user);
//		request.setAttribute("status", CommonSelect.status);
		request.setAttribute("status", (List<Dictionary>)SerializeUtil.unserialize(jedis.get("status".getBytes())));
		
		request.setAttribute("pageModel", pageModel);
		
		request.setAttribute("deleteFlag", deleteFlag);
		
		return "user_list";
	}
	
	/**
	 * 跳转到用户添加页面
	 */
	@RequestMapping("addPage")
	public String addPage(Integer addFlag) {
		
		request.setAttribute("sex",	CommonSelect.sex);
//		request.setAttribute("status", CommonSelect.status);
		request.setAttribute("status", (List<Dictionary>)SerializeUtil.unserialize(jedis.get("status".getBytes())));
		request.setAttribute("grade", CommonSelect.grade);
		request.setAttribute("classes", CommonSelect.classes);//查数据库的class字段
		
		request.setAttribute("addFlag", addFlag);
		return "user_add";
	}
	
	/**
	 * 添加用户
	 */
	@RequestMapping("add")
	public String add(Users user) {
		int res = userService.add(user);
		
		return "redirect:/user/addPage?addFlag=" + res;
	}
	
	/**
	 * 跳转修改用户页面
	 */
	@RequestMapping("toUpdatePage")
	public String toUpdatePage(Integer id,Integer updateFlag) {
		
		Users u = userService.getUser(id);
		request.setAttribute("u", u);
		
		request.setAttribute("sex",	CommonSelect.sex);
//		request.setAttribute("status", CommonSelect.status);
		request.setAttribute("status", (List<Dictionary>)SerializeUtil.unserialize(jedis.get("status".getBytes())));
		request.setAttribute("grade", CommonSelect.grade);
		request.setAttribute("classes", CommonSelect.classes);
		
		request.setAttribute("updateFlag", updateFlag);
		
		return "user_update";
	}
	
	/**
	 * 修改用户
	 */
	@RequestMapping("update")
	public String update(Users user) {
		int res = userService.update(user);
		
		return "redirect:/user/toUpdatePage?updateFlag=" + res + "&id=" + user.getId();
	}
	
	/**
	 * 删除用户
	 */
	@RequestMapping("del")
	public String del(Integer id) {
		int res = userService.del(id);
		
		return "redirect:/user/userList?deleteFlag=" + res;
	}
	
	/**
	 * 跳转维护角色的页面
	 */
	@RequestMapping("rolePage")
	public String rolePage(Integer id,String userName,Integer roleFlag) {
		request.setAttribute("roleFlag", roleFlag);
		
		request.setAttribute("u", userService.getUser(id));
		
		request.setAttribute("roleList", CommonSelect.roles);//角色表的所有角色 1是管理员，2是普通用户
		
		request.setAttribute("roleCode", userService.getUserRole(userName));
		
		return "user_role";
	}
	
	/**
	 * 给用户添加角色信息
	 */
	@RequestMapping("addUserRole")
	public String addUserRole(Users user,String role) {
		
		request.setAttribute("roleCode", userService.getUserRole(user.getUserName()));
		
		int res = userService.addUserRole(user.getUserName(), role);
		
		return "redirect:/user/rolePage?roleFlag=" + res + "&id=" + user.getId();
	}
}
