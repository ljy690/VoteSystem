 /**
 * 我参与的投票的js
 * 首次进来要先拼接一次，然后再是按钮
 */
$(function(){
	$.get("subject/myJoinVote",{pageSize:5,pageNum:1},function(data){
		if(null!=data){
			connJoinList(data.subjects);
			$(".tcdPageCode").createPage({
				pageCount : data.total,
				current : 1,
				backFn : function(pageNum) {
					$.post("subject/myJoinVote",{pageSize:5,pageNum:pageNum},function(data1){
						connJoinList(data1.subjects);
					});
				}
			});
		}else{
			noJoinInfo();
		}
	},'json');
});

function connJoinList(data){
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
		listStr += '<div style="float:right" id="aStyle"><a href="option/directView?vsId='+item.vsId+'">查看结果</a></div>';
		listStr += '<p class="info">共有' + item.optionCount + '个选项，已有'
		+item.voteAllCount + '个网友参与了投票。</p>';
		listStr += '</li>';
	});
	$("#myJoinSubjectList").html(listStr);
}

function noJoinInfo(){
	$("#myJoinSubjectList").html("<li><h4>该用户未参与过投票。</h4></li>");
}

function confirmDel(str) {  
    var msg = "您真的确定要"+str+"该投票吗？请确认！";  
    if (confirm(msg)==true){  
        return true;  
    }else{  
        return false;  
    }  
}  