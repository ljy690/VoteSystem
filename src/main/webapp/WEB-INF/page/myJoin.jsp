<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理投票</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/pageCode.css" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery.page.js"></script>
<script type="text/javascript" src="js/myJoinVote.js"></script>
</head>
<body>
	<jsp:include page="top.jsp" />
	<div id="vote" class="wrap">
		<h2>我发起的投票</h2>
		<ul class="list" id="myJoinSubjectList">
			
		</ul>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
