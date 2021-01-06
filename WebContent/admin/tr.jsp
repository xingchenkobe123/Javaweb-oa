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
    <title>OA办公系统--事务管理--事务审批</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_index.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/transaction.css">
</head>
<body>
    <jsp:include page="/admin/inc/aside.jsp"/>
    <main>
             <jsp:include page="/admin/inc/header.jsp"/>
          <nav >
                <div class="nav_box ">
                    <h1>事务管理</h1>
                    <h2><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->事务审批<span></span></h2>
                </div>
           </nav>
           <article>

             <table>

             <h3><button id="ntn_ok">同意</button><button id="ntn_no" >拒绝</button></h3>
                <tr >
                    <td>编号</td>
                    <td>申请人</td>
                    <td>申请时间</td>
                    <td>所在部门</td>
                    <td>类型</td>
                    <td>时长</td>
                    <td>事由</td>
                    <td>审批人</td>
                    <td>抄送人</td>
                    <td>审批状态</td>
                    <td>审批结果</td>
                    <td>操作</td>
                </tr>

                <c:forEach items="${pageBean.list}" var="t" >
					<tr>
						<td	 >${t.id }</td>
						<td>${t.name }</td>
						<td>${t.start}</td>
						<td>${t.branch}</td>
						<td>${t.type }</td>
						<td>${t.last }</td>
						<td>${t.reason}</td>
						<td>${t.approver }</td>
						<td>${t.copy }</td>
						<td >${t.state}</td>
						<td >${t.result}</td>
						
						<td>
							<a onclick="if(confirm('确定删除吗')) window.location='/oa_v3/delete_transaction.action?id=${t.id}'">删除</a>
						</td>
					</tr>
				</c:forEach>
               

            </table>
 <div id="top">
	<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>

	<c:if test="${pageBean.curPage!=1}">

 		<a href="/oa_v3/findWithPage_transaction.action?curPage=1">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
	<a href="/oa_v3/findWithPage_transaction.action?curPage=${pageBean.prePage}" >上一页</a>
	<a href="/oa_v3/findWithPage_transaction.action?curPage=${pageBean.nextPage}" >下一页</a>
	<a href="/oa_v3/findWithPage_transaction.action?curPage=${pageBean.totalPage}">末页</a>

</div>
                 

           </article>
    </main>
   <footer>
      Copyright 2019 石家庄学院--自动化办公系统
 </footer>
<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/admin_index.js"> </script>
    <script >
          var trs=document.querySelectorAll("tr");
          for( var x=0;x<trs.length;x++){
        	  var t=$(trs[x+1]).find("td:eq(9)").html();
              if(t=='待审批'){
            	  $(trs[x+1]).find("td:eq(9)").css("cursor","pointer");
            	  $(trs[x+1]).find("td:eq(9)").click(function(){
                      $("button").fadeIn(1500);
                  });
            	  
            	  //--------------//
            	  $("#ntn_ok").on('click',function(){
            		  for( var j=0;j<trs.length;j++){
            			  var id=$(trs[j+1]).find("td:eq(0)").html();
	                  	$.post("/oa_v3/edit_transaction.action",{"state":"已处理","result":"同意","id":id},function(data){
	                  		if(data==1){window.location.href="/oa_v3/findWithPage_transaction.action?curPage=1"}
	                  	})
                  	}
              		　return false;
              	})
              	
              	
              	
              	//-------------//
              	$("#ntn_no").on('click',function(){
              		 for( var k=0;k<trs.length;k++){
              			 var id=$(trs[k+1]).find("td:eq(0)").html();
	                  	$.post("/oa_v3/edit_transaction.action",{"state":"已处理","result":"拒绝","id":id},function(data){
	                  		if(data==1){
	                  			window.location.href="/oa_v3/findWithPage_transaction.action?curPage=1"
	                  		}
	                  	})
              		 }
              		　return false;
              	})
                } 
               
               
          }
       
       
         
     
    </script>
</body>
</html>