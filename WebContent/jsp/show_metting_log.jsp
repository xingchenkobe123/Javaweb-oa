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
<title>工作日志--会议纪要--查看</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/css/show_metting_log.css">
</head>

<body>
	<jsp:include page="/jsp/inc/nav.jsp" />
	<main>
	<article>
		<div class="bg">
			<div class="show_log">
				<h3 style="margin-bottom: 15px;">工作日志--会议纪要--查看</h3>
				<table>
					<tr>
						<td>编号</td>
						<td>主持人</td>
						<td>与会人</td>
						<td>主题</td>
						<td>内容</td>
						<td>开始时间</td>
						<td>持续时间</td>
						<td>地点</td>
						<td>记录人</td>
					</tr>

					<c:forEach items="${pageBean.list}" var="n" varStatus="s">
						<tr>
							<td>${s.count}</td>
							<td>${n.host}</td>
							<td>${n.other}</td>
							<td>${n.theme}</td>
							<td>${n.content}</td>
							<td>${n.start}</td>
							<td>${n.last}</td>
							<td>${n.where}</td>
							
							<td>${n.name}</td>
						</tr>
					</c:forEach>
				</table>
			<div id="top">
				<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>

				<c:if test="${pageBean.curPage!=1}">

					<a
						href="/oa_v3/own_findWithPage_metting.action?curPage=1&name=${loginWorker.name}">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
				<a
					href="/oa_v3/own_findWithPage_metting.action?curPage=${pageBean.prePage}&name=${loginWorker.name}">上一页</a>
				<a
					href="/oa_v3/own_findWithPage_metting.action?curPage=${pageBean.nextPage}&name=${loginWorker.name}">下一页</a>
				<a
					href="/oa_v3/own_findWithPage_metting.action?curPage=${pageBean.totalPage}&name=${loginWorker.name}">末页</a>

			</div>
		</div>
		<jsp:include page="/jsp/inc/aside.jsp" />
		</div>
	</article>
	</main>
	<jsp:include page="/jsp/inc/footer.jsp" />
	<script>
		
	</script>
</body>

</html>