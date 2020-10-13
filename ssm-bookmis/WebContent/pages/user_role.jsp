<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link href="${pageContext.request.contextPath}/pages/css/mine.css" type="text/css" rel="stylesheet">
<script type="text/javascript">

	var roleFlag = "${roleFlag}";
	if(roleFlag == "1"){
		alert("维护角色成功");
	}
	if(roleFlag == "0"){
		alert("维护角色失败");
	}
</script>
</head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：用户管理-》维护角色信息</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="${pageContext.request.contextPath }/user/userList">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="${pageContext.request.contextPath}/user/addUserRole" method="post">
           		<input type="hidden" name="userName" value="${u.userName }">
           		<input type="hidden" name="id" value="${u.id }">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td>用户名</td>
                    <td>${u.userName }</td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td>${u.realName }</td>
                </tr>
                <tr>
                    <td>角色</td>
                    <td>
                        <select name="role">
	                    	<option value="">请选择</option>
                            <c:forEach items="${roleList }" var="role">
                            <option value="${role.roleCode }" 
                            <c:if test="${roleCode eq role.roleCode }">
                            selected="selected"
                            </c:if>
                            >${role.roleName }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="维护角色">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>