<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加新主题成功</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="top.jsp" />
<div id="message" class="box">
	<h2>提示信息</h2>
	<div class="content">
		<p>恭喜：操作成功！<a href="subject/jumpList">返回查看投票列表&gt;&gt;</a></p>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
