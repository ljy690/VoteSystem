/**
 * 添加投票js
 * 
 */
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
