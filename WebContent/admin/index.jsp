<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
    <title>恒宇科技自动化办公系统--后台首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
</head>
<body>
    
    <jsp:include page="/admin/inc/aside.jsp"/>
   
    <main>
        <jsp:include page="/admin/inc/header.jsp"/>
          <nav >
                <div class="nav_box ">
                    <h1>DashBoard</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->welcome<span></span></h2>
                </div>
           </nav>
           <article>
                 <img src="${pageContext.request.contextPath}/admin/img/welcome.png" alt="">
           </article>
    </main>
    
    <jsp:include page="/admin/inc/footer.jsp"/>
    
   <script>
   	$("header h1 span").css("cursor","pointer");
   	$("header h1 span").click(function(){
   		window.location.href="/oa_v3/adminLoginOut.action";
   	})
   
   </script>
  
</body>
</html>