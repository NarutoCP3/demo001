<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!-- 将分页部分做成通用的jsp组件页面 -->

<!-- js代码不建议放在公共页面，因为form表单的id值可能不同   
<script type="text/javascript">
function pageList(num){
	document.getElementById("pageNum").value = num;
	
	document.getElementById("f0").submit();
}
</script>
 --> 

第${pageModel.pageNum }页&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:void(0);" onclick="pageList(1);">首页</a> &nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:void(0);" onclick="pageList(${pageModel.pageNum-1});" >上一页</a> &nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:void(0);" onclick="pageList(${pageModel.pageNum+1});" >下一页</a> &nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:void(0);" onclick="pageList(${pageModel.lastNum});" >尾页</a>