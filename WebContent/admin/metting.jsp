<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (request.getSession().getAttribute("loginAdmin") == null) {
		response.sendRedirect("../admin/login.jsp");
	} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>OA办公系统--日志管理--会议纪要</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/admin_index.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/log.css">

</head>
<body>
	<jsp:include page="/admin/inc/aside.jsp" />

	<main> <jsp:include page="/admin/inc/header.jsp" />
	<nav>
		<div class="nav_box ">
			<h1>日志管理</h1>
			<h2>
				<a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->会议纪要<span></span>
			</h2>
		</div>
	</nav>
	<article>
		<div class="bg">

			<div class="day_log">



				<table>
					<tr>
						<td>编号</td>
						<td>记录人</td>
						<td>主持人</td>
						<td>与会人</td>
						<td>主题</td>
						<td>内容</td>
						<td>会议开始时间</td>
						<td>会议持续时间</td>
						<td>地点</td>
						<td>附件</td>
						<td>操作</td>
					</tr>

					<c:forEach items="${pageBean.list}" var="m">
						<tr>
							<td>${m.id }</td>
							<td>${m.name }</td>
							<td>${m.host }</td>
							<td>${m.other}</td>
							<td>${m.theme }</td>
							<td>${m.content }</td>
							<td>${m.start}</td>
							<td>${m.last }</td>
							<td>${m.where }</td>
							<td><a  
								href="/oa_v3/DownServlet?filename=${m.enclosure}">${m.enclosure}</a></td>
							<td><a
								onclick="if(confirm('确定删除吗')) window.location='/oa_v3/delete_metting.action?id=${m.id}'">删除</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="top">
					<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>

					<c:if test="${pageBean.curPage!=1}">

						<a href="/oa_v3/findWithPage_metting.action?curPage=1">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
					<a
						href="/oa_v3/findWithPage_metting.action?curPage=${pageBean.prePage}">上一页</a>
					<a
						href="/oa_v3/findWithPage_metting.action?curPage=${pageBean.nextPage}">下一页</a>
					<a
						href="/oa_v3/findWithPage_metting.action?curPage=${pageBean.totalPage}">末页</a>

				</div>

			</div>

		</div>



	</article>


	</main>
	<jsp:include page="/admin/inc/footer.jsp" />
</body>
</html>