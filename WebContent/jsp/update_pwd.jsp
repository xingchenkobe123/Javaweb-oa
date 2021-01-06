<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
    <title>修改密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/update_pwd.css">
 
</head>

<body>
      <jsp:include page="/jsp/inc/nav.jsp"/>
    <main>
        <div class="pwd_box">
            <div class="header">
                <a href="/">
                    <img src="${pageContext.request.contextPath}/jsp/img/logo.jpg"  width="200px">
                </a>
                <h3>修改密码</h3>
            </div>
            <form action="/oa_v3/edit_pwd.action" method="post">
                <p>
                     <input id="one_pwd" type="password" name="pwd" placeholder="新密码" required  minLength="6" maxLength="16">
                </p>
                <p>
                    <input id="two_pwd" type="password"  placeholder="确认密码" required  minLength="6" maxLength="16">
                    <input type="hidden"  name="id" value="${loginWorker.id}">
                </p>
                <input type="submit" value="确认修改">
            </form>
        </div>
        </div>
    </main>
     <jsp:include page="/jsp/inc/footer.jsp"/>
    <script>
    
    
    $("#one_pwd").blur(function(){
    	if($(this).val().length<6||$(this).val().length>16){
    		alert("密码长度不合法，请将密码长度控制在6-16位");
    		$("input[type=submit]").css("cursor","not-allowed");
    		$("input[type=submit]").attr("disabled",true);
    		
    	}
    	if($(this).val()=="123456"){
    		alert("新密码不得与初始密码相同");
    		$("input[type=submit]").css("cursor","not-allowed");
    		$("input[type=submit]").attr("disabled",true);
    	
    	}else{
    		$("input[type=submit]").css("cursor","pointer");
    		$("input[type=submit]").removeAttr("disabled");
    	}
    })
    
    $("#two_pwd").blur(function(){
    
    if($("#one_pwd").val()!=$("#two_pwd").val()){
    		alert("输入的两次密码不一致,请检查!");
    		$("input[type=submit]").css("cursor","not-allowed");
    		$("input[type=submit]").attr("disabled",true);
    	}else{
    		$("input[type=submit]").css("cursor","pointer");
    		$("input[type=submit]").removeAttr("disabled");
    	}
    
    
    })
    
    
    $("input[type=submit]").click(function(){
    	
    	
    	
    })

    	
    </script>
</body>

</html>