/**
 * 登陆js
 */
$(function(){
	var inputs = $("#loginBox input");
	/*$.each( inputs, function(i, n){
		console.info( "input " + i + ": " + n );
	});*/
	
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

	/*
	var input = document.getElementById("loginBox").getElementsByTagName("input");
	for(i=0; i<input.length; i++) {
		var type = input[i].getAttribute("type");
		if(type == "text" || type == "password") {
			input[i].onfocus = function(){
				this.className += " input-text-over";
			}
			input[i].onblur = function(){
				this.className = this.className.replace(/input-text-over/, "");
			}
		} else if(type == "submit") {
			input[i].onmouseover = function(){
				this.className += " input-submit-over";
			}
			input[i].onmouseout = function(){
				this.className = this.className.replace(/input-button-over/, "");
			}
		}
	}*/
});
