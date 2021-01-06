<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (request.getSession().getAttribute("loginWorker") == null) {
		response.sendRedirect("../jsp/login.jsp");
	}
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>恒宇科技自动化办公系统--部门小组列表</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/css/show_schema.css">
</head>

<body>
	<jsp:include page="/jsp/inc/nav.jsp" />
	<main>
	<div class="bg">
		
		<div class="branch_item">
		
				 <table>
                <tr>
                    <td>工号</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>年龄</td>
                    <td>部门</td>
                    <td>小组</td>
                    <td>电话</td>
                    <td>等级</td>
                
                </tr>

				 <c:forEach items="${pageBean.list}" var="w" >
					<tr>
						<td>${w.id }</td>
						<td><a href="/oa_v3/info_findByPhone.action?phone=${w.phone }">${w.name }</a></td>
						<td>${w.sex}</td>
						<td>${w.age}</td>
						<td>${w.branch}</td>
						<td>${w.group}</td>
						<td>${w.phone}</td>
						<td>${w.lv}</td>
					</tr>
				</c:forEach>
           	 </table>
           	 
           	 <div class="top">
	<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>


	<c:if test="${pageBean.curPage!=1}">

 		<a href="/oa_v3/show_list.action?curPage=1&branch=${branch}&group=${group}">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
	<a href="/oa_v3/show_list.action?curPage=${pageBean.prePage}&branch=${branch}&group=${group}" >上一页</a>
	<a href="/oa_v3/show_list.action?curPage=${pageBean.nextPage}&branch=${branch}&group=${group}" >下一页</a>
	<a href="/oa_v3/show_list.action?curPage=${pageBean.totalPage}&branch=${branch}&group=${group}">末页</a>

</div>
           	 
		
			
		</div>
	</div>
	</main>
	<jsp:include page="/jsp/inc/footer.jsp" />
	
		
</body>

</html>