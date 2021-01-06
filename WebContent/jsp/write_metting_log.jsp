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
<title>工作日志--会议纪要</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/css/article.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/css/write_metting.css">
</head>

<body>
	<jsp:include page="/jsp/inc/nav.jsp" />
	<main>
	<article>
		<div class="bg">
			<div class="wrapper">
				<h2>开始记录</h2>
				<div class="form_box">
				<form action="/oa_v3/add_metting.action" method="post">

					<input type="search" name="host" placeholder="主持人" required> <br>
					<input type="hidden" name="name" value="${loginWorker.name}"> 
					<input type="search" name="other" placeholder="与会人" required> <br>
					<input type="search" name="theme" placeholder="会议主题" required> <br>
					<input type="datetime-local" name="start" placeholder="会议开始时间" required> <br>
					<input type="search" name="last" placeholder="会议持续时长" required> <br>
					<input type="search" name="where" placeholder="会议地点" required> <br>
					<textarea id="md_editor" name="content" placeholder="会议内容" required></textarea>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/jsp/js/mditor.js"></script>
	<script type="text/javascript">
		var editor = new mditor(document.getElementById('md_editor'));
	</script>
</body>

</html>