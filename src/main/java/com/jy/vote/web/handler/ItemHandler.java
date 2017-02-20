package com.jy.vote.web.handler;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jy.vote.entity.VoteItem;
import com.jy.vote.service.ItemService;

@Controller
@RequestMapping("/voteitem")
public class ItemHandler {
	@Autowired
	private ItemService itemService;

	@RequestMapping(value="/vote")
	public String showOption(@Valid @ModelAttribute("voteItem")VoteItem item,BindingResult bindingResult,ModelMap map){
		System.out.println("可以取到么？"+item);
		
		/*if(bindingResult.hasFieldErrors()){
			map.put("saveMsg", " 失败!!!");
			return "register";
		}
		String[] voId=ServletActionContext.getRequest().getParameterValues("voId");
		LogManager.getLogger().debug("save取到item"+item+"voId="+Arrays.toString(voId));
		try {
			itemService.saveVote(item,voId);
				return "saveSuccess";
		} catch (Exception e) {
			
		}
		map.put("saveMsg", "投票失败");*/
		return "view";
	}
}
