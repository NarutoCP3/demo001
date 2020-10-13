package com.mis.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * 通过连接池获取Jedis对象
 * @author 源哥
 *
 */
public class JedisPoolUtil {
	//创建连接池的配置信息对象
	private static JedisPoolConfig config = new JedisPoolConfig();
	//创建连接池对象,参数一连接池配置，参数二redis所在机器的ip或域名，参数三redis端口号
	private static JedisPool pool = new JedisPool(config, "MyCentOS", 6379);
	
	static {
		config.setMaxTotal(30);//设置最大连接数
		config.setMaxIdle(10);//设置最大空闲连接数(当没人使用时的最大连接，等待获取)
		config.setMaxWaitMillis(2000);//设置获取连接的最大等待时间，默认-1不超时(ms)超时抛异常
		config.setTestOnBorrow(false);//设置获取连接时是否测试有效性，默认false
		config.setTestOnReturn(false);//设置获取返回结果时是否测试有效性，默认false
	}
	
	public static Jedis getJedis() {
		//通过Jedis连接池getResource()获取Jedis对象
		Jedis jedis = pool.getResource();
		//redis认证，如果有必要
		jedis.auth("111111");
		return jedis;
	}
}
