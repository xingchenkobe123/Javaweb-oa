<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
    <title>恒宇科技自动化办公系统--职员详细信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/own.css">
</head>

<body>
   <jsp:include page="/jsp/inc/nav.jsp"/>
    <main>
     
        <article>
            <form >
                <legend>职员详细信息</legend>
                <p>工号&nbsp; :&nbsp;<input  style="cursor:not-allowed;" value="${Worker.id}" name="id" type="search" readonly></p>
                <p>姓名&nbsp; :&nbsp;<input  style="cursor:not-allowed;"  value="${Worker.name}" type="search" readonly></p>
                <p>手机&nbsp; :&nbsp;<input style="cursor:not-allowed;" type="search" name="phone" value="${Worker.phone}" readonly></p>
                <p>年龄：<input type="search"  style="cursor:not-allowed;"  value="${Worker.age}" readonly></p>
                <p>部门&nbsp; :&nbsp;<input  style="cursor:not-allowed;"  value="${Worker.branch}" type="search" readonly></p>
                <p>小组&nbsp; :&nbsp;<input  style="cursor:not-allowed;"  value="${Worker.group}" type="search" readonly></p>
                <p>等级&nbsp; :&nbsp;<input  style="cursor:not-allowed;"  value="${Worker.lv}" type="search" readonly></p>
                <p>性别&nbsp; :&nbsp;<input  style="cursor:not-allowed;"  value="${Worker.sex}" type="search" readonly></p>
            </form>
        </article>
    </main>
 <jsp:include page="/jsp/inc/footer.jsp"/>
</body>

</html>