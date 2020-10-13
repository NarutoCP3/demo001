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
	function pageList(num){
		document.getElementById("pageNum").value = num;
		
		document.getElementById("f0").submit();
	}

	var delFlag = "${delFlag}";
	if(delFlag == "1"){
		alert("删除图书成功");
	}
	if(delFlag == "0"){
		alert("删除图书失败");
	}
</script>    
</head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：图书管理-》图书列表</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="${pageContext.request.contextPath}/book/addPage">【添加图书】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <form  id="f0" action="${pageContext.request.contextPath }/book/bookList" method="post">
	            <span>
                    类别：<select name="bookType" style="width: 100px;">
                            <option value="">请选择</option>
                            <c:forEach items="${book_type }" var="val">
                            <option value="${val.value }"
                             <c:if test="${book.bookType eq val.value }">
					          selected="selected"
					         </c:if>
                            >${val.desc }</option>
                            </c:forEach>
                    </select>
                    书名：<input type="text" name="bookName" value="${book.bookName }"/>
                    作者：<input type="text" name="author" value="${book.author }"/>
          <input type="hidden" name="pageNum" id="pageNum">
                    <input value="查询" type="submit" />
	            </span>
            </form>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td>序号</td>
                        <td>类别</td>
                        <td>书名</td>
                        <td>作者</td>
                        <td>出版日期</td>
                        <td align="center">操作</td>
                    </tr>
                    <c:forEach items="${pageModel.list }" var="book">
                   		 <tr>
                        <td>${book.id }</td>
                        <td>${book.typeval }</td>
                        <td><a href="javascript:void(0);" onclick="window.open('${pageContext.request.contextPath }/book/bookInfo?id=${book.id }')">${book.bookName }</a></td>
                        <td>${book.author }</td>
                        <td>${book.publishDate }</td>
                        <td>
	                        <a href="${pageContext.request.contextPath }/book/toUpdatePage?id=${book.id }">修改</a>
	                        <a href="${pageContext.request.contextPath }/book/del?id=${book.id }">删除</a>
                        </td>
	                    </tr>
                    </c:forEach>
                        <td colspan="20" style="text-align: right;">
                          	  <%@include file="common_page.jsp" %> 
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>