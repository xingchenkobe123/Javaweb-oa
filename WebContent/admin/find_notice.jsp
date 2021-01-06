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
    <title>OA办公系统--公告管理--查询公告</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/find_notice.css">

</head>
<body>
   <jsp:include page="/admin/inc/aside.jsp"/>
    <main>
             <jsp:include page="/admin/inc/header.jsp"/>
          <nav >
                <div class="nav_box ">
                    <h1>公告管理</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->查询公告<span></span></h2>
                </div>
           </nav>
           <article>
                 <div class="bg">
                     <div class="notice ">
                            <table>
                                <tr>
                                    <td>编号</td>
                                    <td>标题</td>
                                    <td>发布时间</td>
                                    <td>发布人</td>
                                    <td>操作</td>
                                </tr>
                <c:forEach items="${pageBean.list}" var="n" >
					<tr>
						<td id="notice_id">${n.id }</td>
						<td><a onclick="init_content(${n.id })">${n.title }</a></td>
						<td>${n.time}</td>
						<td>管理员-444216</td>
						<td><a onclick="if(confirm('确定删除吗')) window.location='/oa_v3/delete_notice.action?id=${n.id}'">删除</a>
						&nbsp;&nbsp;<a href="/oa_v3/findById_notice.action?id=${n.id}">修改</a></td>
					</tr>
				</c:forEach>
                      
                               
                            </table>

                            <div class="info">
                                 <h4>公告详情</h4>
                                 <textarea   readonly>清明3天小长假，加班的双倍工资</textarea>
                            </div>
                    </div>
                 </div>
                             	 <div class="top">
	<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>

	<c:if test="${pageBean.curPage!=1}">

 		<a href="/oa_v3/findWithPage_notice.action?curPage=1">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
	<a href="/oa_v3/findWithPage_notice.action?curPage=${pageBean.prePage}" >上一页</a>
	<a href="/oa_v3/findWithPage_notice.action?curPage=${pageBean.nextPage}" >下一页</a>
	<a href="/oa_v3/findWithPage_notice.action?curPage=${pageBean.totalPage}">末页</a>

</div>
         </article>
    </main>
  <jsp:include page="/admin/inc/footer.jsp"/>
  
  <script>
	
  	init_content($("#notice_id").html());
  	
  
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
	  	      $(".info textarea").val(string);
	  	
	  	    }, 100)
	  	})
  	}
  
  </script>
</body>
</html>