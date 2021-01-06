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
<title>恒宇科技自动化办公系统--体系结构</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/css/show_schema.css">
</head>

<body>
	<jsp:include page="/jsp/inc/nav.jsp" />
	<main>
	<div class="bg">
		<div class="first_dom">
			<p>恒宇</p>
		</div>
		<div class="second_dom">
			<p>科技</p>
		</div>
		<div class="branch_item">
		
				<ul>
					<c:forEach items="${list}" var="a">
				
					<li class="lis"><a href="javascript:void(0);">${a.name}</a>
						<ul>
							<li><a href="/oa_v3/show_list.action?curPage=1&branch=${a.name}&group=A">${a.name}A组</a></li>
							<li><a href="/oa_v3/show_list.action?curPage=1&branch=${a.name}&group=B">${a.name}B组</a></li>
							<li><a href="/oa_v3/show_list.action?curPage=1&branch=${a.name}&group=C">${a.name}C组</a></li>
							<li><a href="/oa_v3/show_list.action?curPage=1&branch=${a.name}&group=D">${a.name}D组</a></li>
					
						</ul>
					</li>
						</c:forEach>
				</ul>
		
			
		</div>
	</div>
	</main>
	<jsp:include page="/jsp/inc/footer.jsp" />
	<script>
		setTimeout(function() {

			$(".lis>a").css("opacity", "1")

			$(".lis>a:eq(1)").css("color", "pink")
			$(".lis>a:eq(2)").css("color", "gold")
			$(".lis>a:eq(3)").css("color", "#2ecc71")
			$(".lis>a:eq(4)").css("color", "skyblue")

		}, 3500)

		var as = document.querySelectorAll(".lis>a");

		var flag = true;
		for (var i = 0; i < as.length; i++) {

			$(as[i]).click(function() {

				if (flag) {
					$(this).next()[0].style.display = "block";
					flag = false;
				} else {
					$(this).next()[0].style.display = "none";
					flag = true;
				}

			})

		}
	</script>
</body>

</html>