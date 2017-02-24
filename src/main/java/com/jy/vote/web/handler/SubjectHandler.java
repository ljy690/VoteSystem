package com.jy.vote.web.handler;

import java.io.PrintWriter;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.vote.entity.VoteList;
import com.jy.vote.entity.VoteSubject;
import com.jy.vote.service.OptionService;
import com.jy.vote.service.SubjectService;

@Controller
@RequestMapping("/subject")
public class SubjectHandler {

	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private OptionService optionService;

	@ResponseBody
	@RequestMapping(value="/listAll")
	public VoteList listAll(@RequestParam(value="pageNum") int pageNum,@RequestParam(value="pageSize") int pageSize){
		VoteList voteList=subjectService.getSubjectListByPage(pageSize,pageNum);
		LogManager.getLogger().debug("list请求成功。。。。。。。。。。。");
		if(voteList!=null){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
		}
		return voteList;
	}

	@RequestMapping(value="/jumpList")
	public String jumpList(){
		return "list";
	}

	@RequestMapping(value="/addNewVote")
	public String addNewVote(){
		return "add";
	}

	@RequestMapping(value="/addNewSubject")
	public String addNewSubject(ModelMap map,VoteSubject voteSubject,BindingResult bindingResult,
			@RequestParam(value="voOption",required=false) String[] voOption){
		System.out.println("新增的投票："+voteSubject);
		if(bindingResult.hasFieldErrors()){
			map.put("addSbErrorMsg", "添加投票失败");
			return "add";
		}
		//获取到当前的序列
		int vsId=subjectService.getCurrSequence();
		System.out.println("当前的序列号"+vsId);
		voteSubject.setVsId(vsId);
		//添加主题
		if(subjectService.addNewSubject(voteSubject)==1){
			//添加选项
			int i=0;
			for(String ops:voOption){
				optionService.addOptions(vsId,ops,++i);
			}
		}else{
			map.put("addSbErrorMsg", "添加投票失败");
			return "add";
		}
		return "add_success";
	}
}
