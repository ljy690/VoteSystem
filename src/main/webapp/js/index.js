/**
 * 投票主页js
 * 首次进来要先拼接一次，然后再是按钮
 */
$(function(){
	$.get("subject/listAll",{pageSize:5,pageNum:1},function(data){
		alert("总数呢"+data.total);
		connList(data);
		$(".tcdPageCode").createPage({
			pageCount : data.total,
			current : 1,
			backFn : function(pageNum) {
				$.post("subject/listAll",{pageSize:5,pageNum:pageNum},function(data1){
					connList(data1);
				});
			}
		});
	},'json');
});

function connList(data){
	alert(data+"为什么不阻止");
	var listStr = "";
	$.each(data,function(index,item){
		listStr += '<li ' + (index%2==0 ? 'class="odd"' : '') + '>';
		listStr += '<h4>';
		listStr += '<a>' + item.vsTitle + '</a>';
		listStr += '</h4>';
		listStr += '<div class="join"><a href="option/view?vsId='+item.vsId+'">我要参与</a></div>';
		listStr += '<p class="info">共有' + item.optionCount + '个选项，已有'
		+item.voteAllCount + '个网友参与了投票。</p>';
		listStr += '</li>';
	});
	$("#subjectList").html(listStr);
}