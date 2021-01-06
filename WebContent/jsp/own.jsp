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
    <title>恒宇科技自动化办公系统--个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/own.css">
</head>

<body>
   <jsp:include page="/jsp/inc/nav.jsp"/>
    <main>
        <!-- 	编号，姓名，密码，手机，年龄，部门，小组，等级，性别 -->
        <article>
            <form action="/oa_v3/edit_phone.action" method="get">
                <legend>个人信息</legend>
                <p>工号&nbsp; :&nbsp;<input  style="cursor:not-allowed;" value="${loginWorker.id}" name="id" type="search" readonly></p>
                <p>姓名&nbsp; :&nbsp;<input  style="cursor:not-allowed;"  value="${loginWorker.name}" type="search" readonly></p>
                <p>手机&nbsp; :&nbsp;<input style="cursor:pointer;" type="search" name="phone" value="${loginWorker.phone}"></p>
                <p>年龄：<input type="search"  style="cursor:not-allowed;"  value="${loginWorker.age}" readonly></p>
                <p>部门&nbsp; :&nbsp;<input  style="cursor:not-allowed;"  value="${loginWorker.branch}" type="search" readonly></p>
                <p>小组&nbsp; :&nbsp;<input  style="cursor:not-allowed;"  value="${loginWorker.group}" type="search" readonly></p>
                <p>等级&nbsp; :&nbsp;<input  style="cursor:not-allowed;"  value="${loginWorker.lv}" type="search" readonly></p>
                <p>性别&nbsp; :&nbsp;<input  style="cursor:not-allowed;"  value="${loginWorker.sex}" type="search" readonly></p>
                <p><input type="submit" style="cursor:pointer;" value="确认修改 " /><input style="cursor:pointer;" type="reset" value="重新填写" /></p>
            </form>
        </article>
    </main>
 <jsp:include page="/jsp/inc/footer.jsp"/>
</body>

</html>