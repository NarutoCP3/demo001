<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>添加商品</title>
        <link href="${pageContext.request.contextPath }/pages/css/mine.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	var addFlag = "${addFlag}";
	if(addFlag == "1"){
		alert("添加图书成功");
	}
	if(addFlag == "0"){
		alert("添加图书失败");
	}
</script> 
<head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：图书管理-》添加图书</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="${pageContext.request.contextPath}/book/bookList">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="${pageContext.request.contextPath}/book/add" method="post">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td>书名</td>
                    <td><input type="text" name="bookName" /></td>
                </tr>
                <tr>
                    <td>类别</td>
                    <td>
                        <select name="bookType">
                            <option>请选择</option>
                            <c:forEach items="${book_type }" var="val">
                            <option value="${val.value }">${val.desc }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>作者</td>
                    <td><input type="text" name="author" /></td>
                </tr>
                <tr>
                    <td>出版日期</td>
                    <td><input type="text" name="publishDate" /></td>
                </tr>
                 <tr>
                    <td>简介</td>
                    <td><textarea rows="6" cols="30" name="bookDesc"></textarea></td>
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