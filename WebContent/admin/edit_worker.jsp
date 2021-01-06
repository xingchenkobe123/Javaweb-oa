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
    <title>恒宇科技自动化办公系统--职员管理--编辑职员</title>
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
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->编辑职员<span></span></h2>
                </div>
           </nav>
           <article>
                <form  action="/oa_v3/edit_worker.action?id=${worker.id}" method="post">


               
                             <legend>编辑职员</legend>
                           <p>姓名：<input type="search" name="name"  readonly value="${worker.name }"></p>
                           <p>密码：<input type="search" name="pwd" value="${worker.pwd }"></p>
                           <p>手机：<input type="search" name="phone"  value="${worker.phone }"></p>
                           <p>等级：<input type="search" name="lv" readonly value="${worker.lv }"></p>
                           <p>
                            部门：
                               <select id="branch_select" name="branch">
                                   <option value="研发部">研发部</option>
                                   <option value="测试部">测试部</option>
                                   <option value="市场部">市场部</option>
                                   <option value="人事部">人事部</option>
                                   <option value="财务部">财务部</option>
                               </select>
                           </p>

                           <p>
                              小组:
                               <select id="group_select" name="group">
                                   <option value="A">A</option>
                                   <option value="B">B</option>
                                   <option value="C">C</option>
                                   <option value="D">D</option>
                               </select>
                           </p>
                            

                        
                     
                            
                           <p>
                               <input type="submit" value="确认编辑"/>
                               <input type="reset" value="重新填写"/>
                           </p>


                </form>
           </article>
    </main>
    <jsp:include page="/admin/inc/footer.jsp"/>
    <script>

    	
    var bs=document.querySelector("#branch_select").children;
    
    for(var i=0;i<bs.length;i++){
    	if("${worker.branch}"==bs[i].innerHTML){
    		$(bs[i]).attr("selected","selected")
    	}
    }
    var gs=document.querySelector("#group_select").children;
    
    for(var i=0;i<gs.length;i++){
    	if("${worker.group}"==gs[i].innerHTML){
    		$(gs[i]).attr("selected","selected")
    	}
    }
 
    	
    	
    
    	
    </script>
</body>
</html>