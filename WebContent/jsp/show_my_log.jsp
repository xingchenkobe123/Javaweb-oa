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
<title>工作日志--我的日志--查看</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/css/show_my_log.css">
</head>

<body>
	<jsp:include page="/jsp/inc/nav.jsp" />
	<main>
	<article>
		<div class="bg">
			<div class="show_log">
				<h3 style="margin-bottom: 15px;">工作日志--我的日志--查看</h3>
				<table>
					<tr>
						<td>编号</td>
						<td>发送人</td>
						<td>部门</td>
						<td>今日计划</td>
						<td>完成情况</td>
						<td>待处理业务</td>
						<td>明日计划</td>
						<td>时间</td>
						<td>备注</td>
					</tr>
					<c:forEach items="${pageBean.list}" var="n" varStatus="s">
						<tr>
							<td>${s.count}</td>
							<td>${n.name}</td>
							<td>${n.branch}</td>
							<td>${n.something}</td>
							<td>${n.progress}</td>
							<td>${n.wait}</td>
							<td>${n.step}</td>
							<td>${n.time}</td>
							<td>${n.notes}</td>
						</tr>
					</c:forEach>
				</table>
				<div id="top">
					<c:if test="${pageBean.curPage==1}"> 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 </c:if>
					<c:if test="${pageBean.curPage!=1}">
						<a href="/oa_v3/own_findWithPage_logs.action?curPage=1&name=${loginWorker.name}">首页</a>
						第${pageBean.curPage}页/ 共${pageBean.totalPage}页
					</c:if>  
					<a href="/oa_v3/own_findWithPage_logs.action?curPage=${pageBean.prePage}&name=${loginWorker.name}">上一页</a>
					<a href="/oa_v3/own_findWithPage_logs.action?curPage=${pageBean.nextPage}&name=${loginWorker.name}">下一页</a>
					<a href="/oa_v3/own_findWithPage_logs.action?curPage=${pageBean.totalPage}&name=${loginWorker.name}">末页</a>
				</div>
				<jsp:include page="/jsp/inc/aside.jsp" />
			</div>
		</div>
	</article>
	</main>
	<jsp:include page="/jsp/inc/footer.jsp" />
	<script>
		
	</script>
</body>

</html>