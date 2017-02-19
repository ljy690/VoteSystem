<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta charset="utf-8" />
<title>投票列表</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<%-- <div id="header" class="wrap">
	<img src="images/logo.gif" />
</div>
<div id="navbar" class="wrap">
	<div class="profile">
		<c:choose>
			<c:when test="${sessionScope.loginUser.vuusername eq null}">
				<a href='page/login.jsp'>登录</a>
			</c:when>
			
			<c:otherwise>你好,${sessionScope.loginUser.vuusername }</c:otherwise>
		</c:choose>
		
		<span class="return"><a href="Subject!list.action">返回列表</a></span>
		<span class="addnew"><a href="Subject!read.action">添加新投票</a></span>
		<span class="modify"><a href="Subject!modify.action">维护</a></span>
		
	</div>
	<div class="search">
		<form method="post" action="Subject!search.action">
			<input type="text" name="keywords" class="input-text" value=""/><input type="submit" name="submit" class="input-button" value="" />
		</form>
	</div>
</div> --%>
<jsp:include page="top.jsp" />

<div id="vote" class="wrap">
	<h2>投票列表</h2>
	<ul class="list">
		<c:forEach items="${sessionScope.subjects}" var="subject" varStatus="status">
			<li <c:if test="${status.index % 2 ==0 }">class="odd"</c:if> >
				<h4>				
					<a href="vote_view.action?vsId=${subject.vsId }">${subject.vsTitle }</a>
				</h4>
				<div class="join"><a href="vote_vote.action?vsId=${subject.vsId }">我要参与</a></div>
				<p class="info">共有 ${subject.optionCount}个选项，已有${subject.voteUserCount }  个网友参与了投票。</p>
			</li>
		</c:forEach>
	</ul>
</div>
<div id="footer" class="wrap">
	源辰信息 &copy; 版权所有
</div>
</body>
</html>
