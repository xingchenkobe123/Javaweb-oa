<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="cn.sjzc.edu.po.Worker"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>OA办公系统--权限管理--分配权限</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/admin_index.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/private.css">
</head>
<body>
	<jsp:include page="/admin/inc/aside.jsp" />
	<main> <jsp:include page="/admin/inc/header.jsp" />
	<nav>
		<div class="nav_box ">
			<h1>权限管理</h1>
			<h2>
				<a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a>-->分配权限<span></span>
			</h2>
		</div>
	</nav>
	<article>
		<div class="tip">
			<span>修改职员权限</span>
		</div>

		<div class=font_box>
			<p></p>
		</div>

		<table>
	
			<h3>
				<button id="ntn_ok">确定</button>
				<button id="ntn_no">取消</button>
			</h3>
			<tr>
				<td>工号</td>
				<td>姓名</td>
				<td>部门</td>
				<td>小组</td>
				<td>等级</td>

			</tr>
			<c:forEach items="${pageBean.list}" var="p">
				<tr>
					<td id="tid">${p.id }</td>
					<td>${p.name }</td>
					<td>${p.branch}</td>
					<td>${p.group}</td>
					<td><input type=Number  value="${p.lv }"min="1"
						max="3"></td>
				</tr>
			</c:forEach>
		
		</table>
		<div class="top">
			<c:if test="${pageBean.curPage==1}">
	 第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>

			<c:if test="${pageBean.curPage!=1}">

				<a href="/oa_v3/findWithPage_worker_private.action?curPage=1">首页</a> 
 		第${pageBean.curPage}页/ 共${pageBean.totalPage}页 
	</c:if>
			<a
				href="/oa_v3/findWithPage_worker_private.action?curPage=${pageBean.prePage}">上一页</a>
			<a
				href="/oa_v3/findWithPage_worker_private.action?curPage=${pageBean.nextPage}">下一页</a>
			<a
				href="/oa_v3/findWithPage_worker_private.action?curPage=${pageBean.totalPage}">末页</a>

		</div>
	</article>
	</main>
	<jsp:include page="/admin/inc/footer.jsp" />

	<script>
		$(".tip").css("cursor", "pointer");

		$(".tip").click(function() {
			var str = "1,2,3,三个等级分别对应普通职员，小组组长，部门主管三个权限，本系统中人事部主管相当于超级管理员";
			var string = "";
			var idx = -1;
			var timer = setInterval(function() {

				idx++;
				if (idx == str.length) {
					clearInterval(timer);
				}
				string += str.charAt(idx);
				$(".font_box p").html(string);
				$(".font_box p").css("color", "#2ecc71")
				$(".font_box p").css("fontSize", "24px")

			}, 100)
			setTimeout(function() {
				$(".font_box p").html("");
			}, 12000)
		})
		
		setInterval(function(){
            var arr=['red','orange','#000','green','#27ae60','skyblue','purple'];
            var idx=parseInt(Math.random()*7);
            $(".tip").css('color',arr[idx]);
        },1000)
        
        
        for(var i=0;i<3;i++){
        	
        	 $("input[type=Number]").change(function(){
        		var lv= $(this).val();
            	   $("button").fadeIn(1500);
                   $("#ntn_ok").on('click',function(){
                	   
                	 	$.post("/oa_v3/edit_worker_private.action",{"id":$("#tid").html(),"lv":lv},function(data){
                       		 if(data=="1"){
                       			window.location.href="/oa_v3/findWithPage_worker_private.action?curPage=1";
                       		}
                       	})
                       	return false;
               	})
               	
               	$("#ntn_no").on('click',function(){
               		window.location.href="/oa_v3/findWithPage_worker_private.action?curPage=1";
               			
               	})
    		
             })
             
             	
        }
         	
		
		
        
              
        
	</script>

</body>
</html>