package com.mis.base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mis.dictionary.domain.Dictionary;
/**
 * 将数据库的数据字典(用于做下拉列表的值value与描述desc)存放于内存，不用每次做下拉列表都去于数据库去连接查询
 * 用于在某一数据经常要去数据库中去查询，而且这个数据在数据库中基本不改变，像这种情况没必要每次使用都从数据库建立连接重复查询，
 * 最好是在项目启动时，把这些数据加载到缓存中，需要的时候直接拿，不走数据库
 * @author 源哥
 *	
 *	在spring中，要在加载容器后初始化数据，
 *  这个需要初始化数据的类要实现一个InitializingBean接口
 *  再重写里面的afterPropertiesSet方法
 */
import com.mis.user.service.UserService;
import com.mis.utils.JedisPoolUtil;
import com.mis.utils.SerializeUtil;

import redis.clients.jedis.Jedis;
@Component
public class CommonSelect implements InitializingBean{
	
	@Autowired
	UserService userService;
	
	public static List<Dictionary> sex = new ArrayList<Dictionary>();//性别
	public List<Dictionary> status = new ArrayList<Dictionary>();//身份
	public static List<Dictionary> grade = new ArrayList<Dictionary>();//年级
	public static List<Dictionary> classes = new ArrayList<Dictionary>();//班级
	public static List<Dictionary> bookType = new ArrayList<Dictionary>();//书的类别
	public static List<Map<String, Object>>  roles = new ArrayList<Map<String, Object>>();//角色

	/**
	 * 在容器加载bean之后就执行的方法(用于初始化)
	 */
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("初始化下拉列表");
		Jedis jedis = JedisPoolUtil.getJedis();
		
		sex = userService.getSelect("sex");
		
		status = userService.getSelect("status");
		
		grade = userService.getSelect("grade");

		classes = userService.getSelect("class");

		bookType = userService.getSelect("book_type");
		
		roles = userService.getRoles();
		
		/**
		 * 原始的初始化是使用static保存在内存中，
		 * 使用redis缓存时可将static去掉
		 */
		if(!jedis.exists("status".getBytes())) {//当不存在这个key才set创建，不然每次启动系统都set
			jedis.set("status".getBytes(), SerializeUtil.serialize(status));//序列化的类要实现序列化接口，这里是List的泛型Dictionary类
		}
	}
}
