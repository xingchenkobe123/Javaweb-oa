<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>事务中心--我的事务</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/css/show_transaction.css">
<style>
button {
	width: 60px;
	border: none;
	padding: 4px;
	display:none;
}

#ntn_ok {
	background: #2ecc71;
	color: #fff;
	margin-right:20px;
}

#ntn_no {
	background: red;
	color: #fff;
}
h1{
margin:0 auto 20px auto;
width:200px;
}
</style>
</head>

<body>
	<jsp:include page="/jsp/inc/nav.jsp" />
	<main>
	<article>
		<div class="bg">
			<div class="show_log">
				<h1>
					<button id="ntn_ok">同意</button><button id="ntn_no" >拒绝</button>
				</h1>
				<table>
					<tr>
						<td>编号</td>
						<td>申请人</td>
						<td>类型</td>
						<td>时长</td>
						<td>申请事由</td>
						<td>审批人</td>
						<td>抄送人</td>
						<td>审批状态</td>
						<td>审批结果</td>

					</tr>
					<c:forEach items="${pageBean.list}" var="n">
						<tr>
							<td>${n.id}</td>
							<td>${n.name}</td>
							<td>${n.type}</td>
							<td>${n.last}</td>
							<td>${n.reason}</td>
							<td>${n.approver}</td>
							<td>${n.copy}</td>
							<td class="stateList">${n.state}</td>
							<td class="resultList">${n.result}</td>

						</tr>
					</c:forEach>
				</table>

				<div id="mytop">
					<c:if test="${pageBean.curPage==1}"> 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 </c:if>
					<c:if test="${pageBean.curPage!=1}">
						<a
							href="/oa_v3/findMyTransaction.action?curPage=1&approver=${loginWorker.name}">首页</a>
						第${pageBean.curPage}页/ 共${pageBean.totalPage}页
					</c:if>
					<a
						href="/oa_v3/findMyTransaction.action?curPage=${pageBean.prePage}&approver=${loginWorker.name}">上一页</a>
					<a
						href="/oa_v3/findMyTransaction.action?curPage=${pageBean.nextPage}&approver=${loginWorker.name}">下一页</a>
					<a
						href="/oa_v3/findMyTransaction.action?curPage=${pageBean.totalPage}&approver=${loginWorker.name}">末页</a>
				</div>

			</div>
			<div class="left_ul">
				<aside>
					<div class="avatar">
						<img src="${pageContext.request.contextPath}/jsp/img/logo.jpg">
					</div>
					<ul>
						<li>
							<p>事务申请</p>
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/jsp/add_transaction.jsp?type=1">加班申请</a></li>
								<li><a
									href="${pageContext.request.contextPath}/jsp/add_transaction.jsp?type=2">倒休申请</a></li>
								<li><a
									href="${pageContext.request.contextPath}/jsp/add_transaction.jsp?type=3">请假申请</a></li>
								<li><a
									href="${pageContext.request.contextPath}/jsp/add_transaction.jsp?type=4">出差申请</a></li>
								<li><a
									href="${pageContext.request.contextPath}/jsp/add_transaction.jsp?type=5">入职申请</a></li>
								<li><a
									href="${pageContext.request.contextPath}/jsp/add_transaction.jsp?type=6">转正申请</a></li>
								<li><a
									href="${pageContext.request.contextPath}/jsp/add_transaction.jsp?type=7">外出申请</a></li>
								<li><a
									href="${pageContext.request.contextPath}/jsp/add_transaction.jsp?type=8">调岗申请</a></li>
								<li><a
									href="${pageContext.request.contextPath}/jsp/add_transaction.jsp?type=9">离职申请</a></li>

							</ul>
						</li>
						<li>
							<p>事务一览</p>
							<ul>
								<li><a
									href="/oa_v3/findWithPage_transaction_name.action?curPage=1&name=${loginWorker.name}">我发起的</a></li>
								<c:if test="${ loginWorker.lv!=1}">
									<li><a
										href="/oa_v3/findMyTransaction.action?curPage=1&approver=${loginWorker.name}">我审批的</a></li>
								</c:if>

							</ul>
						</li>

					</ul>
				</aside>
			</div>
		</div>
	</article>
	</main>
	<jsp:include page="/jsp/inc/footer.jsp" />
	 <script >
          var trs=document.querySelectorAll("tr");
          for( var x=0;x<trs.length;x++){
        	  var t=$(trs[x+1]).find("td:eq(7)").html();
              if(t=='待审批'){
            	  $(trs[x+1]).find("td:eq(7)").css("cursor","pointer");
            	  $(trs[x+1]).find("td:eq(7)").click(function(){
                      $("button").fadeIn(1500);
                  });
            	  
            	  //--------------//
            	  $("#ntn_ok").on('click',function(){
            		  for( var j=0;j<trs.length;j++){
            			  var id=$(trs[j+1]).find("td:eq(0)").html();
	                  	$.post("/oa_v3/edit_transaction.action",{"state":"已处理","result":"同意","id":id},function(data){
	                  		if(data==1){window.location.href="/oa_v3/findMyTransaction.action?curPage=1&approver=${loginWorker.name}"}
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
	                  			window.location.href="/oa_v3/findMyTransaction.action?curPage=1&approver=${loginWorker.name}"
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