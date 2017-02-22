package com.jy.vote.web.handler;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.jy.vote.entity.VoteSubject;
import com.jy.vote.service.SubjectService;

@Controller
@RequestMapping("/subject")
public class SubjectHandler {
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping(value="/listAll")
	public void listAll(PrintWriter out){
		List<VoteSubject> subjects = subjectService.getSubjectAll();
		LogManager.getLogger().debug("list请求成功。。。。。。。。。。。");
		Gson gson = new Gson();
		out.print(gson.toJson(subjects));
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="/jumpList")
	public String jumpList(){
		return "list";
	}
	
	@RequestMapping(value="/addNewVote")
	public String addNewVote(){
		return "add";
	}
}
