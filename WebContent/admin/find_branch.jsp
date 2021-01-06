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
    <title>恒宇科技自动化办公系统--部门管理--查询部门</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/find_branch.css">
</head>
<body>
     <jsp:include page="/admin/inc/aside.jsp"/>
    <main>
             <jsp:include page="/admin/inc/header.jsp"/>
          <nav >
                <div class="nav_box ">
                    <h1>部门管理</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->查询部门<span></span></h2>
                </div>
           </nav>
           <article>
                  <table>
                <tr>
                    <td>部门编号</td>
                    <td>部门名称</td>
                    <td>业务范围</td>
                    <td>操作</td>
                </tr>

				 <c:forEach items="${pageBean.list}" var="b" >
					<tr>
						<td>${b.id }</td>
						<td>${b.name }</td>
						<td>${b.range}</td>
						<td><a onclick="if(confirm('确定删除吗')) window.location='/oa_v3/delete_branch.action?id=${b.id}'">删除</a>
						&nbsp;&nbsp;<a href="/oa_v3/findById_branch.action?id=${b.id}">修改</a></td>
					</tr>
				</c:forEach>
            </table>
             	 <div class="top">
	<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>

	<c:if test="${pageBean.curPage!=1}">

 		<a href="/oa_v3/findWithPage_branch.action?curPage=1">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
	<a href="/oa_v3/findWithPage_branch.action?curPage=${pageBean.prePage}" >上一页</a>
	<a href="/oa_v3/findWithPage_branch.action?curPage=${pageBean.nextPage}" >下一页</a>
	<a href="/oa_v3/findWithPage_branch.action?curPage=${pageBean.totalPage}">末页</a>

</div>
           </article>
    </main>
    
     <jsp:include page="/admin/inc/footer.jsp"/>
</body>
</html>