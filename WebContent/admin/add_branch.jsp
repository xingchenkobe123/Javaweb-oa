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
    <title>恒宇科技自动化办公系统--部门管理--添加部门</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/add_branch.css">

</head>
<body>
    <jsp:include page="/admin/inc/aside.jsp"/>
    <main>
             <jsp:include page="/admin/inc/header.jsp"/>
          <nav >
                <div class="nav_box ">
                    <h1>部门管理</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->添加部门<span></span></h2>
                </div>
           </nav>
           <article>
	           <div class="bg">
	                <form action="/oa_v3/add_branch.action" method="post" >
	                     <!--         部门编号，名称，业务范围 -->
	                           <legend>添加部门</legend>
	                           <p>部门名称：<input required type="search" name="name" placeholder="请输入要添加的部门名称"></p>
	                           <p>
	                            <span>业务范围：</span>
	                           <textarea cols="20" required  rows="10" name="range" placeholder="请输入业务范围"></textarea><br>
	
	                                &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;
	                                <input type="submit" value="确认添加"/>
	                               <input type="reset" value="重新填写"/>
	                           </p>
	                </form>
	             </div>
           </article>
    </main>
  <jsp:include page="/admin/inc/footer.jsp"/>
</body>
</html>