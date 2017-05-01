/**
 * 投票主页js
 * 首次进来要先拼接一次，然后再是按钮
 */
$(function(){
	flag2=true;
	$.get("subject/manageAll",{pageSize:5,pageNum:1},function(data){
		flag2=false;
		manageList(data.subjects);
		$(".tcdPageCode").createPage({
			pageCount : data.total,
			current : 1,
			backFn : function(pageNum) {
				$.post("subject/manageAll",{pageSize:5,pageNum:pageNum},function(data1){
					manageList(data1.subjects);
				});
			}
		});
	},'json');
	if(flag2){
		noSubjectInfo();
	}
});

function manageList(data){
	var listStr = "";
	$.each(data,function(index,item){
		listStr += '<li ' + (index%2==0 ? 'class="odd"' : '') + '>';
		var str=item.vsTitle;
		if(str.length>35){
			listStr += '<h4>'+str.substring(0,35)+"...";
		}else{
			listStr += '<h4>'+str;
		}
		if(item.vsType==1){
			listStr += '[单选]';
		}else{
			listStr += '[多选]';
		}
		listStr += '</h4>';

		listStr += '<div style="float:right" id="aStyle"><a href="option/analyzeResult?vsId='+item.vsId+'">查看结果</a>&nbsp;&nbsp;';
		if(item.vsStatus!=3){
			listStr += '<a href="subject/adminDelete?vsId='+item.vsId+'" onclick="return confirmDel()">删除此投票</a></div>';
		}else{
			listStr += '<a">此投票已经被删除</a></div>';
		}

		listStr += '<p class="info">共有'  + item.optionCount + '个选项，已有'
		+item.voteAllCount + '个网友参与了投票。</p>';
		listStr += '</li>';
	});
	$("#manageList").html(listStr);
}

function noSubjectInfo(){
	$("#manageList").html("<h4>系统里没有投票主题。</h4>");
}

function confirmDel(str) {  
	var msg = "您真的确定要删除该投票吗？请确认！";  
	if (confirm(msg)==true){  
		return true;  
	}else{  
		return false;  
	}  
}  