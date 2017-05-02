/**
 * 搜索用户页面js
 * 首次进来要先拼接一次，然后再是按钮
 */
$(function(){
	$.get("user/adminSearchUser",{pageSize:5,pageNum:1},function(data){
		connList(data.users);
		$(".tcdPageCode").createPage({
			pageCount : data.total,
			current : 1,
			backFn : function(pageNum) {
				$.post("user/adminSearchUser",{pageSize:5,pageNum:pageNum},function(data1){
					connList(data1.users);
				});
			}
		});
	},'json');
	noSearchInfo();
});

function connList(data){
	var listStr = "";
	$.each(data,function(index,item){
		listStr += '<li ' + (index%2==0 ? 'class="odd"' : '') + '>';
		listStr += '<h4>'+item.vuUsername;
		if(item.vuSex=='male'){
			listStr += '[男]';
		}else{
			listStr += '[女]';
		}
		listStr += '</h4><div style="float:right" id="aStyle">';
		if(item.vuStatus!=2){
			listStr += '<a href="user/upUser?vuId='+item.vuId+'" onclick="return confirmAct()">激活用户</a>&nbsp;&nbsp;';
		}else if(item.vuStatus==2){
			listStr += '<a>此用户已激活</a>&nbsp;&nbsp;';
		}
		listStr += '<a href="user/seeUser?vuId='+item.vuId+'">查看用户信息</a>&nbsp;&nbsp;';
		if(item.vuStatus==3){
			listStr += '<a">该用户已经被删除</a></div>';
		}else{
			listStr += '<a href="user/deleteUser?vuId='+item.vuId+'" onclick="return confirmDel()">删除此用户</a></div>';
		}

		listStr += '<p class="info">该用户共发布了'+item.setVote+'个主题,参与了'  + item.joinVote + '个主题</p>';
		listStr += '</li>';
	});
	$("#adminSearchUser").html(listStr);
}

function noSearchInfo(){
	$("#adminSearchUser").html("<h4>搜索不到相关的用户信息。</h4>");
}

function confirmDel() {  
	var msg = "您真的确定要删除该用户吗？请确认！";  
	if (confirm(msg)==true){  
		return true;  
	}else{  
		return false;  
	}  
}  

function confirmAct() {  
	var msg = "您真的确定要激活该用户吗？请确认！";  
	if (confirm(msg)==true){  
		return true;  
	}else{  
		return false;  
	}  
} 