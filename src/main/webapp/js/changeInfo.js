/**
 * 注册时格式的验证
 */
//全局标志
var rBri=false;
var rPass=false;
var rPassw=false;
var fpassword=null;
var frpassword=null;

function checkBri(bri){
	if(null!=bri && ""!=bri){
		var r=/^\d{4}-(?:(?:0[13-9]|1[12])-(?:0[1-9]|[12]\d|30)|(?:0[13578]|1[02])-31|02-(?:0[1-9]|1\d|2[0-8]))|(?:(?:\d{2}(?:[13579][26]|[2468][048])|(?:[13579][26]|[2468][048])00)-02-29)$/;
		var arr=bri.value;
		var chBri=r.test(arr);
		if(chBri){
			var cmon=parseInt(arr.substring(5,7));
			var cday=parseInt(arr.substring(8,10));
			var cyear=parseInt(arr.substring(0,4));
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
				$("#briInfo").html("日期格式正确");
				$("#briInfo").css("color","green");
				rBri=true;
			}
		}else{
			$("#briInfo").html("日期不正确，请重新输入。");
			$("#briInfo").css("color","red");
			rBri=false;
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
	if(rBri&&rPass&&rPassw){
		rBri=false;
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