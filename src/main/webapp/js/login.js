/**
 * 登陆js
 */
$(function(){
	var inputs = $("#loginBox input");
	
	inputs.focus(function(){
		this.className = " input-text-over";
	});
	
	inputs.blur(function(){
		this.className = " input-text-over";
	});
	
	
	$("#loginBox button").hover(function(){
		$(this).addClass("input-button-over");
	},function(){
		$(this).removeClass("input-button-over");
	});
});

