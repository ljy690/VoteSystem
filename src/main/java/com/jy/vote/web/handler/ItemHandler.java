package com.jy.vote.web.handler;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jy.vote.service.ItemService;

@Controller
@RequestMapping("/voteitem")
public class ItemHandler {
	@Autowired
	private ItemService itemService;
	
	//投票功能
	@RequestMapping(value="/vote")
	public String showOption(@RequestParam(value="voId",required=false) int[] voId,
			@RequestParam("vsId") int vsId,@RequestParam("vuId") int vuId,
			HttpSession session,ModelMap map){
		if(null==voId){
			map.put("saveMsg", " 投票不能为空!!!");
			return "vote";
		}else{
			//判断是否是重复投票
			if(!itemService.checkReVote(vsId,vuId)){
				for(int i:voId){
					//将投票数据插入数据库
					if(!itemService.vote(vsId,vuId,i)){
						LogManager.getLogger().error("插入数据出错。");
						return "subject/addNewVote";
					}
				}
			}else{
				//不可重复投票
				map.put("saveMsg", " 不能重复投票!!!");
				return "vote";
			}
		}
		//跳到投票显示页面
		return "vote_success";
	}
}
