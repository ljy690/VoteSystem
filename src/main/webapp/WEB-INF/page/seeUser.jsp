<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="voteUser" class="com.jy.vote.entity.VoteUser"
	scope="request" />
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看用户信息</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link href="css/foundation.min.css" rel="stylesheet" type="text/css">
<link href="css/foundation-datepicker.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="top.jsp" />
	<div id="register" class="box">
		<h2>查看用户信息</h2>
		<div class="content">
			<f:form style="margin:0 auto;" id="changeInfo"> 
				<dl>
					<dt>用户ID：</dt>
					<dd>
						<span>${seeUser.vuId }</span>
					</dd>
					<dt>用户名：</dt>
					<dd>
						<span>${seeUser.vuUsername }</span>
					</dd>
					<dt>出生日期：</dt>
					<dd>
						<span>${seeUser.vuDate0}</span>
					</dd>
  					<dt>性别：</dt>
					<dd>
						<span>${seeUser.vuSex }</span>
					</dd>
					<dt>电子邮箱：</dt>
					<dd>
						<span>${seeUser.vuEmail}</span>
					</dd>
					<dt>用户状态：</dt>
					<dd>
						<c:if test="${seeUser.vuStatus==1}">
							<span>未激活</span>
						</c:if>
						<c:if test="${seeUser.vuStatus==2}">
							<span>已激活</span>
						</c:if>
						<c:if test="${seeUser.vuStatus==3}">
							<span>已删除</span>
						</c:if>
					</dd>
					<dt>最后修改时间：</dt>
					<dd>
						<c:choose>
							<c:when test="${seeUser.vuUpTime0!=null}">
								<span>${seeUser.vuUpTime0}</span>
							</c:when>
							<c:otherwise>
								<span>空</span>
							</c:otherwise>
						</c:choose>
					</dd>
				</dl>
			</f:form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	
	<script src="js/jquery-1.11.3.min.js"></script>
</body>
</html>
