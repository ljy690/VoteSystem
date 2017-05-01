 /**
 * 我参与的投票的js
 * 首次进来要先拼接一次，然后再是按钮
 */
$(function(){
	$.get("subject/onesvote",{pageSize:5,pageNum:1},function(data){
		if(null!=data){
			connJoinList(data.subjects);
			$(".tcdPageCode").createPage({
				pageCount : data.total,
				current : 1,
				backFn : function(pageNum) {
					$.post("subject/onesvote",{pageSize:5,pageNum:pageNum},function(data1){
						connJoinList(data1.subjects);
					});
				}
			});
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
		listStrss += '</h4>';
		if(item.vsIntroduction!=null){
			listStrss += '<p>'+item.vsIntroduction+'</p>';
		}
		listStrss += '<div style="float:right" id="aStyle">';
		if(item.vsStatus==1){
			listStrss +='<a">投票进行中</a>';
		}else{
			listStrss +='<a">投票已结束</a>';
		}
		listStrss += '&nbsp;&nbsp;<a href="option/view?vsId='+item.vsId+'">查看投票</a></div>';
		listStrss += '<p class="info">共有' + item.optionCount + '个选项，已有'
		+item.voteAllCount + '个网友参与了投票。</p>';
		listStrss += '</li>';
	});
	$("#onesSetSubjectList").html(listStrss);
}