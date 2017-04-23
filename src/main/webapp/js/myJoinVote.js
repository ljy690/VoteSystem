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
	var listStrss = "";
	$.each(data,function(index,item){
		listStrss += '<li ' + (index%2==0 ? 'class="odd"' : '') + '>';
		var str=item.vsTitle;
		if(str.length>35){
			listStrss += '<h4>'+str.substring(0,35)+"...";
		}else{
			listStrss += '<h4>'+str;
		}
		if(item.vsType==1){
			listStrss += '[单选]';
		}else{
			listStrss += '[多选]';
		}
		listStrss += '</h4><div style="float:right" id="aStyle">';
		if(item.vsStatus==1){
			listStrss +='<a href="javascript:void(0)">投票进行中</a>';
		}else{
			listStrss +='<a href="javascript:void(0)">投票已结束</a>';
		}
		listStrss += '&nbsp;&nbsp;<a href="option/directView?vsId='+item.vsId+'">查看结果</a></div>';
		listStrss += '<p class="info">共有' + item.optionCount + '个选项，已有'
		+item.voteAllCount + '个网友参与了投票。</p>';
		listStrss += '</li>';
	});
	$("#myJoinSubjectList").html(listStrss);
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