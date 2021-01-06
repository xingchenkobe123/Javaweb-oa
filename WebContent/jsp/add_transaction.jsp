<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (request.getSession().getAttribute("loginWorker") == null) {
		response.sendRedirect("../jsp/login.jsp");
	}
SimpleDateFormat sdf = (SimpleDateFormat)DateFormat.getDateTimeInstance();

String start= sdf.format(new Date());

%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>事务中心--事务申请</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/css/add_transaction.css">
</head>

<body>
	<jsp:include page="/jsp/inc/nav.jsp" />
	<main>
	<article>
		<div class="bg">
			<article>
				<form action="/oa_v3/add_transaction_show.action" method="post">

					<c:if test="${param.type==1}">
						<legend>加班申请</legend>
					</c:if>
					<c:if test="${param.type==2}">
						<legend>倒休申请</legend>
					</c:if>
					<c:if test="${param.type==3}">
						<legend>请假申请</legend>
					</c:if>
					<c:if test="${param.type==4}">
						<legend>出差申请</legend>
					</c:if>
					<c:if test="${param.type==5}">
						<legend>入职申请</legend>
					</c:if>
					<c:if test="${param.type==6}">
						<legend>转正申请</legend>
					</c:if>
					<c:if test="${param.type==7}">
						<legend>外出申请</legend>
					</c:if>
					<c:if test="${param.type==8}">
						<legend>调岗申请</legend>
					</c:if>
					<c:if test="${param.type==9}">
						<legend>离职申请</legend>
					</c:if>
					<input type="hidden" name="name" value="${loginWorker.name}">
					</p>
					<c:if test="${loginWorker.lv==1}">
						<p>
							审批人：<input type="search" id='approver' name="approver"
								readonly="readonly">
						</p>
					</c:if>
					<c:if test="${loginWorker.lv==2}">
						<p>
							审批人：<input type="search" id='approver' name="approver"
								readonly="readonly">
						</p>
					</c:if>
					<c:if test="${loginWorker.lv==3}">
						<p>
							审批人：<input type="search" value="人事部主管张恒" name="approver"
								readonly="readonly">
						</p>
					</c:if>
					<c:if test="${loginWorker.lv!=1 }">
						<p>
							抄送人：<input type="search" name="copy" readonly="readonly">
						</p>
					</c:if>
					<c:if test="${loginWorker.lv==1 }">
						
						<input type="hidden" name="copy" value="---">
						
					</c:if>
					<p>
						<span id="branch">${loginWorker.branch }</span> 
						<span id="group">${loginWorker.group }</span>
						<span id="lv">${loginWorker.lv }</span>
					<p>
					<input type="hidden" name="state" value="待审批">
					<input type="hidden" name="result" value="请等待">
					<input type="hidden" name="branch" value="${loginWorker.branch }">
					<c:if test="${param.type==1}">
						<input type="hidden" name="type" value="加班">
					</c:if>
					<c:if test="${param.type==2}">
						<input type="hidden" name="type" value="倒休">
					</c:if>
					<c:if test="${param.type==3}">
						<input type="hidden" name="type" value="请假">
					</c:if>
					<c:if test="${param.type==4}">
						<input type="hidden" name="type" value="出差">
					</c:if>
					<c:if test="${param.type==5}">
						<input type="hidden" name="type" value="入职">
					</c:if>
					<c:if test="${param.type==6}">
						<input type="hidden" name="type" value="转正">
					</c:if>
					<c:if test="${param.type==7}">
						<input type="hidden" name="type" value="外出">
					</c:if>
					<c:if test="${param.type==8}">
						<input type="hidden" name="type" value="调岗">
					</c:if>
					<c:if test="${param.type==9}">
						<input type="hidden" name="type" value="离职">
					</c:if>
						事由<br>
						<textarea name="reason" id="" cols="40" rows="5"></textarea>
						<br> 
						<input type="hidden" name="start" value="<%=start%>">
						持续时长：<input type="search" name="last"  placeholder="请输入持续时长--可选">
						<br> 
						<input type="submit" value="确认申请" /> 
						<input type="reset" value="重新填写" />

					</p>
				</form>
			</article>
		</div>
		<div class="left_ul">
			<aside>
				<div class="avatar">
					<img src="${pageContext.request.contextPath}/jsp/img/logo.jpg">
				</div>
				<ul>
					<li>
						<p>事务申请</p>


						<ul id="myUl">
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
									href="/oa_v3/findWithPage_transaction_name.action?curPage=1&name=${loginWorker.name}">我审批的</a></li>
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
	<script>
		$(function() {
			$.post("/oa_v3/findApprover.action", {
				"branch" : $("#branch").html(),
				"group" : $("#group").html(),
				"lv" : parseInt($("#lv").html())+1
			}, function(data) {
				$("#approver").val(data)
			})
		})
	</script>
</body>

</html>