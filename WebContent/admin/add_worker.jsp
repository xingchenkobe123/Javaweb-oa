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
    <title>恒宇科技自动化办公系统--职员管理--添加职员</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/add_worker.css">

</head>
<body>
       <jsp:include page="/admin/inc/aside.jsp"/>
    <main>
              <jsp:include page="/admin/inc/header.jsp"/>
          <nav >
                <div class="nav_box ">
                    <h1>职员管理</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->添加职员<span></span></h2>
                </div>
           </nav>
           <article>
                <form action="/oa_v3/add_worker.action" method="post" >


                             <legend>添加职员</legend>
                           <p>姓名：<input type="search" name="name" placeholder="请输入姓名" required></p>
                           <p>密码：<input type="password" name="pwd" placeholder="请输入密码" required></p>
                           <p>手机&nbsp; :&nbsp;<input type="search" id="phone" name="phone" placeholder="请输入手机号" required></p>

                          <p>年龄：<input type="search" name="age" placeholder="请输入年龄" required></p>
                           <p>
                        请选择部门:&nbsp;&nbsp;&nbsp;&nbsp;
                               <select name="branch" required >
                                   <option value="研发部">研发部</option>
                                   <option value="测试部">测试部</option>
                                   <option value="市场部">市场部</option>
                                   <option value="人事部">人事部</option>
                                   <option value="财务部">财务部</option>

                               </select>
                           </p>

                           <p>
                                请设置小组:
                            <select  name="group" required>
                                   <option value="A">A</option>
                                   <option value="B">B</option>
                                   <option value="C">C</option>
                                   <option value="D">D</option>
                               </select>
                           </p>

                           <p>
                                请设置等级:
                               <select name="lv" required>
                                   <option value="1">普通职员</option>
                                   <option value="2">小组组长</option>
                                   <option value="3">部门主管</option>
                                  
                               </select>
                           </p>
                             <p>
                            性别：<input  checked type="radio" name="sex" value="男">男
                                  <input type="radio" name="sex" value="女">女
                           </p>
                           <p>
                               <input type="submit" value="确认添加"/>
                               <input type="reset" value="重新填写"/>
                           </p>


                </form>
           </article>
    </main>
    <jsp:include page="/admin/inc/footer.jsp"/>
    <script>
    $("#phone").blur(function(){
    	if(!/^[\d]{11}$/.test($("#phone"))){
    		alert("手机号不合法");
    		$("input[type=submit]").attr("disabled",true)
    	}
    })
    
    </script>
</body>
</html>