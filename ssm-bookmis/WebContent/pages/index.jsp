<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理中心 v1.0</title>
		<script language=javascript>
            
        </script>
    </head>
    <frameset border=0 framespacing=0 rows="60, *" frameborder=0>
        <frame name=head src="${pageContext.request.contextPath }/pages/head.jsp" frameborder=0 noresize scrolling=no>
            <frameset cols="170, *">
                <frame name=left id="left" src="${pageContext.request.contextPath }/pages/left.jsp" frameborder=0 noresize />
                <frame name=right id="right" src="${pageContext.request.contextPath }/pages/right.jsp" frameborder=0 noresize scrolling=yes />
            </frameset>
    </frameset>
    <noframes>
    </noframes>
</html>