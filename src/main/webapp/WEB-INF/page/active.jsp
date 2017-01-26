<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册成功</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<div id="header" class="wrap">
	<img src="images/logo.gif" />
</div>
<div id="navbar" class="wrap">
</div>
<div id="message" class="box">
	<h2>提示信息</h2>
	<div class="content">
		<p>恭喜：注册成功！请进入您的邮箱进行激活操作。<a href="user/jumpLogin">点此返回登录界面</a></p>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
