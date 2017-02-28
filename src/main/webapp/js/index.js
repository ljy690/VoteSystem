 /**
 * 投票主页js
 * 首次进来要先拼接一次，然后再是按钮
 */
$(function(){
	$.get("subject/listAll",{pageSize:5,pageNum:1},function(data){
		if(null==data){
			noSubjectInfo();
		}else{
			connList(data.subjects);
			$(".tcdPageCode").createPage({
				pageCount : data.total,
				current : 1,
				backFn : function(pageNum) {
					$.post("subject/listAll",{pageSize:5,pageNum:pageNum},function(data1){
						connList(data1.subjects);
					});
				}
			});
		}
	},'json');
});

function connList(data){
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
		listStr += '<div class="join"><a href="option/view?vsId='+item.vsId+'">我要参与</a></div>';
		listStr += '<p class="info">共有' + item.optionCount + '个选项，已有'
		+item.voteAllCount + '个网友参与了投票。</p>';
		listStr += '</li>';
	});
	$("#subjectList").html(listStr);
}

function noSubjectInfo(){
	$("#subjectList").html("<h4>系统里没有投票主题。</h4>");
}