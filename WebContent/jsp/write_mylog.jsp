<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (request.getSession().getAttribute("loginWorker") == null) {
		response.sendRedirect("../jsp/login.jsp");
	}
%>
 <% String now_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>工作日志-- 我的日志</title>
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/jsp/css/write_mylog.css">

</head>

<body>
	<jsp:include page="/jsp/inc/nav.jsp" />
	<main>
	<article>
		<div class="bg">
			<div class="wrapper">
			<c:if test="${param.type==1 }"><h2> 日报书写</h2></c:if>
			<c:if test="${param.type==2 }"><h2> 周报书写</h2></c:if>
			<c:if test="${param.type==3 }"><h2> 月报书写</h2></c:if>
				
				<div class="form_box">
				<form action="/oa_v3/add_logs.action" method="post">

					<input type="search" name="something" placeholder="今日计划" required> <br>
					<input type="hidden" name="name" value="${loginWorker.name}"> 
					<input type="hidden" name="branch" value="${loginWorker.branch}" > 
					<input type="hidden" name="group" value="${loginWorker.group}" > 
					<input type="hidden" name="type" value="${param.type}" > 
					<input type="hidden" name="time" value="<%=now_time%>"> 
					<input type="search" name="progress" placeholder="进度" required> <br>
					<input type="search" name="wait" placeholder="待完成" required> <br>
					<input type="search" name="notes" placeholder="备注" required> <br>
					<input type="search" name="step" placeholder="明日计划" required> <br>
					<input type="submit" value="保存"> <input type="reset"
						value="重写">
				</form>
				</div>
			</div>
		</div>
		<jsp:include page="/jsp/inc/aside.jsp" />
	</article>
	</main>
	<jsp:include page="/jsp/inc/footer.jsp" />
	
	
</body>

</html>