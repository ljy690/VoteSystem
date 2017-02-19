package com.jy.vote.web.handler;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.vote.entity.VoteOption;
import com.jy.vote.service.OptionService;

@Controller
@RequestMapping("/option")
public class OptionHandler {
	@Autowired
	private OptionService optionService;

	@RequestMapping("/view")
	public String showOption(int vsId,ModelMap map){
		LogManager.getLogger().debug("查看投票结果，vsId=>" + vsId);
		//System.out.println("a标签进来会有一个get有一个post");
		//主题的选项详细，包括总人数
		List<VoteOption> options = optionService.getSbOpsById(vsId);
		System.out.println(options+"看一下");
		map.put("options", options);
		return "view";
	}
}
