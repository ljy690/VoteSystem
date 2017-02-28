 /**
 * 我发布的投票的js
 * 首次进来要先拼接一次，然后再是按钮
 */
$(function(){
	$.get("subject/mySetUpVote",{pageSize:5,pageNum:1},function(data){
		if(null==data){
			noInfo();
		}else{
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
		}
	},'json');
});

function connSetList(data){
	var listStr = "";
	$.each(data,function(index,item){
		listStr += '<li ' + (index%2==0 ? 'class="odd"' : '') + '>';
		listStr += '<h4>'+ item.vsTitle30;
		if(item.vsType==1){
			listStr += '[单选]';
		}else{
			listStr += '[多选]';
		}
		listStr += '</h4>';
		listStr += '<div style="float:right" id="aStyle"><a href="option/check?vsId='+item.vsId+'">查看结果</a>&nbsp;&nbsp;';
		if(item.vsStatus==1){
			listStr += '<a href="subject/closeVote?vsId='+item.vsId+'" onclick="return confirmDel("关闭")">关闭投票</a>&nbsp;&nbsp;';
		}
		listStr += '<a href="subject/userDelete?vsId='+item.vsId+'" onclick="return confirmDel("删除")">删除</a></div>';
		listStr += '<p class="info">共有' + item.optionCount + '个选项，已有'
		+item.voteAllCount + '个网友参与了投票。</p>';
		listStr += '</li>';
	});
	$("#mySetSubjectList").html(listStr);
}

function noInfo(){
	$("#mySetSubjectList").html("<li><h4>该用户未发布过投票。</h4></li>");
}

function confirmDel(str) {  
    var msg = "您真的确定要"+str+"该投票吗？请确认！";  
    if (confirm(msg)==true){  
        return true;  
    }else{  
        return false;  
    }  
}  