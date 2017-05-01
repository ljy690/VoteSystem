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
		<h2>用户信息修改</h2>
		<div class="content">
			<f:form method="post" action="user/changeUserInfo" modelAttribute="voteUser" style="margin:0 auto;" id="changeInfo"> 
				<input type="hidden" name="vuId" value="${currUser.vuId }"/>
				<input type="hidden" name="vuUsername" value="${currUser.vuUsername }"/>
				<dl>
					<dt>用户名：</dt>
					<dd>
						<span>${currUser.vuUsername }</span>
					</dd>
					<dt>出生日期：</dt>
					<dd>
						<f:input type="text" path="vuDate" class="input-text"
							value="${currUser.vuDate0} " required="required" onblur="checkBri(this)"/>
						<f:errors path="vuDate" class="cssErrors"></f:errors>
					</dd>
  					<dt>性别：</dt>
					<dd>
						<c:choose>  
						   <c:when test="${currUser.vuSex=='male' }">
						   		<f:radiobutton  path="vuSex" name="sex" class="radioItem" value="male" checked="true"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  								<f:radiobutton  path="vuSex" name="sex" class="radioItem" value="female" /> 女
						   </c:when>  
						   <c:otherwise>
						   		<f:radiobutton  path="vuSex" name="sex" class="radioItem" value="male"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  								<f:radiobutton  path="vuSex" name="sex" class="radioItem" value="female" checked="true"/> 女
						   </c:otherwise>  
						</c:choose>
						
  						<f:errors path="vuSex" class="cssErrors"></f:errors>
  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  						<span id="briInfo">日期请按YYYY-MM-DD格式输入</span>
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
					<dt>电子邮箱：</dt>
					<dd>
						<span>${currUser.vuEmail}</span>
					</dd>
					<dt></dt>
					<dd>
						<input type="button"  value="确认修改信息" onclick="checkChangeInfo()" onblur="cleanErrorInfo()"/>
					</dd>
					<dd  id="registerErroInfo"></dd>
				</dl>
			</f:form>
			<div class="goback"><a href="javascript:history.go(-1)">返回上一级</a></div>
			<div class="error">${regErrorMsg }</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	
	<script src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/changeInfo.js"></script>
</body>
</html>
