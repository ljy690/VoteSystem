/**
 * 注册时格式的验证
 */
//全局标志
var ruName=false;
var rBri=false;
var rPass=false;
var rPassw=false;
var rEmail=false;

function checkUsename(un){
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
				$("#nameinfo").html("用户名支持字母、数字以及'_'，限制4-12个字符。");
				$("#nameinfo").css("color","black");
				ruName=true;
			}
		},'json');
	}else{
		$("#nameinfo").html("用户名仅支持字母、数字以及'_'，限制4-12个字符。");
		$("#nameinfo").css("color","red");
		ruName=false;
	}
}


function checkBri(bri){
	
}


function checkPwd(pwd){
	
}

function checkRpwd(Rpwd){
	
}