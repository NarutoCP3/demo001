<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>添加商品</title>
        <link href="${pageContext.request.contextPath}/pages/css/mine.css" type="text/css" rel="stylesheet">
  <script type="text/javascript">
	var updateFlag = "${updateFlag}";
	if(updateFlag == "1"){
		alert("修改图书成功");
	}
	if(updateFlag == "0"){
		alert("修改图书失败");
	}
</script> 
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：图书管理-》修改图书</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="${pageContext.request.contextPath }/book/bookList">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="${pageContext.request.contextPath}/book/update" method="post">
            <input type="hidden" name="book.id" value="${b.id }">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td>书名</td>
                    <td><input type="text" name="bookName" value="${b.bookName }"/></td>
                </tr>
                <tr>
                    <td>类别</td>
                    <td>
                        <select name="bookType">
                            <option value="">请选择</option>
                            <c:forEach items="${bookType }" var="val">
                            <option value="${val.value }" 
                            <c:if test="${b.bookType eq val.value }">selected="selected"</c:if>
                            >${val.desc }</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>作者</td>
                    <td><input type="text" name="author" value="${b.author }"/></td>
                </tr>
                <tr>
                    <td>出版日期</td>
                    <td><input type="text" name="publishDate" value="${b.publishDate }"/></td>
                </tr>
                 <tr>
                    <td>简介</td>
                    <td><textarea rows="6" cols="30" name="bookDesc">${b.bookDesc }</textarea></td>
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