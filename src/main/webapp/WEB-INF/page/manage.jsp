<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理投票</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="top.jsp" />
<div id="vote" class="wrap">
	<h2>投票列表</h2>
	<s:iterator value="subjects" status="status">
		<li  <s:if test="#status.isOdd()">class="odd" </s:if>>
			<h4>
				<em><a href="Subject!read.action?entityId=<s:property value='id'/>">维护</a></em>
				<a href="#"><s:property value="title"/></a>
			</h4>
			<p class="info">共有 <s:property value="options.size"/> 个选项，已有 <s:property value="votes[id]"/> 个网友参与了投票。</p>
		</li>
	</s:iterator>
	</ul>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
