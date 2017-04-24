<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码成功</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="top.jsp" />
<div id="message" class="box">
	<h2>提示信息</h2>
	<div class="content">
		<p>恭喜：${currUser.vuUsername }，修改密码成功！<a href="user/jumpLogin">点此返回登录界面&gt;&gt;</a></p>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
