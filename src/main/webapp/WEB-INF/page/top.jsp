<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<div id="header" class="wrap">
	<img src="images/logo.gif" />
</div>
<div id="navbar" class="wrap">
	<div class="profile">
		您好， ${currUser.vuUsername }
		<span class="return"><a href="subject/jumpList">返回列表</a></span>
		<span class="addnew"><a href="subject/addNewVote">添加新投票</a></span>
		<span class="modify"><a href="Subject!modify.action">我发起の投票</a></span>
		<span class="leavemsg"><a href="Subject!modify.action">我参与の投票</a></span>
	</div>
	<div class="search">
		<form method="post" action="Subject!search.action">
			<!--  value="<s:property value='keywords'/>" -->
			<input type="text" name="keywords" class="input-text"/><input type="submit" name="submit" class="input-button" value="" />
		</form>
	</div>
</div>
