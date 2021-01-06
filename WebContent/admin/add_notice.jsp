<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (request.getSession().getAttribute("loginAdmin") == null) {
		response.sendRedirect("../admin/login.jsp");
	} 
%>
 <% String now_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>OA办公系统--公告管理--发布公告</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/add_notice.css">
</head>
<body>
    <jsp:include page="/admin/inc/aside.jsp"/>
    <main>
               <jsp:include page="/admin/inc/header.jsp"/>
          <nav >
                <div class="nav_box ">
                    <h1>公告管理</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->发布公告<span></span></h2>
                </div>
           </nav>
           <article ng-app="app">
                <!-- 实例化控制器，格式：类名-as-实例名 -->
               <div ng-controller="MainCtrl as mainCtrl" >
                   <h3>发布公告</h3>
                   <hr>
                   <form action="/oa_v3/add_notice.action"  method="post">
                     <p><input type="search" name="title" placeholder="请输入标题"></p>
                     <input type="hidden" name="time" value="<%=now_time%>">
                     <p>

                        <textarea cols="40" rows="10"name="content" ng-model="mainCtrl.context"  placeholder="请输入内容"></textarea>
                        <span ng-style='mainCtrl.warn()'>{{mainCtrl.context.length}}/140</span>
                     </p>
                       <p>
                           <button ng-style="mainCtrl.check_submit_cursor()" ng-disabled="mainCtrl.context.length > 140||mainCtrl.context.length==0">发布</button>


                           <button  ng-style="mainCtrl.check_reset_cursor()" ng-click="mainCtrl.reset()" ng-disabled="mainCtrl.context.length==0">清空</button>
                       </p>
                   </form>
              </div>
           </article>
    </main>
     <jsp:include page="/admin/inc/footer.jsp"/>
    
    <script src="${pageContext.request.contextPath}/admin/js/angular.min.js"> </script>
    <script src="${pageContext.request.contextPath}/admin/js/add_notice.js"> </script>

</body>
</html>