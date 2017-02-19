<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fs"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看投票</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="top.jsp" />
<div id="vote" class="wrap">
	<h2>查看投票</h2>
	<ul class="list">
		<li>
			<input type="hidden" name="vsId" id="vsId" value="${options[0].vsId }"/>
			<h4>${options[0].vsTitle }</h4>
			<p class="info">共有${fs:length(options) }个选项，已有${options[0].voteAllCount }个网友参与了投票。 </p>
				<ol>
					<c:forEach items="${options}" var="voteOption">
						<li>
							<div>${voteOption.voOption}</div>
							<div class="rate">
								<div class="ratebg"><div class="percent" style='width:<c:choose>
									<c:when test="${voteOption.voteUserCount == 0}">0</c:when>
									<c:otherwise><fmt:formatNumber value="${voteOption.voteUserCount/voteOption.voteAllCount}" type="percent" maxFractionDigits="2"/></c:otherwise>
								</c:choose>'></div></div>
								<p><span>(<c:choose>
									<c:when test="${voteOption.voteUserCount == 0}">0</c:when>
									<c:otherwise><fmt:formatNumber value="${voteOption.voteUserCount/voteOption.voteAllCount}" type="percent" maxFractionDigits="2"/></c:otherwise>
								</c:choose>)</span>${vocount}票</p>
							</div>
						</li>
					</c:forEach> 
				</ol>
				<div class="goback"><a href="Subject!list.action?entityId=<s:property value='subject.id'/>">返回投票列表</a></div>
		</li>
	</ul>
</div>
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/view.js"></script>
</body>
</html>
