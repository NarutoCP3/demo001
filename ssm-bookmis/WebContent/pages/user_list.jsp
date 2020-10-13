<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <title></title>

        <link href="${pageContext.request.contextPath}/pages/css/mine.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	var deleteFlag = "${deleteFlag}";
	if(deleteFlag == "1"){
		alert("删除用户成功");
	}
	if(deleteFlag == "0"){
		alert("删除用户失败");
	}

	//onclick="pageList(1)"
	//onclick="pageList(${pageModel.pageNum-1})"
	//onclick="pageList(${pageModel.pageNum+1})"
	//onclick="pageList(${pageModel.lastNum})"
	function pageList(num){
		document.getElementById("pageNum").value = num;
		
		document.getElementById("f0").submit();
	}
</script>
</head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：用户管理-》用户列表</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="${pageContext.request.contextPath }/user/addPage">【添加用户】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
           <form id="f0" action="${pageContext.request.contextPath }/user/userList" method="post">
           		 <span>
                    身份：<select name="status" style="width: 100px;">
		       <option value="">请选择</option>
	           <c:forEach items="${status }" var="val">
	           <option value="${val.value }" 
	           <c:if test="${user.status eq val.value }">
	           selected="selected"
	           </c:if>
	           >${val.desc }</option>
	           </c:forEach>
           </select>
                    姓名：<input type="text" name="userName" value="${user.userName }"/>
                    <input value="查询" type="submit" />
            </span>

            <input type="hidden" name="pageNum" id="pageNum">
           </form>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td>序号</td>
                        <td>用户名</td>
                        <td>身份</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>班级</td>
                        <td align="center">操作</td>
                    </tr>
                    <c:forEach items="${pageModel.list }" var="user">
	                    <tr>
	                        <td>${user.id }</td>
	                        <td>${user.username }</td>
	                        <td>${user.statusval }</td>
	                        <td>${user.realName }</td>
	                        <td>${user.sexval }</td>
	                        <td>${user.classes }</td>
	                        <td>
		                        <a href="${pageContext.request.contextPath }/user/toUpdatePage?id=${user.id}">修改</a>
		                        <a href="${pageContext.request.contextPath }/user/del?id=${user.id}">删除</a>
		                        <a href="${pageContext.request.contextPath }/user/rolePage?id=${user.id}&userName=${user.username}">维护角色</a>
	                        </td>
	                    </tr>
                    </c:forEach>
                    <tr>
                       <td colspan="20" style="text-align: right;">
                          	  <%@include file="common_page.jsp" %> 
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>