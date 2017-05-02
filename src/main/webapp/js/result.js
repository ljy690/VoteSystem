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
			console.info(data);
			console.info(data.sum);
			console.info(data.sum.vooption);
			console.info(data.fe);
			console.info(data.ma);
			console.info(data.num);
			$("#analRe").html("<h4>hahah</h4>");
		}
	});
}
