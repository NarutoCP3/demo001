package com.mis.base;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

/**
 * SpringMVC拦截器做访问限制
 * @author 源哥
 *
 */
public class CommonInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//从session从拿到user(此时登录的用户)
		Object user = request.getSession().getAttribute("currentUser");
		
		//获取url,判断有没有包含login
		String url = request.getRequestURL().toString();
		
	   /* user==null，就是session中没有存到user对象，也就是没有登录
		* 并且url链接中不包含login，跳转登录页(访问登录页的controller)，不能访问其他功能
		* 
		* springMVC拦截器对于已经配置成静态资源的部分也会拦截
		* 因为静态资源都在pages文件夹中，所以url链接不包含/pages/，就是把静态资源也剔除
		* 如果没有配置这条件，一访问图片或者css文件，都给跳转登录页了
		*/
		if(user == null && !url.contains("login") && !url.contains("/pages/")) {
			request.getRequestDispatcher("/user/loginPage").forward(request, response);
		}
		
		return true;
	}
}
