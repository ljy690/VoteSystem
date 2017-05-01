<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发布新投票</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/add.js"></script>
</head>
<body>
<jsp:include page="top.jsp" />
<div id="voteManage" class="box">
	<h2>添加新投票</h2>
	<div class="content">
	<form method="post" action="subject/addNewSubject">
			<dl>
				<dt>投票内容：</dt>
				<dd>
				   <input type="hidden" name="vsvuId" value="${currUser.vuId }"/>
				   <input type="text" class="input-text" name="vsTitle" required="required" maxlength="100"/>
				   <span class="span1" >最多可输入100字。</span>
				   <span class="span2">主题简介:</span>
				   <textarea style="width:385px; height:50px;resize:none;font-size:12px;" maxlength="300" title="请输入主题简介" name="vsIntroduction"></textarea>
				   <span class="span-style" >最多可输入300字。</span>
				</dd>
				<dt>投票类型：</dt>
				<dd>
		  		   <input type="radio" name="vsType" checked="checked" value="1" />单选
				   <input type="radio" name="vsType" value="2" />多选
				</dd>
				<dt>投票选项：</dt>
				<dd id="voteoptions">
					<p>
						<input type="text" class="input-text" maxlength="50" name="voOption" required="required"/>
						<span class="span1" >最多可输入50字。</span>
						<span class="span2">选项简介:</span>
						<textarea class="textarea-text" maxlength="150" name="voIntro"></textarea>
						<span class="span-style" >最多可输入150字。</span>
					</p>
					<p>
						<p class="p-border"></p>
						<input type="text" maxlength="50" class="input-text" name="voOption" required="required"/>
						<span class="span1" >最多可输入50字。</span>
						<span class="span2">选项简介:</span>
						<textarea class="textarea-text" maxlength="150" name="voIntro"></textarea>
						<span class="span-style" >最多可输入150字。</span>
					</p>
				</dd>
				<dt></dt>
				<dd class="button">
					<input type="image" src="images/button_submit.gif" />
					<a href="javascript:;" onclick="AddOption()">增加选项</a>
					<a href="subject/jumpList">退出</a>
					<label style="color:red">${addSbErrorMsg}</label>
				</dd>
			</dl>
		</form>
	</div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>

