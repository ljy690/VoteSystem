<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="header" class="wrap">
	<img src="images/logo.gif" />
</div>
<div id="navbar" class="wrap">
	<div class="profile">
		<c:choose>  
		   <c:when test="${currUser.vuVersion==1 }">
				   您好，<a href="user/adminCenter?vuId=${currUser.vuId }">${currUser.vuUsername }</a> 
				<label><a href="user/jumpLogin">[注销]</a></label>
		   		<span class="modify"><a href="subject/jumpManageVote">管理所有的投票</a></span>
		   		<span class="modify"><a href="user/jumpManageUser">管理所有的用户</a></span>
		   </c:when>  
		   <c:otherwise>
				   您好，<a href="user/userCenter?vuId=${currUser.vuId }">${currUser.vuUsername }</a> 
				<label><a href="user/jumpLogin">[注销]</a></label>
		   		<span class="return"><a href="subject/jumpList">返回列表</a></span>
				<span class="addnew"><a href="subject/addNewVote">添加新投票</a></span>
		   		<span class="modify"><a href="subject/jumpMySetUpVote?vuId=${currUser.vuId }">我发起の投票</a></span>
				<span class="leavemsg"><a href="subject/jumpMyJoinedVote?vuId=${currUser.vuId }">我参与の投票</a></span>
		   </c:otherwise>  
		</c:choose> 
	</div>
	<div class="search">
		<form method="post" action="subject/jumpSearch">
			<select name="searchRole">
				<option value="用户">用户</option>
				<option value="主题">主题</option>
			</select>
			<input type="text" name="keywords" class="input-text" required="required"/>
			<input type="submit" name="submit" class="input-button" value="" />
		</form>
	</div>
</div>
