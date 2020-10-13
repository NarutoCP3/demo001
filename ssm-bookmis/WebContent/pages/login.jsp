<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>

<link href="${pageContext.request.contextPath }/pages/css/login.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	var count = "${loginFlag}";
	if(count == "0"){
		alert("用户名或密码输入错误");
	}

	function subForm(){
		document.getElementById("f0").submit();
	}
</script>
</head>
<body id="userlogin_body">

<div id="user_login">
	<dl>
		<dd id="user_top">
			<ul>
				<li class="user_top_l"></li>
				<li class="user_top_c"></li>
				<li class="user_top_r"></li>
			</ul>
		</dd>
		<dd id="user_main">
			<ul>
				<li class="user_main_l"></li>
				<li class="user_main_c">
				<form id="f0" action="${pageContext.request.contextPath }/user/login" method="post">
					<div class="user_main_box">
						<ul>
							<li class="user_main_text">用户名： </li>
							<li class="user_main_input"><input name="userName" maxlength="20" id="TxtUserName" class="txtusernamecssclass"> </li>
						</ul>
						<ul>
							<li class="user_main_text">密 码： </li>
							<li class="user_main_input"><input type="password" name="password" id="TxtPassword" class="txtpasswordcssclass"> </li>
						</ul>
					</div>
				</form>
				</li>
				<li class="user_main_r"><input type="image" name="IbtnEnter" src="${pageContext.request.contextPath }/pages/img/user_botton.gif" class="ibtnentercssclass" onclick="subForm();"></li>
			</ul>
		</dd>
		<dd id="user_bottom">
			<ul>
				<li class="user_bottom_l"></li>
				<li class="user_bottom_c"></li>
				<li class="user_bottom_r"></li>
			</ul>
		</dd>
	</dl>
</div>


</body>
</html>