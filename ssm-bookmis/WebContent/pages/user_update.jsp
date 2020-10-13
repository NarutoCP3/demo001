<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
        <title>添加商品</title>
        <link href="${pageContext.request.contextPath }/pages/css/mine.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	var updateFlag = "${updateFlag}";
	if(updateFlag == "1"){
		updateFlag("修改用户成功");
	}
	if(updateFlag == "0"){
		updateFlag("修改用户失败");
	}
</script>  
</head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：用户管理-》修改用户</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="${pageContext.request.contextPath }/user/userList">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="${pageContext.request.contextPath}/user/update" method="post">
           	<!-- 提交的时候user对象接收不到id的值，但是id有值（在getUser方法中传进去了），会报错，
           	把这个不用提交的值写在（隐藏域）input框，type="hidden" -->
           	<input type="hidden" name="id" value="${u.id }">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td>用户名</td>
                    <td><input type="text" name="userName" value="${u.userName }"/></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input type="password" name="password" value="${u.password }"/></td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td><input type="text" name="realName" value="${u.realName }"/></td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td>
                        <select name="sex">
	                    	<option value="">请选择</option>
                           <c:forEach items="${sex }" var="val">
                            <option value="${val.value }" 
                            <c:if test="${u.sex eq val.value}">
                            selected="selected"
                            </c:if>
                            >${val.desc }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>身份</td>
                    <td>
                        <select name="status">
	                        <option value="">请选择</option>
	                        	<!-- 默认选中，不过要在c:if标签中判断，
                            	当前传过来的u这个Users对象中的某个变量的值是否能匹配当前option的value值，
                            	匹配上了，就默认选中当前option标签括起来的显示的东西 -->
                            <c:forEach items="${status }" var="val">
                            <option value="${val.value }" 
                            <c:if test="${u.status eq val.value}">selected="selected"</c:if>
                            >${val.desc }</option>
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
                            <option value="${val.value }" 
                            <c:if test="${u.grade eq val.value}">selected="selected"</c:if>
                            >${val.desc }</option>
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
                            <option value="${val.value }" 
                             <c:if test="${u.classes eq val.value}">selected="selected"</c:if>
                            >${val.desc }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="修改">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>