<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fs"%>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>参与投票</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="top.jsp" />
<div id="vote" class="wrap">
	<h2>参与投票</h2>
	<ul class="list">
		<li>
		<h4>${currSubject.vsTitle }[${currSubject.vsType eq 1 ? '单选':'多选'}]
		<span style="float:right;font-size:14px;">发布者：${currSubject.vuUsername }&nbsp;&nbsp;
			发布日期：${currSubject.vsBeginTime }</span>
		</h4>
			<p class="info">共有 ${currSubject.optionCount }个选项，已有${currSubject.voteAllCount }个网友参与了投票。</p>
			<label style="color:red">${saveMsg}</label>
			<form method="post" action="voteitem/vote" id="ops">
			    <input type="hidden" name="vsId" value=" ${currSubject.vsId}"/> 
			    <input type="hidden" name="vuId" value=" ${currUser.vuId }"/> 
				<ol>
				   <c:forEach items="${options}" var="option" >
				   		<li><input type="${currSubject.vsType eq 1 ? 'radio':'checkbox'}" name="voId"  value="${option.voId}"/>${option.voOption}</li>
				   </c:forEach>
				</ol>
				<p class="voteView"><input type="image" src="images/button_vote.gif"/></p>
<%-- 				<a href="vote_view.action?vsId=${options[0].vsId}"><img src="images/button_view.gif" /></a> --%>
			</form>
		</li>
	</ul>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
