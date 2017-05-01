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
<script type="text/javascript">
var isIE = !!document.all;
function AddOption()
{
	var voteoptions = document.getElementById("voteoptions");
	var _p = document.createElement("p");
	//拼接分割线
	var _sp = document.createElement("p");
	_sp.className = "p-border";
	_p.appendChild(_sp);
	//拼接选项
	var _input = document.createElement("input");
	_input.type = "text";
	_input.className = "input-text";
	_input.setAttribute("name", "voOption");
	_input.setAttribute("maxLength", "50");
	_p.appendChild(_input);
	//选项最多50
	var _spa = document.createElement("span");
	_spa.className = "span1";
	_spa.appendChild(document.createTextNode("最多可输入50字。"));
	_p.appendChild(_spa);
	//
	var _br = document.createElement("span");
	_br.className = "span2";
	_br.innerHTML="选项简介:"
	_p.appendChild(_br);
	//拼接选项简介
	var _textarea = document.createElement("textarea");
	_textarea.className = "textarea-text";
	_textarea.setAttribute("name", "voIntro");
	_textarea.setAttribute("maxLength", "150");
	_p.appendChild(_textarea);
	//拼接字数提醒
	var _span = document.createElement("span");
	_span.className = "span-style";
	_span.appendChild(document.createTextNode("最多可输入150字。"));
	_p.appendChild(_span);
	//删除
	var _a = document.createElement("a");
	_a.className = "del";
	_a.setAttribute("href", "javascript:;");
	if(isIE) {
		_a.attachEvent("onclick", DelOption);
	} else {
		_a.addEventListener("click", DelOption, false);
	}
	_a.appendChild(document.createTextNode("  删除"));
	_p.appendChild(_a);
	voteoptions.appendChild(_p);
}
function DelOption(e)
{
	if(!e) e = window.event;
	var a = e.srcElement || e.target;
	var obj = a.parentNode;
	obj.parentNode.removeChild(obj);
}

</script>
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
				   <textarea style="width:385px; height:50px;resize:none;" maxlength="300" title="请输入主题简介" name="vsIntroduction"></textarea>
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

