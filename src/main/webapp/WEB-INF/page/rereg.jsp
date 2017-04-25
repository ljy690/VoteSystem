<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>激活失败</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<div id="header" class="wrap">
	<img src="images/logo.gif" />
</div>
<div id="message" class="box">
	<h2>提示信息</h2>
	<div class="content">
		<p>您激活的账号不存在！请确认账号无误后再进行激活。</p>
		<br/>
		<p><a href="user/register">点此返回注册界面&gt;&gt;</a></p>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
