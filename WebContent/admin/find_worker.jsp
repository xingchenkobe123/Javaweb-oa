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
    <title>恒宇科技自动化办公系统--职员管理--查询职员</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/find_worker.css">

</head>
<body>
     <jsp:include page="/admin/inc/aside.jsp"/>
    <main>
            <jsp:include page="/admin/inc/header.jsp"/>
          <nav >
                <div class="nav_box ">
                    <h1>职员管理</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->查询职员<span></span></h2>
                </div>
           </nav>
           <article>
<!-- <div>

	<form action="/oa_v3/likeSearch">
		<strong><input id="s_name" type="text" placeholder="姓名模糊查询" style="width:100px;height:30px;"></strong>&nbsp;
		<strong><input id="s_branch" type="text" placeholder="部门模糊查询 " style="width:100px;height:30px;"></strong>
	</form>
</div> -->
            <table>
                <tr>
                    <td>工号</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>年龄</td>
                    <td>部门</td>
                    <td>小组</td>
                    <td>电话</td>
                    <td>等级</td>
                    <td>密码</td>
                    <td>操作</td>
                </tr>

				 <c:forEach items="${pageBean.list}" var="w" >
					<tr>
						<td>${w.id }</td>
						<td>${w.name }</td>
						<td>${w.sex}</td>
						<td>${w.age}</td>
						<td>${w.branch}</td>
						<td>${w.group}</td>
						<td>${w.phone}</td>
						<td>${w.lv}</td>
						<td>${w.pwd}</td>
						<td><a onclick="if(confirm('确定删除吗')) window.location='/oa_v3/delete_worker.action?id=${w.id}'">删除</a>
						&nbsp;&nbsp;<a href="/oa_v3/findById_worker.action?id=${w.id}">修改</a></td>
					</tr>
				</c:forEach>
           	 </table>
           	 
           	 <div class="top">
	<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>

	<c:if test="${pageBean.curPage!=1}">

 		<a href="/oa_v3/findWithPage_worker.action?curPage=1">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
	<a href="/oa_v3/findWithPage_worker.action?curPage=${pageBean.prePage}" >上一页</a>
	<a href="/oa_v3/findWithPage_worker.action?curPage=${pageBean.nextPage}" >下一页</a>
	<a href="/oa_v3/findWithPage_worker.action?curPage=${pageBean.totalPage}">末页</a>

</div>
           	 
           </article>
    </main>
      <jsp:include page="/admin/inc/footer.jsp"/>
      
      
      <script type="text/javascript">
      
      $("#s_name").change(function(){
    	  $.post("/oa_v3/likeSearch.action",
    			  {"name": $("#s_name").val(),"type":"1"},
    			  function(data){
    			if(data!="ok") {
    				return;
    			} 
    		  
    	  })
      })
      $("#s_branch").change(function(){
    	  $.post("/oa_v3/likeSearch.action",
    			  {"branch": $("#s_branch").val(),"type":"2"},
    			  function(data){
    			if(data!="ok") {
    				return;
    			} 
    		  
    	  })
      })
      
   
    	
     
      
     
      </script>
</body>
</html>