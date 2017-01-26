package com.jy.vote.web.handler;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		Gson gson = new Gson();
		out.print(gson.toJson(subjects));
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="/view")
	public String view(int vsId,ModelMap map){
		VoteSubject subject = subjectService.getSubjectAllById(vsId);
		map.put("subject", subject);
		return "view";
	}
}
