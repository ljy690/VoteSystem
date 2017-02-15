<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="voteUser" class="com.jy.vote.entity.VoteUser"
	scope="request" />
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注 册</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link href="css/foundation.min.css" rel="stylesheet" type="text/css">
<link href="css/foundation-datepicker.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="header" class="wrap">
		<img src="images/logo.gif" />
	</div>
	<!-- <div id="navbar" class="wrap">
	<div class="search">
	 
		<form method="get" action="index.html">
			<input type="text" name="keywords" class="input-text" /><input type="submit" name="submit" class="input-button" value="" />
		</form>
		
	</div>
</div> -->
	<div id="register" class="box">
		<h2>新用户注册</h2>
		<div class="content">
			<f:form method="post" action="user/register"
				modelAttribute="voteUser" style="margin:0 auto;">
				<dl>
					<dt>用户名：</dt>
					<dd>
						<f:input path="vuUsername" class="input-text" required="required"
							placeholder="请输入您的用户名" onblur="checkUsename(this)"/>
						<f:errors path="vuUsername" class="cssErrors"></f:errors>
					</dd>
					<dd id="nameinfo">用户名支持字母、数字以及"_",限制4-12个字符</dd>
					<dt>出生日期：</dt>
					<dd>
						<f:input type="text" id="demo-1" path="vuDate" class="input-text"
							value=" " required="required" placeholder="请选择您的出生年月" onblur="checkBri(this)"/>
						<f:errors path="vuDate" class="cssErrors"></f:errors>
					</dd>
					<dt>密码：</dt>
					<dd>
						<f:input path="vuPassword" type="password" class="input-text"
							required="required" placeholder="请输入您的密码" />
						<f:errors path="vuPassword" class="cssErrors"></f:errors>
					</dd>
					<dd id="pwinfo">密码支持英文字母，限制6-18个字符</dd>
					<dt>确认密码：</dt>
					<dd>
						<f:input type="password" class="input-text" path="confirmPassword"
							required="required" placeholder="请确认您的密码" />
						<f:errors path="confirmPassword" class="cssErrors"></f:errors>
					</dd>
					<dd id="repwinfo">密码支持英文字母，限制6-18个字符</dd>
					<dt>电子邮箱：</dt>
					<dd>
						<f:input type="email" class="input-text" path="vuEmail"
							required="required" placeholder="请输入您的电子邮箱" />
						<f:errors path="vuEmail" class="cssErrors"></f:errors>
					</dd>
					<dt></dt>
					<dd>
						<input type="submit" class="input-button" name="submit" value=" " />
					</dd>
				</dl>
			</f:form>
			<div class="error">${regErrorMsg }</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	
	<script src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/register.js"></script>
	<script src="js/foundation-datepicker.js"></script>
	<script src="js/foundation-datepicker.zh-CN.js"></script>
	<script type="text/javascript">
		$('#demo-1').fdatepicker();
	</script>
	
</body>
</html>
