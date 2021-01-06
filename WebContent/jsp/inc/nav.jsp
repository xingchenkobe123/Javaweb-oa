<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>


<nav>
	<ul>
		<li><a href="${pageContext.request.contextPath}/index.jsp"> 主页</a></li>
		<li><a href="/oa_v3/findAll_branch.action"> 公司结构图</a></li>
		<li><a href="/oa_v3/findWithPage_notice_show.action?curPage=1"> 公告一览</a></li>
		<li><a href="${pageContext.request.contextPath}/jsp/show_record.jsp"> 考勤打卡</a></li>
		<li><a href="/oa_v3/own_findWithPage_logs.action?curPage=1&name=${loginWorker.name}"> 工作日志</a></li>
		<li><a href="/oa_v3/findWithPage_transaction_name.action?curPage=1&name=${loginWorker.name}"> 事务中心</a></li>
		<li class="last"><a href="${pageContext.request.contextPath}/jsp/own.jsp">${loginWorker.name}</a></li>
		<li ><a href="/oa_v3/loginOut.action">退出登录</a></li>
	</ul>
</nav>