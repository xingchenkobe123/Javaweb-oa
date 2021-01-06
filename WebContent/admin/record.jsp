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
    <title>OA办公系统--考勤管理--考勤报表</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/record.css">
</head>
<body>
     <jsp:include page="/admin/inc/aside.jsp"/>
    <main>
              <jsp:include page="/admin/inc/header.jsp"/>
           <nav >
                <div class="nav_box ">
                    <h1>考勤管理</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->考勤报表<span></span></h2>
                </div>
           </nav>
           <article>
			<h3 ><a  id="btn_a">导出</a></h3>
            <table id="output_table">
                <tr>
                    <td>编号</td>
                    <td>姓名</td>
                    <td>部门</td>
                    <td>打卡地点</td>
                    <td>上班打卡时间</td>
                    <td>下班打卡时间</td>
                    <td>打卡类型</td>
                    <td>操作</td>
                </tr>
               <c:forEach items="${pageBean.list}" var="r" >
				<tr>
					<td >${r.id }</td>
					<td >${r.name }</td>
					<td >${r.branch }</td>
					<td >石家庄学院尚学楼</td>
					<td >${r.start }</td>
					<td >${r.over }</td>
					<td >${r.type }</td>
					<td>
						<a onclick="if(confirm('确定删除吗')) window.location='/oa_v3/delete_record.action?id=${r.id}'">删除</a>
					</td>
				</tr>
			</c:forEach>
            </table>
            
             <div id="top">
	<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>

	<c:if test="${pageBean.curPage!=1}">

 		<a href="/oa_v3/findWithPage_record.action?curPage=1">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
	<a href="/oa_v3/findWithPage_record.action?curPage=${pageBean.prePage}" >上一页</a>
	<a href="/oa_v3/findWithPage_record.action?curPage=${pageBean.nextPage}" >下一页</a>
	<a href="/oa_v3/findWithPage_record.action?curPage=${pageBean.totalPage}">末页</a>

</div>
           </article>
           
    </main>
      <jsp:include page="/admin/inc/footer.jsp"/>
<script src="${pageContext.request.contextPath}/admin/js/output.js"> </script>
<script>
	var tableId=document.querySelector("#output_table");
	var aid=document.querySelector("#btn_a");
	var xlsName="职员考勤表";
	diy_output(tableId,aid,xlsName);
</script>
</body>
</html>