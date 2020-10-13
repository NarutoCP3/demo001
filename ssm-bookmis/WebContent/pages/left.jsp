<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link href="css/admin.css" type="text/css" rel="stylesheet" />
        <script language=javascript>
            function expand(el)
            {
                childobj = document.getElementById("child" + el);

                if (childobj.style.display == 'none')
                {
                    childobj.style.display = 'block';
                }
                else
                {
                    childobj.style.display = 'none';
                }
                return;
            }
            
            function toPage(page){
            	window.parent.document.getElementById('right').setAttribute('src',"${pageContext.request.contextPath}/" + page);
             }
        </script>
    </head>
    <body>
        <table height="100%" cellspacing=0 cellpadding=0 width=170 
               background=./img/menu_bg.jpg border=0>
               <tr>
                <td valign=top align=middle>
                    <table cellspacing=0 cellpadding=0 width="100%" border=0>

                        <tr>
                            <td height=10></td></tr></table>
                            
                    <c:if test="${roleCode eq '1' }">
                    <table cellspacing=0 cellpadding=0 width=150 border=0>

                        <tr height=22>
                            <td style="padding-left: 30px" background=./img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(1) 
                                    href="javascript:void(0);">用户管理</a></td></tr>
                        <tr height=4>
                            <td></td></tr></table>
                    <table id=child1 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="./img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild
                                   onclick="toPage('user/userList');" 
                                   target=main>用户列表</a></td></tr>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="./img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                    onclick="toPage('user/addPage');" 
                                   target=main>添加用户</a></td></tr>
                        <tr height=4>
                            <td colspan=2></td></tr></table>
                    
                    <table cellspacing=0 cellpadding=0 width=150 border=0>

                        <tr height=22>
                            <td style="padding-left: 30px" background=./img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(2) 
                                    href="javascript:void(0);">图书管理</a></td></tr>
                        <tr height=4>
                            <td></td></tr></table>
                    <table id=child2 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="./img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild
                                   onclick="toPage('book/bookList');" 
                                   target=main>图书列表</a></td></tr>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="./img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                    onclick="toPage('book/addPage');" 
                                   target=main>添加图书</a></td></tr>
                        <tr height=4>
                            <td colspan=2></td></tr></table>
                    </c:if>        
                    
                    <table cellspacing=0 cellpadding=0 width=150 border=0>

                        <tr height=22>
                            <td style="padding-left: 30px" background=./img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(3) 
                                    href="javascript:void(0);">图书借阅</a></td></tr>
                        <tr height=4>
                            <td></td></tr></table>
                    <table id=child3 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="./img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild
                                   onclick="toPage('borrow/bookList');" 
                                   target=main>图书列表</a></td></tr>
                        <tr height=20>
                            <td align=middle width=30><img height=9 
                                                           src="./img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild
                                   onclick="toPage('borrow/borrowedBooks');" 
                                   target=main>归还图书</a></td></tr>
                     </table>
    </body>
</html>