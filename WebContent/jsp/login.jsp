
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>恒宇科技自动化办公系统--职员登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/login.css">
</head>
<body>
    <div class="dowebok">
        <div class="logo"></div>
        <div class="form-item">
            <input id="username" type="text" placeholder="账号">
            <p class="tip" id="tip_u"></p>
        </div>
        <div class="form-item">
            <input id="password" type="password" placeholder="密码">
            <p class="tip" id="tip_p"></p>
        </div>
        <div class="form-item"><button id="submit">登 录</button></div>
      
    </div>
     <script src="${pageContext.request.contextPath}/jsp/js/jquery.min.js"></script>
    <script>
    $("input[type=text]").blur(function() {
        
        var $phone= $("input[type='text']").val();
        
        if(!/^[\d]{11}$/.test($phone)){
            $("#tip_u").fadeIn(1000).fadeOut(1000).html("请输入长度为11位的手机号").css("color","red");
            return;
        }
        
        $.post('${pageContext.request.contextPath}/w_findByPhone.action', {
            "phone" :$phone
            
        }, function(data) {
            if (data == "-1") {
                $("#tip_u").fadeIn(1000).fadeOut(1000).html("手机号不存在");
            }
        })
    })


    
      //敲回车登录 
    document.onkeydown = function (event) {
        var e = event || window.event;
        if (e && e.keyCode == 13) { 
            doLogin();// 执行登录
        }
    };
    
    
    
    $("#submit").click(function() {
        doLogin();
    })
    
    //  登录处理函数
    function doLogin(){
        //       正则验证密码,限制密码长度为2-6
        //      \d表示匹配任意数字
        //      /^[\d]{6,16}$/,^ $/     严格模式匹配
    
        var $pwd= $("input[type='password']").val();
        if(!/^[\d]{6,16}$/.test($pwd)){
            $("#tip_p").fadeIn(1000).fadeOut(1000).html("请输入长度为6-16位的密码").css("color","red");
            return;
        }
        
        $.post('${pageContext.request.contextPath}/workerLogin.action', {
            "phone" : $("input[type='text']").val(),
            "pwd" : $("input[type='password']").val()
        }, function(data) {
            if (data == "-1") {
                $("#tip_p").fadeIn(1000).fadeOut(1000).html("密码错误");
            }else{
                window.location.href="${pageContext.request.contextPath}/index.jsp"
            }
        })
    }
        
    </script>


</body>
</html>