package com.jy.vote.web.handler;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jy.vote.entity.VoteItem;
import com.jy.vote.entity.VoteSubject;
import com.jy.vote.service.ItemService;
import com.jy.vote.util.SessionAttributeInfo;

@Controller
@RequestMapping("/voteitem")
public class ItemHandler {
	@Autowired
	private ItemService itemService;

	@RequestMapping(value="/vote")
	public String showOption(@ModelAttribute VoteItem voteItem,@RequestParam("voId") int[] voId,
			HttpSession session,BindingResult bindingResult,ModelMap map){
		//System.out.println("可以取到么？"+voteItem);VoteItem [viId=0, voId=9, vsId=1, vuId=1000010]
		if(bindingResult.hasFieldErrors()){
			map.put("saveMsg", " 投票失败!!!");
			return "view";
		}
		for(int i:voId){
			//将投票数据插入数据库
			VoteSubject sub=(VoteSubject)session.getAttribute(SessionAttributeInfo.CurrSubject);
			if(!itemService.vote(sub.getVsId(),voteItem.getVuId(),i)){
				map.put("saveMsg", " 没有选择，投票失败!!!");
				return "view";
			}
		}
		//跳到投票显示页面
		return "vote_success";
	}
}
