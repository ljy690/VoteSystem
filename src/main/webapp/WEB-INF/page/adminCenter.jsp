<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="voteUser" class="com.jy.vote.entity.VoteUser"
	scope="request" />
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改信息</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link href="css/foundation.min.css" rel="stylesheet" type="text/css">
<link href="css/foundation-datepicker.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="top.jsp" />
	<div id="register" class="box">
		<h2>管理员密码修改</h2>
		<div class="content">
			<f:form method="post" action="user/changeAdminInfo" modelAttribute="voteUser" style="margin:0 auto;" id="changeInfo"> 
				<input type="hidden" name="vuId" value="${currUser.vuId }"/>
				<input type="hidden" name="vuUsername" value="${currUser.vuUsername }"/>
				<dl>
					<dt>用户名：</dt>
					<dd>
						<span>${currUser.vuUsername }</span>
					</dd>
					<dt>修改密码：</dt>
					<dd>
						<f:input path="vuPassword" id="voteUserPassID" type="password" class="input-text"
							required="required" onblur="checkPwd(this)"/>
						<f:errors path="vuPassword" class="cssErrors"></f:errors>
					</dd>
					<dd id="pwinfo">密码支持字母和数字，限制6-18个字符</dd>
					<dt>确认密码：</dt>
					<dd>
						<f:input type="password" id="voteUserRpassID" class="input-text" path="confirmPassword"
							required="required" onblur="checkRpwd(this)"/>
						<f:errors path="confirmPassword" class="cssErrors"></f:errors>
					</dd>
					<dd id="repwinfo">密码支持字母和数字，限制6-18个字符</dd>
					<%-- <dt>电子邮箱：</dt>
					<dd>
						<span>${currUser.vuEmail}</span>
					</dd>
					<dt></dt> --%>
					<dd>
						<input type="button"  value="确认修改密码" onclick="checkChangeInfo()" onblur="cleanErrorInfo()"/>
					</dd>
					<dd  id="registerErroInfo"></dd>
				</dl>
			</f:form>
			<div class="error">${regErrorMsg }</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	
	<script src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/changeAdminInfo.js"></script>
</body>
</html>
