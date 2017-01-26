package com.jy.vote.web.handler;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jy.vote.entity.VoteSubject;
import com.jy.vote.service.OptionService;

@Controller
@RequestMapping("/option")
public class OptionHandler {
	//@Autowired
	//private OptionService optionService;
	
	@RequestMapping("/view")
	public void showOption(int vsId,PrintWriter out){
		//VoteSubject subject = optionService.showOption(vsId);
		//map.put("subject", subject);
		System.out.println("进来了，vsId=>" + vsId);
		out.print(true);
		out.flush();
		out.close();
	}
}
