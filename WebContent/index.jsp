<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
	<%
		if (request.getSession().getAttribute("loginWorker") == null) {
			response.sendRedirect("jsp/login.jsp");
		}
	%>


 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>恒宇科技自动化办公系统--首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/index.css">
</head>

<body>
   
     <jsp:include page="/jsp/inc/nav.jsp"/>
    <main>
        <div class="bg">
            <div class="tip">
                <p>公司简介</p>
            </div>
            <div class="font_box">
                <p></p>
            </div>
        </div>
    </main>
    <jsp:include page="/jsp/inc/footer.jsp"/>
    <script>
    
/*     
    if('${loginWorker.pwd}'=="123456"){
    	alert("系统检测到您正在使用初始密码，请修改密码后重新登录");
    	window.location.href="/oa_v3/jsp/update_pwd.jsp";
    	
    }
     */

    var str = "本公司成立于2015年,发展至今已有四年光景。经过全体员工的不懈努力,本公司行政组织机构日益完善,公司管理制度愈发健全,各部门分工明确,团队凝聚力强,业绩显著。我司核心理念是服务与同行,努力提供最好的服务,与客户达成友好合作关系,争取双赢。";
    
   
    var string = "";
    var idx = -1;
    var timer = setInterval(function() {

        idx++;
        if (idx == str.length) {
            clearInterval(timer);
        }
        string += str.charAt(idx);
        $(".font_box p").html(string);

    }, 100)
    </script>
</body>

</html>