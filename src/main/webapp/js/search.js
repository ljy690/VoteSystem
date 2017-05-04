 /**
 * 搜索页面js
 * 首次进来要先拼接一次，然后再是按钮
 */
$(function(){
	$.get("subject/search",{pageSize:5,pageNum:1},function(data){
		if(data==null){
			noSearchInfo();
		}else{
			connList(data.subjects);
			$(".tcdPageCode").createPage({
				pageCount : data.total,
				current : 1,
				backFn : function(pageNum) {
					$.post("subject/search",{pageSize:5,pageNum:pageNum},function(data1){
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
		var str=item.vsTitle;
		if(str.length>35){
			listStr += '<h4>'+str.substring(0,35)+"...";
		}else{
			listStr += '<h4>'+str;
		};
		if(item.vsType==1){
			listStr += '[单选]';
		}else{
			listStr += '[多选]';
		}
		listStr += '</h4>';
		if(item.vsIntroduction!=null){
			var instr=item.vsIntroduction;
			listStr += '<p style="margin-left: 20px;">';
			if(instr.length>300){
				instr = item.vsIntroduction.substring(0,200);
				listStr += instr+"..."; 
			}else{
				listStr += instr;
			}
			listStr += '</p>';
		}
		listStr += '<div style="float:right" id="aStyle">';
		if(item.vsStatus==1){
			listStr += '<div class="join"><a href="option/view?vsId='+item.vsId+'">我要参与</a></div>';
		}else{
			listStr += '<a>投票已结束</a>&nbsp;&nbsp;<a href="option/directView?vsId='+item.vsId+'">查看结果</a>';
		}
		listStr += '</div><p class="info">共有' + item.optionCount + '个选项，已有'
		+item.voteAllCount + '个网友参与了投票。</p>';
		listStr += '</li>';
	});
	$("#searchResult").html(listStr);
}

function noSearchInfo(){
	$("#searchResult").html("<h4>搜索不到相关的投票主题。</h4>");
}