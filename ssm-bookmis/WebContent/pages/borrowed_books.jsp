<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <title></title>

        <link href="${pageContext.request.contextPath }/pages/css/mine.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	function pageList(num){
		document.getElementById("pageNum").value = num;
		
		document.getElementById("f0").submit();
	}
	
	var returnFlag = "${returnFlag}";
	if(returnFlag == "1"){
		alert("还书成功");
	}
	if(returnFlag == "0"){
		alert("还书失败");
	}
</script>  
</head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：图书借阅-》归还图书</span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <form  id="f0" action="${pageContext.request.contextPath }/borrow/borrowedBooks" method="post">
	            <span>
          			<input type="hidden" name="pageNum" id="pageNum">
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
                        <td>借阅人</td>
                        <td>借出时间</td>
                        <td align="center">操作</td>
                    </tr>
                    <c:forEach items="${pageModel.list }" var="borrowBook">
                    <tr>
                        <td>${borrowBook.id }</td>
                        <td>${borrowBook.typeval }</td>
                        <td><a href="javascript:void(0);" onclick="window.open('${pageContext.request.contextPath }/book/bookInfo?id=${borrowBook.id }')">${borrowBook.bookName }</a></td>
                        <td>${borrowBook.author }</td>
                        <td>${borrowBook.publishDate }</td>
                        <td>${borrowBook.realName }</td>
                        <td>${borrowBook.borrowDate }</td>
                        <td>
	                        <a href="${pageContext.request.contextPath }/borrow/returnBook?bbid=${borrowBook.bbid }">归还</a>
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