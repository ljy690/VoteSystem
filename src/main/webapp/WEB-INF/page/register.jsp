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
	<div id="register" class="box">
		<h2>新用户注册</h2>
		<div class="content">
			<f:form method="post" action="user/register"
				modelAttribute="voteUser" style="margin:0 auto;" id="formInfo"> 
				<dl>
					<dt>用户名：</dt>
					<dd>
						<f:input path="vuUsername" id="voteUserID" class="input-text" required="required"
							placeholder="请输入您的用户名" onblur="checkUsename(this)"/>
						<f:errors path="vuUsername" class="cssErrors"></f:errors>
					</dd>
					<dd id="nameinfo">用户名支持字母、数字以及"_",限制4-12个字符</dd>
					<dt>出生日期：</dt>
					<dd>
						<f:input type="text" id="demo-1" path="vuDate" class="input-text"
							value=" " required="required" placeholder="请选择您的出生年月" onchange="checkBri(this)"/>
						<f:errors path="vuDate" class="cssErrors"></f:errors>
					</dd>
  					<dt>性别：</dt>
					<dd>
						<f:radiobutton  path="vuSex" name="sex" value="male" checked="true"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  						<f:radiobutton  path="vuSex" name="sex" value="female" /> 女
  						<f:errors path="vuSex" class="cssErrors"></f:errors>
  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  						<span id="briInfo"></span>
					</dd>
					<dt>密码：</dt>
					<dd>
						<f:input path="vuPassword" id="voteUserPassID" type="password" class="input-text"
							required="required" placeholder="请输入您的密码" onblur="checkPwd(this)"/>
						<f:errors path="vuPassword" class="cssErrors"></f:errors>
					</dd>
					<dd id="pwinfo">密码支持字母和数字，限制6-18个字符</dd>
					<dt>确认密码：</dt>
					<dd>
						<f:input type="password" id="voteUserRpassID" class="input-text" path="confirmPassword"
							required="required" placeholder="请确认您的密码" onblur="checkRpwd(this)"/>
						<f:errors path="confirmPassword" class="cssErrors"></f:errors>
					</dd>
					<dd id="repwinfo">密码支持字母和数字，限制6-18个字符</dd>
					<dt>电子邮箱：</dt>
					<dd>
						<f:input type="email" id="voteUserEmailID" class="input-text" path="vuEmail"
							required="required" placeholder="请输入您的电子邮箱" onblur="checkEmail(this)"/>
						<f:errors path="vuEmail" class="cssErrors"></f:errors>
					</dd>
					<dd id="emailInfo">邮箱不能以 - _ .以及其它特殊字符开头和结束</dd>
					<dt></dt>
					<dd>
						<input type="button" class="input-button" value=" " onclick="checkRegister()" onblur="cleanErrorInfo()"/>
					</dd>
					<dd  id="registerErroInfo"></dd>
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
