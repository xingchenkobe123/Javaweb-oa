<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (request.getSession().getAttribute("loginWorker") == null) {
		response.sendRedirect("../jsp/login.jsp");
	} 
%>
  
    
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/css/record.css">
    <title>考勤打卡</title>
</head>

<body>
    <jsp:include page="/jsp/inc/nav.jsp"/>
    <div id="allmap"></div>
    <main>
        <p>已进入工作范围，点击右侧按钮进行打卡</p>
        <div class="btn_box">
            <button id="go_work">上班打卡</button>
            <button id="no_work">下班打卡</button>
        </div>
    </main>
</body>

</html>

 <jsp:include page="/jsp/inc/footer.jsp"/>
<script type="text/javascript">
//百度地图API功能
function loadJScript() {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "http://api.map.baidu.com/api?v=2.0&ak=GdPcOo90cXvYKhkCA26ZEvCgQVilTGAn&callback=init";
    document.body.appendChild(script);
}

function init() {
    var map = new BMap.Map("allmap"); // 创建Map实例
    var point = new BMap.Point(114.5943690600, 38.0181921300); // 创建点坐标
    map.centerAndZoom(point, 13);


}
window.onload = loadJScript;
</script>
<script type="text/javascript">
function change_color() {
    var color_arr = ['a', 'b', 'c', 'd', 'e', 'f', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    var str = "#";
    var font_color = "";
    function getColor() {
        var num = parseInt(Math.random() * 16)
        str += color_arr[num];
        return str;
    }
    for (var i = 0; i < 6; i++) {
        font_color = getColor();
    }
    return font_color;
}
setInterval(function() {
    $("p").css("color", change_color())

}, 1000)

</script>

<script type="text/javascript">


	var click_flag=false;
	var start=null;
	$("#go_work").click(function(){

		start=new Date().toLocaleString();
		click_flag=true;

		alert("上班打卡成功");
	})


	$("#no_work").click(function(){

		if(!click_flag){
			alert("尚未上班打卡，不可下班打卡");
			return;
		}

		alert("下班打卡成功");
		
		$.post("/oa_v3/add_record.action",
				{"name":'${loginWorker.name}',
			"branch":"${loginWorker.branch}",
			"start":start,
			"over":new Date().toLocaleString()
			}
		,function(data){
			if(data=="1"){
				window.location.href="${pageContext.request.contextPath}/index.jsp"
			}
		})
		
	})
	


</script>