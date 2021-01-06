<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>恒宇科技自动化办公系统--管理员登陆</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/admin_login.css">
</head>

<body>
	<div class="main">
	 <span></span>
		<div class="header">
		 
			<a href="/"> 
				<img src="${pageContext.request.contextPath}/admin/img/logo.jpg"  width="200px">
			</a>
			<h3>OA-Admin-Login</h3>
		</div>
		<form >
			<div class="form-group">
				<label> 
					<input type="search" class="form-control"  placeholder="account" required >
				</label>
			</div>
			<div class="form-group">
				<label> 
					<input type="password" class="form-control"  placeholder="password" required="required" minLength="6" maxLength="16">
				</label>
			  <input  type="button" value="登录" >
		</form>
		<div class="message">
			<p>Copyright 恒宇科技 © 2019</p>
		</div>
	</div>
	</div>
	<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script>
$(".header a img").attr("src","${pageContext.request.contextPath}/admin/img/logo.jpg")
	
		

 	$("input[type=search]").blur(function(){
 		var 	$account= $("input[type='search']").val();
			
				
			
				if(!/^[\d]{6}$/.test($account)){
					$("span").fadeIn(2000).fadeOut(1500).html("账号不合法").css({"color":"red","fontSize":"24px"})
					return;
				}

			 $.post("/oa_v3/findByAccount.action",{"account":$account,"c":new Date()},function(data){
 			
 			if(data=="-1"){
 				$("span").fadeIn(2000).fadeOut(1500).html("账号不存在").css({"color":"red","fontSize":"24px"})
 			}else{
 				$(".header a img").attr("src","${pageContext.request.contextPath}/"+data);
 				$(".header a img").css({"marginBottom":"20px","borderRadius":"50%"});
 			}	
 		})
 	})
 	
 	$("input[type=button]").click(function(){
 		doLogin()
 	})
 	
  //敲回车登录 
    document.onkeydown = function (event) {
        var e = event || window.event;
        if (e && e.keyCode == 13) { 
        	doLogin();// 执行登录
        }
    }
 	
 	//	登录处理函数
 		function doLogin(){
		
			//     	正则验证密码,限制密码长度为6,16
			//	    \d表示匹配任意数字
			//		/^[\d]{6,16}$/,^ $/     严格模式匹配

			var $pwd= $("input[type='password']").val();
			if(!/^[\d]{6,16}$/.test($pwd)){
				$("span").fadeIn(2000).fadeOut(1500).html("密码不合法").css({"color":"red","fontSize":"24px"})
				return;
			}
		
		
			
	 	$.post("/oa_v3/adminLogin.action",{"account":$("input[type='search']").val(),"pwd":$("input[type='password']").val()},function(data){
	 			 if(data=="-1"){
	 				$("span").fadeIn(2000).fadeOut(1500).html("密码错误").css({"color":"red","fontSize":"24px"})
	 			}else{
	 				window.location.href="${pageContext.request.contextPath}/admin/index.jsp"
	 			}	 
	
	 		})
		
 	}
	</script>
</body>

</html>
