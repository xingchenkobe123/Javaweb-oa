<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (request.getSession().getAttribute("loginWorker") == null) {
		response.sendRedirect("../jsp/login.jsp");
	} 
%>
  
  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>公告一览</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/show_notice.css">
</head>

<body>
     <jsp:include page="/jsp/inc/nav.jsp"/>
    <main>
        <article>
            <div class="bg">
                <div class="notice ">
                    <table>
                        <tr>
                            <td>编号</td>
                            <td>标题</td>
                            <td>发布人</td>
                            <td>发布时间</td>
                        </tr>
                        <c:forEach items="${pageBean.list}" var="n" >
					<tr>
						<td id="notice_id">${n.id }</td>
						<td><a onclick="init_content(${n.id })">${n.title }</a></td>
						<td>管理员--444216</td>
						<td>${n.time}</td>
					</tr>
				</c:forEach>
                      
                        
                    </table>
                    <div class="info">
                        <h4>公告详情</h4>
                        <textarea readonly>清明3天小长假，加班的双倍工资</textarea>
                    </div>
                </div>
            </div>
            
                             	 <div id="top">
	<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>

	<c:if test="${pageBean.curPage!=1}">

 		<a href="/oa_v3/findWithPage_notice_show.action?curPage=1">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
	<a href="/oa_v3/findWithPage_notice_show.action?curPage=${pageBean.prePage}" >上一页</a>
	<a href="/oa_v3/findWithPage_notice_show.action?curPage=${pageBean.nextPage}" >下一页</a>
	<a href="/oa_v3/findWithPage_notice_show.action?curPage=${pageBean.totalPage}">末页</a>

</div>
        </article>
    </main>
     <jsp:include page="/jsp/inc/footer.jsp"/>
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