/**
 * 获取热门数据
 */
function getHotData(num,vsId){
	$.ajax({
		type:"GET",
		url:"option/analyzeData",
		data:{num:num,vsId:vsId},
		dataType:"json",
		success:function(data){
			var num=data.num;
			var sumdata="<p>分析参考如下：</p><p>此投票最受大众欢迎的";
			if(num==1){
				sumdata += "是：";
			}else{
				sumdata += "前"+num+"名分别是：";
			}
			$.each(data.sum,function(index,item){
				if(num==1){
					sumdata += item.voOption;
				}else{
					if(index==0){
						sumdata += item.voOption;
					}else{
						sumdata += "、"+item.voOption;
					}
				}
			});
			if(num==1){
				sumdata += "。所得票数为:";
			}else{
				sumdata += "。所得票数分别为:";
			}
			$.each(data.sum,function(index,item){
				if(num==1){
					sumdata += item.voteUserCount+"票";
				}else{
					if(index==0){
						sumdata += item.voteUserCount+"票";
					}else{
						sumdata += "、"+item.voteUserCount+"票";
					}
				}
			});
			sumdata += "。</p><p>其中，</p><p>最受男性欢迎的";
			if(num==1){
				sumdata += "是：";
			}else{
				sumdata += "前"+num+"名分别是：";
			}
			$.each(data.fe,function(index,item){
				if(num==1){
					sumdata += item.voOption;
				}else{
					if(index==0){
						sumdata += item.voOption;
					}else{
						sumdata += "、"+item.voOption;
					}
				}
			});
			if(num==1){
				sumdata += "。所得票数为:";
			}else{
				sumdata += "。所得票数分别为:";
			}
			$.each(data.fe,function(index,item){
				if(num==1){
					sumdata += item.voteMaleSex+"票";
				}else{
					if(index==0){
						sumdata += item.voteMaleSex+"票";
					}else{
						sumdata += "、"+item.voteMaleSex+"票";
					}
				}
			});
			sumdata += "。</p><p>最受女性欢迎的";
			if(num==1){
				sumdata += "是：";
			}else{
				sumdata += "前"+num+"名分别是：";
			}
			$.each(data.ma,function(index,item){
				if(num==1){
					sumdata += item.voOption;
				}else{
					if(index==0){
						sumdata += item.voOption;
					}else{
						sumdata += "、"+item.voOption;
					}
				}
			});
			if(num==1){
				sumdata += "。所得票数为:";
			}else{
				sumdata += "。所得票数分别为:";
			}
			$.each(data.ma,function(index,item){
				if(num==1){
					sumdata += item.voteFemaleSex+"票";
				}else{
					if(index==0){
						sumdata += item.voteFemaleSex+"票";
					}else{
						sumdata += "、"+item.voteFemaleSex+"票";
					}
				}
			});
			sumdata += "。</p>";
			
			$("#analRe").html(sumdata);
		}
	});
}
