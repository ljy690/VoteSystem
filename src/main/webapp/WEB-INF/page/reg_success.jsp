<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>激活成功</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<div id="header" class="wrap">
	<img src="images/logo.gif" />
</div>
<div id="navbar" class="wrap">
	<div class="search">
		<form method="get" action="index.html">
			<input type="text" name="keywords" class="input-text" /><input type="submit" name="submit" class="input-button" value="" />
		</form>
	</div>
</div>
<div id="message" class="box">
	<h2>提示信息</h2>
	<div class="content">
		<p>恭喜用户： ${currUser }：激活成功！<a href="user/jumpLogin">返回登陆界面&gt;&gt;</a></p>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
