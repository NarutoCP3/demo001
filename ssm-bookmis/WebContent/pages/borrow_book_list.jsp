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
	
	var borrowFlag = "${borrowFlag}";
	if(borrowFlag == "1"){
		alert("借阅成功");
	}
	if(borrowFlag == "0"){
		alert("借阅失败");
	}
</script>    
</head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：图书借阅-》图书列表</span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form  id="f0" action="${pageContext.request.contextPath }/borrow/bookList" method="post">
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
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td>序号</td>
                        <td>类别</td>
                        <td>书名</td>
                        <td>作者</td>
                        <td>出版日期</td>
                        <td>是否可借阅</td>
                        <td>借阅人</td>
                        <td>借出时间</td>
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
                        	<c:if test="${book.bbid eq null }">是</c:if>
                        	<c:if test="${!(book.bbid eq null) }">否</c:if>
                        </td>
                        <td>${book.borrower }</td>
                        <td>${book.borrowDate }</td>
                        <td>
                        	<c:if test="${book.bbid eq null }">
	                       		<a href="${pageContext.request.contextPath }/borrow/borrow?bookId=${book.id}">借阅</a>
	                        </c:if>
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