<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta charset="utf-8" />
<title>投票列表</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/pageCode.css" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery.page.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
<jsp:include page="top.jsp" />

<div id="vote" class="wrap">
	<h2>投票列表</h2>
	<ul class="list" id="subjectList">
		<%-- <c:forEach items="${sessionScope.subjects}" var="subject" varStatus="status">
			<li <c:if test="${status.index % 2 ==0 }">class="odd"</c:if> >
				<h4>				
					<a href="vote_view.action?vsId=${subject.vsId }">${subject.vsTitle }</a>
				</h4>
				<div class="join"><a href="vote_vote.action?vsId=${subject.vsId }">我要参与</a></div>
				<p class="info">共有 ${subject.optionCount}个选项，已有${subject.voteUserCount }  个网友参与了投票。</p>
			</li>
		</c:forEach> --%>
	</ul>
</div>
<div class="pageDiv" style="width:880px;height:45px;margin:0px auto;">
	<div class="tcdPageCode"></div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
