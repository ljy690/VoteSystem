<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>

</head>
<body>
	<div id="header" class="wrap">
		<img src="images/logo.gif" />
	</div>
	<div id="login" class="wrap">
		<div class="main">
			<div class="corner"></div>
			<div class="introduce">
				<h2>登录页面</h2>
				<p>网上投票系统...</p>
			</div>
			<div class="login">
				<h2>用户登录</h2>
				<form method="post" action="user/login">
					<dl id="loginBox">
						<dt>用户名：</dt>
						<dd>
							<input type="text" class="input-text" name="vuUsername"
								placeholder="请输入您的用户名..." required="required"/>
						</dd>
						<dt>密 码：</dt>
						<dd>
							<input type="password" class="input-text" name="vuPassword"
								placeholder="请输入您的密码..." required="required"/>
						</dd>
						<dt></dt>
						<!-- Register.action -->
						<dd>
							<button class="input-button" >登陆</button>
							<a href="user/register">新用户注册</a>
						</dd>
					</dl>
				</form>
				<div class="error">${errorMsg }</div>
			</div>
		</div>
	</div>
	<div class="wrap"></div>
	<jsp:include page="footer.jsp" />
</body>
</html>
