<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<div class="left_ul">
	<aside>
		<div class="avatar">
			<img src="${pageContext.request.contextPath}/jsp/img/logo.jpg">
		</div>
		<ul>
			<li>
				<p>我的日志</p>
				<ul>
					<li><a href="${pageContext.request.contextPath}/jsp/write_mylog.jsp?type=1">写日报</a></li>
					<li><a href="${pageContext.request.contextPath}/jsp/write_mylog.jsp?type=2">写周报</a></li>
					<li><a href="${pageContext.request.contextPath}/jsp/write_mylog.jsp?type=3">写月报</a></li>
					<li><a href="/oa_v3/own_findWithPage_logs.action?curPage=1&name=${loginWorker.name}">查看</a></li>
				</ul>
			</li>
			<%-- <li>
				<p>小组日志</p>
				<ul>
					<li><a href="/oa_v3/group_findWithPage_logs.action?curPage=1&type=4&branch=${loginWorker.branch}&group=${loginWorker.group}">查看</a></li>
				</ul>
			</li> --%>
			<li>
				<p>会议纪要</p>
				<ul>
					<li><a href="${pageContext.request.contextPath}/jsp/write_metting_log.jsp">记录</a></li>
					<li><a href="/oa_v3/own_findWithPage_metting.action?curPage=1&name=${loginWorker.name}">查看</a></li>
				</ul>
			</li>
		</ul>
	</aside>
</div>