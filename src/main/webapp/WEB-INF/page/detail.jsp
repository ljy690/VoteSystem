<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fs"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看投票详情</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="top.jsp" />
<div id="vote" class="wrap">
	<h2>${currSubject.vsTitle }[${currSubject.vsType eq 1 ? '单选':'多选'}]</h2>
	<ul class="list">
		<li>
			<p style="text-indent:20px;font-size:14px;">发布者：
			<a href="user/jumpOnes?vuUsername=${currSubject.vuUsername }">${currSubject.vuUsername }</a>&nbsp;&nbsp;
					发布日期：${currSubject.vsBeginTime }</p>
			<p style="text-indent:20px;margin-top: 10px;">主题介绍：
			<c:choose>
				<c:when test="${currSubject.vsIntroduction==null }">
				无
				</c:when>
				<c:otherwise>
				${currSubject.vsIntroduction }
				</c:otherwise>
			</c:choose>
			</p>
			<p class="info">该主题的选项详情如下： </p>
			<c:if test="${currSubject.vsStatus == 2 }">
			<p class="info" style="color:red;"> 该投票已结束 </p>
			</c:if>
				<ul>
					<c:forEach items="${details}" var="opDetail">
						<li>
							<div>${opDetail.voOrder}.
							<c:choose>
								<c:when test="${opDetail.voUrl==null}">
									<a style="font-size: 16px;">${opDetail.voOption}</a>
								</c:when>
								<c:otherwise>
									<a style="font-size: 16px;" href="${opDetail.voUrl}" target="_blank">${opDetail.voOption}</a>
								</c:otherwise>
							</c:choose>
							</div>
							<div>
								<c:choose>
									<c:when test="${opDetail.voPic==null}">
										<img alt="${opDetail.voOption}"  src="../../images/voteBanner.jpg" width="210px" height="154px"/>
									</c:when>
									<c:otherwise>
										<img alt="${opDetail.voOption}"  src="../../${opDetail.voPic}" width="210px" height="154px"/> 
									</c:otherwise>
								</c:choose>
								<p style="text-indent:20px;">${opDetail.voIntro}</p>
							</div>
						</li>
					</c:forEach> 
				</ul>
				
				<div class="goback"><a href="javascript:history.go(-1)">返回上一级</a></div>
		</li>
	</ul>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
