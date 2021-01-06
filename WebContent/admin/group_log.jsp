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
    <title>OA办公系统--日志管理--小组日志</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/log.css">

</head>
<body>
     <jsp:include page="/admin/inc/aside.jsp"/>
    
    <main>
             <jsp:include page="/admin/inc/header.jsp"/>
          <nav >
                <div class="nav_box ">
                    <h1>日志管理</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->小组日志<span></span></h2>
                </div>
           </nav>
           <article>
                 <div class="bg">

                      <div class="day_log">



                 <table>
                     <tr>
                         <td>编号</td>
                         <td>发送人</td>
                         <td>部门</td>
                         <td>小组今日计划</td>
                         <td>完成情况</td>
                         <td>待处理业务</td>
                         <td>小组明日计划</td>
                         <td>备注</td>
                         <td>发布时间</td>
                         <td>操作</td>
                     </tr>

                    	 <c:forEach items="${pageBean.list}" var="g" >
					<tr>
						<td>${g.id }</td>
						<td>${g.name }</td>
						<td>${g.branch}</td>
						<td>${g.something }</td>
						<td>${g.progress }</td>
						<td>${g.wait}</td>
						<td>${g.step }</td>
						<td>${g.notes }</td>
						<td>${g.time}</td>
						<td>
							<a onclick="if(confirm('确定删除吗')) window.location='/oa_v3/delete_logs.action?id=${g.id}&type=${g.type}'">删除</a>
						</td>
					</tr>
				</c:forEach>
                   
                 </table>
                              	 <div class="top">
	<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>

	<c:if test="${pageBean.curPage!=1}">

 		<a href="/oa_v3/findWithPage_logs.action?curPage=1&type=4">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
	<a href="/oa_v3/findWithPage_logs.action?curPage=${pageBean.prePage}&type=4" >上一页</a>
	<a href="/oa_v3/findWithPage_logs.action?curPage=${pageBean.nextPage}&type=4" >下一页</a>
	<a href="/oa_v3/findWithPage_logs.action?curPage=${pageBean.totalPage}&type=4">末页</a>

</div>
                 
                 
              </div>

                 </div>



           </article>


    </main>
     <jsp:include page="/admin/inc/footer.jsp"/>
</body>
</html>