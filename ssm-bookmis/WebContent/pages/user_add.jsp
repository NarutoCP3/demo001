<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link href="${pageContext.request.contextPath}/pages/css/mine.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	var addFlag = "${addFlag}";
	if(addFlag == "1"){
		alert("添加用户成功");
	}
	if(addFlag == "0"){
		alert("添加用户失败");
	}
</script>
</head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：用户管理-》添加用户</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="${pageContext.request.contextPath }/user/userList">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="${pageContext.request.contextPath}/user/add" method="post">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td>用户名</td>
                    <td><input type="text" name="userName" /></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td><input type="text" name="realName" /></td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td>
                        <select name="sex">
	                    	<option value="">请选择</option>
                            <c:forEach items="${sex }" var="val">
                            <option value="${val.value }">${val.desc }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>身份</td>
                    <td>
                        <select name="status">
	                        <option value="">请选择</option>
                            <c:forEach items="${status }" var="val">
                            <option value="${val.value }">${val.desc }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                 <tr>
                    <td>年级</td>
                    <td>
                        <select name="grade">
	                        <option value="">请选择</option>
                          	<c:forEach items="${grade }" var="val">
                            <option value="${val.value }">${val.desc }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                 <tr>
                    <td>班级</td>
                    <td>
                        <select name="classes">
                        	<option value="">请选择</option>
                          	<c:forEach items="${classes }" var="val">
                            <option value="${val.value }">${val.desc }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="添加">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>