/**
 * 修改管理员密码时格式的验证
 */
//全局标志
var rPass=false;
var rPassw=false;
var fpassword=null;
var frpassword=null;

function checkPwd(pwd){
	fpassword=pwd.value;
	if(null!=fpassword && ""!=fpassword){
		var res=/^[a-zA-Z0-9]{6,18}$/;
		var rpasswd=res.test(fpassword);
		if(rpasswd){
			$("#pwinfo").html("密码格式正确。");
			$("#pwinfo").css("color","green");
			rPass=true;
			//验证一下确认密码那里是不是有问题
			if(null!=frpassword){
				checkTwoPass();
			}
		}else{
			$("#pwinfo").html("密码仅支持字母和数字，限制6-18个字符");
			$("#pwinfo").css("color","red");
			rPass=false;
		}
	}else{
		$("#pwinfo").html("密码仅支持字母和数字，限制6-18个字符");
		$("#pwinfo").css("color","red");
		$("#voteUserRpassID").val("");
		$("#repwinfo").html("密码仅支持字母和数字，限制6-18个字符");
		$("#repwinfo").css("color","black");
		rPass=false;
		rPassw=false;
		frpassword=null;
	}
}

function checkRpwd(Rpwd){
	frpassword=Rpwd.value;
	if(null!=frpassword && ""!=frpassword){
		checkTwoPass();
	}else{
		$("#repwinfo").html("密码仅支持字母和数字，限制6-18个字符");
		$("#repwinfo").css("color","red");
		rPassw=false;
	}
}

function checkTwoPass(){
	var res=/^[a-zA-Z0-9]{6,18}$/;
	var rpasswd=res.test(frpassword);
	if(null!=frpassword && null!=fpassword && ""!=frpassword && ""!=fpassword && rpasswd){
		if(frpassword==fpassword){
			//alert("通过啦"+frpassword+"  "+fpassword);
			$("#repwinfo").html("密码一致通过。");
			$("#repwinfo").css("color","green");
			rPassw=true;
		}else{
			//alert("不通过啦"+frpassword+"  "+fpassword);
			$("#repwinfo").html("两次密码不一致");
			$("#repwinfo").css("color","red");
			rPassw=false;
		}
	}
}

function checkChangeInfo(){
	if(rPass&&rPassw){
		rPass=false;
		rPassw=false;
		fpassword=null;
		frpassword=null;
		$("#changeInfo").submit();
	}else{
		$("#registerErroInfo").html("请把信息填完善再提交。");
		$("#registerErroInfo").css("color","red");
		return;
	}
}

function cleanErrorInfo(){
	//清空信息
	$("#registerErroInfo").html("");
}