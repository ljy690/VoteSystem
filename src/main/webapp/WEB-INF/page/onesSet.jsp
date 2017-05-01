<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${seeUser.vuUsername }发起的投票</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/pageCode.css" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery.page.js"></script>
<script type="text/javascript" src="js/onesub.js"></script>
</head>
<body>
	<jsp:include page="top.jsp" />
	<div id="vote" class="wrap">
		<h2>${seeUser.vuUsername }发起的投票</h2>
		<ul class="list" id="onesSetSubjectList">
			
		</ul>
	</div>
	<div class="pageDiv" style="width:880px;height:45px;margin:0px auto;">
		<div class="tcdPageCode"></div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
