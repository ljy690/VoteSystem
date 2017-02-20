package com.jy.vote.web.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.vote.entity.VoteOption;
import com.jy.vote.service.ItemService;
import com.jy.vote.service.OptionService;

@Controller
@RequestMapping("/option")
public class OptionHandler {
	@Autowired
	private OptionService optionService;
	
	@Autowired
	private ItemService itemService;

	@RequestMapping(value="/view")
	public String showOption(int vsId,ModelMap map,HttpSession session,HttpServletRequest request){
		LogManager.getLogger().debug("查看投票结果，vsId=>" + vsId);
		//System.out.println("a标签进来会有一个get有一个post");
		String usname=(String) session.getAttribute("currUser");
		List<VoteOption> options = optionService.getSbOpsById(vsId);
		map.put("options", options);
		if(itemService.checkVsVoteStatus(vsId,usname)){
			//说明没有进行过投票     ${sessionScope.存属性名}
			return "vote";
		}else{
			return "view";
		}
	}
}
