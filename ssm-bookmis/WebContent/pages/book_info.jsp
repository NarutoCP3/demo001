<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>图书详情</title>
        <link href="${pageContext.request.contextPath }/pages/css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：图书管理-》图书详情</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="javascript:void(0);" onclick="window.close();">【关闭】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td style="width: 15%">书名</td>
                    <td style="width: 85%">${bookInfo.bookName }</td>
                </tr>
                <tr>
                    <td>类别</td>
                    <td>${bookInfo.typeval }</td>
                </tr>
                <tr>
                    <td>作者</td>
                    <td>${bookInfo.author }</td>
                </tr>
                <tr>
                    <td>出版日期</td>
                    <td>${bookInfo.publishDate }</td>
                </tr>
                 <tr>
                    <td>简介</td>
                    <td>
						${bookInfo.bookDesc }
					</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button" value="关闭" onclick="window.close();">
                    </td>
                </tr>  
            </table>
        </div>
    </body>
</html>