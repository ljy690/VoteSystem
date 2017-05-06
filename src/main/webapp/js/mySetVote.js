/**
 * 我发布的投票的js
 * 首次进来要先拼接一次，然后再是按钮
 */

$(function(){
	$.get("subject/mySetUpVote",{pageSize:5,pageNum:1},function(data){
		connSetList(data.subjects);
		$(".tcdPageCode").createPage({
			pageCount : data.total,
			current : 1,
			backFn : function(pageNum) {
				$.post("subject/mySetUpVote",{pageSize:5,pageNum:pageNum},function(data1){
					connSetList(data1.subjects);
				});
			}
		});
	},'json');
	noInfo();
});

function connSetList(data){
	var listStrs = "";
	$.each(data,function(index,item){
		listStrs += '<li ' + (index%2==0 ? 'class="odd"' : '') + '>';
		var str=item.vsTitle;
		if(str.length>35){
			listStrs += '<h4>'+str.substring(0,35)+"...";
		}else{
			listStrs += '<h4>'+str;
		}
		if(item.vsType==1){
			listStrs += '[单选]';
		}else{
			listStrs += '[多选]';
		}
		listStrs += '</h4>';
		if(item.vsIntroduction!=null){
			var instr=item.vsIntroduction;
			listStrs += '<p style="text-indent:20px;">';
			if(instr.length>300){
				instr = item.vsIntroduction.substring(0,200);
				listStrs += instr+"..."; 
			}else{
				listStrs += instr;
			}
			listStrs += '</p>';
		}
		listStrs += '<div style="float:right" id="aStyle"><a href="option/analyzeResult?vsId='+item.vsId+'">结果分析</a>&nbsp;&nbsp;';
		if(item.vsStatus==1){
			listStrs += '<a href="subject/closeVote?vsId='+item.vsId+'" onclick="return confirmClose();">关闭投票</a>&nbsp;&nbsp;';
		}else if(item.vsStatus==2){
			listStrs += '<a href="subject/openVote?vsId='+item.vsId+'" onclick="return confirmOpen();">开启投票</a>&nbsp;&nbsp;';
		}
		listStrs += '<a href="subject/userDelete?vsId='+item.vsId+'" onclick="return confirmDel();">删除</a></div>';
		listStrs += '<p class="info">共有' + item.optionCount + '个选项，已有'
		+item.voteAllCount + '个网友参与了投票。</p>';
		listStrs += '</li>';
	});
	$("#mySetSubjectList").html(listStrs);
}

function noInfo(){
	$("#mySetSubjectList").html("<li><h4>该用户未发布过投票。</h4></li>");
}

function confirmDel() {  
	var msg = "您真的确定要删除该投票吗？请确认！";  
	if (confirm(msg)==true){  
		return true;  
	}else{  
		return false;  
	}  
}  

function confirmOpen() {  
	var msg = "您真的确定要开启该投票吗？请确认！";  
	if (confirm(msg)==true){  
		return true;  
	}else{  
		return false;  
	}  
} 

function confirmClose() {  
	var msg = "您真的确定要开启该投票吗？请确认！";  
	if (confirm(msg)==true){  
		return true;  
	}else{  
		return false;  
	}  
}