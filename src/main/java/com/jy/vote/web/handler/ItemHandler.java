package com.jy.vote.web.handler;

import javax.servlet.http.HttpSession;

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

	@RequestMapping(value="/vote")
	public String showOption(@RequestParam(value="voId",required=false) int[] voId,
			@RequestParam("vsId") int vsId,@RequestParam("vuId") int vuId,
			HttpSession session,ModelMap map){
		//System.out.println("可以取到么？"+voteItem);VoteItem [viId=0, voId=9, vsId=1, vuId=1000010]
		//System.out.println("看一下当前的选项"+voId+"主题"+vsId+"用户"+vuId);
		if(null==voId){
			map.put("saveMsg", " 投票不能为空!!!");
			return "vote";
		}else{
			for(int i:voId){
				//将投票数据插入数据库
				if(!itemService.vote(vsId,vuId,i)){
					return "view";
				}
			}
		}
		//跳到投票显示页面
		return "vote_success";
	}
}
