package com.jy.vote.web.handler;

import javax.servlet.http.HttpSession;

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
import com.jy.vote.entity.VoteUser;
import com.jy.vote.service.OptionService;
import com.jy.vote.service.SubjectService;
import com.jy.vote.util.SessionAttributeInfo;

@Controller
@RequestMapping("/subject")
public class SubjectHandler {

	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private OptionService optionService;

	String sRole=null;
	String kwords=null;
	
	@ResponseBody
	@RequestMapping(value="/listAll")
	public VoteList listAll(@RequestParam(value="pageNum") int pageNum,@RequestParam(value="pageSize") int pageSize){
		VoteList voteList=subjectService.getSubjectListByPage(pageSize,pageNum);
		System.out.println("没有取出"+voteList);
		//LogManager.getLogger().debug("list请求成功。。。。。。。。。。。");
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
			@RequestParam(value="voOption",required=false) String[] voOption,HttpSession session){
		//System.out.println("新增的投票："+voteSubject);
		if(bindingResult.hasFieldErrors()){
			map.put("addSbErrorMsg", "添加投票失败");
			return "add";
		}
		//获取到当前的序列
		int vsId=subjectService.getCurrSequence();
		//将新增的序列号存到session方便之后跳转取值
		voteSubject.setVsId(vsId);
		session.setAttribute(SessionAttributeInfo.CurrSubject, voteSubject);
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
	
	@RequestMapping(value="/jumpMySetUpVote")
	public String jumpMySetUpVote(){
		return "mySet";
	}
	
	@ResponseBody
	@RequestMapping(value="/mySetUpVote")
	public VoteList mySetUpVote(int pageSize,int pageNum,HttpSession session){
		//从数据库查出我发布的投票
		VoteUser user=(VoteUser) session.getAttribute(SessionAttributeInfo.CurrUser);
		VoteList voteList=subjectService.getMySetByPage(pageSize,pageNum,user.getVuId());
		//LogManager.getLogger().debug("list请求成功。。。。。。。。。。。");
		System.out.println("set没有取出"+voteList);
		if(voteList!=null){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
			return voteList;
		}else{
			return voteList;
		}
	}
	
	@RequestMapping(value="/closeVote")
	public String closeVote(int vsId,HttpSession session){
		//关闭我发布的投票(隐藏) 询问一下用户  将状态设为2  也只能查看了
		if(subjectService.closeVote(vsId)!=1){
			System.out.println("closeVote投票关闭失败。");
		}
		return "mySet";
	}
	
	@RequestMapping(value="/userDelete")
	public String userDelete(int vsId,HttpSession session){
		//删除我发布的投票(隐藏) 询问一下用户  将状态设为3
		if(subjectService.deleteVote(vsId)!=1){
			System.out.println("closeVote投票删除失败。");
		}
		return "mySet";
	}
	
	
	@RequestMapping(value="/jumpMyJoinedVote")
	public String jumpMyJoinedVote(){
		return "myJoin";
	}
	
	@ResponseBody
	@RequestMapping(value="/myJoinVote")
	public VoteList myJoinVote(int pageSize,int pageNum,HttpSession session){
		//从数据库查出我参与的投票
		VoteUser user=(VoteUser) session.getAttribute(SessionAttributeInfo.CurrUser);
		VoteList voteList=subjectService.getMyJoinByPage(pageSize,pageNum,user.getVuId());
		//LogManager.getLogger().debug("list请求成功。。。。。。。。。。。");
		System.out.println("join没有取出"+voteList);
		if(voteList!=null){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
			return voteList;
		}else{
			return voteList;
		}
	}
	
	@RequestMapping(value="/jumpSearch")
	public String jumpSearch(String searchRole,String keywords){
		sRole=searchRole;
		kwords=keywords;
		return "search";
	}
	
	@ResponseBody
	@RequestMapping(value="/search")
	public VoteList search(@RequestParam(value="pageNum") int pageNum,@RequestParam(value="pageSize") int pageSize){
		VoteList voteList;
		if(sRole.equals("用户")){
			voteList=subjectService.getSearchListByPage(pageSize,pageNum,"user",kwords);
		}else{
			voteList=subjectService.getSearchListByPage(pageSize,pageNum,"sub",kwords);
		}
		
		//LogManager.getLogger().debug("list请求成功。。。。。。。。。。。");
		if(voteList!=null){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
		}
		return voteList;
	}
}
