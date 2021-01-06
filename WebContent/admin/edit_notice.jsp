<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
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
    <title>OA办公系统--公告管理--修改公告</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/edit_notice.css">
</head>
<body>
    <jsp:include page="/admin/inc/aside.jsp"/>
    <main>
               <jsp:include page="/admin/inc/header.jsp"/>
          <nav >
                <div class="nav_box ">
                    <h1>公告管理</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->修改公告<span></span></h2>
                </div>
           </nav>
           <article ng-app="app">
              
               <div ng-controller="MainCtrl as mainCtrl" >
                   <h3>修改公告</h3>
                   <hr>
                   <form action="/oa_v3/edit_notice.action?id=${notice.id }"  method="post">
                     <p><input type="search" name="title" value="${notice.title}"></p>
                     <p>

                        <textarea id="my_textarea" cols="40" rows="10" name="content" ng-model="mainCtrl.context" ></textarea>
                        <span ng-style='mainCtrl.warn()'>{{mainCtrl.context.length}}/140</span>
                     </p>
                       <p>
                           <button ng-style="mainCtrl.check_submit_cursor()" ng-disabled="mainCtrl.context.length > 140||mainCtrl.context.length==0">修改</button>


                           <button  ng-style="mainCtrl.check_reset_cursor()" ng-click="mainCtrl.reset()" ng-disabled="mainCtrl.context.length==0">清空</button>
                       </p>
                   </form>
              </div>
           </article>
    </main>
     <jsp:include page="/admin/inc/footer.jsp"/>
    
    <script src="${pageContext.request.contextPath}/admin/js/angular.min.js"> </script>
    <script src="${pageContext.request.contextPath}/admin/js/add_notice.js"> </script>
    
    <script>
    
    var id="${notice.id}";
	init_content(id);
  	
	  
  	function init_content(id){
  	
	  	$.post("/oa_v3/findById_notice_xhr.action",{"id":id},function(data){
	  		
	  	    var string = "";
	  	    var idx = -1;
	  	    
	  	   var timer = setInterval(function() {
	  	    	
	  	        idx++;
	  	        if (idx == data.length) {
	  	            clearInterval(timer);
	  	        }
	  	        string += data.charAt(idx);
	  	      $("#my_textarea").val(string);
	  	
	  	    }, 100)
	  	})
  	}
    
    </script>

</body>
</html>