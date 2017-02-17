/**
 * 注册时格式的验证
 */
//全局标志
var ruName=false;
var rBri=false;
var rPass=false;
var rPassw=false;
var rEmail=false;
var fpassword=null;
var frpassword=null;

function checkUsename(un){
	if(null!=un && ""!=un){
		var rUname=un.value;
		var re=/^[a-zA-Z0-9_]{4,12}$/;
		var rUsename=re.test(rUname);
		if(rUsename){
			//判断用户名是否已被占用
			$.post("user/checkUname",{vuUsername:rUname},function(data){
				//真就是不为空
				if(data){
					$("#nameinfo").html("用户名已被占用，请您重新输入。");
					$("#nameinfo").css("color","red");
					ruName=false;
				}else{
					$("#nameinfo").html("用户名可用。");
					$("#nameinfo").css("color","green");
					ruName=true;
				}
			},'json');
		}else{
			$("#nameinfo").html("用户名仅支持字母、数字以及'_'，限制4-12个字符。");
			$("#nameinfo").css("color","red");
			ruName=false;
		}
	}
}


function checkBri(bri){
	if(null!=bri && ""!=bri){
		var arr=bri.value;
		var cmon=parseInt(arr.substring(2,0));
		var cday=parseInt(arr.substring(3,5));
		var cyear=parseInt(arr.substring(6,10));
		
		var pdate=new Date();
		var pyear=pdate.getFullYear()+0;
		var pmon=pdate.getMonth()+1;
		var pday=pdate.getDate()+0;
		
		if(cyear>pyear){
			$("#briInfo").html("出生日期不能超过今天，请重新选择。");
			$("#briInfo").css("color","red");
			rBri=false;
		}else if(cyear==pyear&&cmon>pmon){
			$("#briInfo").html("出生日期不能超过今天，请重新选择。");
			$("#briInfo").css("color","red");
			rBri=false;
		}else if(cyear==pyear&&cmon==pmon&&cday>pday){
			$("#briInfo").html("出生日期不能超过今天，请重新选择。");
			$("#briInfo").css("color","red");
			rBri=false;
		}else{
			$("#briInfo").html(" ");
			rBri=true;
		}
	}
}


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
	if(null!=frpassword && null!=fpassword && ""!=frpassword && ""!=fpassword){
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

function checkEmail(email){
	if(null!=email && ""!=email){
		var el=email.value;
		var result=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		var qemail=result.test(el);
		if(qemail){
			//格式正确，则判断是否已经用过
			$.post("user/checkEmail",{vuEmail:el},function(data){
				if(data){
					//找到了用户，即邮箱被占用
					$("#emailInfo").html("邮箱已被注册，请重新输入。");
					$("#emailInfo").css("color","red");
					rEmail=false;
				}else{
					$("#emailInfo").html("邮箱可用。");
					$("#emailInfo").css("color","green");
					rEmail=true;
				}
			},'json');
		}else{
			rEmail=false;
			$("#emailInfo").html("邮箱格式不正确，请重新输入。");
			$("#emailInfo").css("color","red");
		}
	}
}


function checkRegister(){
	if(ruName&&rBri&&rPass&&rPassw&&rEmail){
		ruName=false;
		rBri=false;
		rPass=false;
		rPassw=false;
		rEmail=false;
		fpassword=null;
		frpassword=null;
		$("#formInfo").submit();
	}else{
		$("#registerErroInfo").html("请把信息填完善再提交。");
		$("#registerErroInfo").css("color","red");
		return;
	}
}

function cleanErrorInfo(){
	//清空信息
	$("#registerErroInfo").html("");
	
/*	$("#voteUserID").val("");
	$("#voteUserPassID").val("");
	$("#voteUserRpassID").val("");
	$("#voteUserEmailID").val("");
	$("#demo-1").val("");
	fpassword=null;
	frpassword=null;
	
	$("#nameinfo").html("用户名支持字母、数字以及'_'，限制4-12个字符。");
	$("#briInfo").html(" ");
	$("#pwinfo").html("密码支持字母和数字，限制6-18个字符");
	$("#repwinfo").html("密码支持字母和数字，限制6-18个字符");
	$("#emailInfo").html("邮箱不能以 - _ .以及其它特殊字符开头和结束");
	
	$("#nameinfo").css("color","black");
	$("#pwinfo").css("color","black");
	$("#repwinfo").css("color","black");
	$("#emailInfo").css("color","black");*/
}