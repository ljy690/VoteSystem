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

	@ResponseBody
	@RequestMapping(value="/listAll")
	public VoteList listAll(@RequestParam(value="pageNum") int pageNum,@RequestParam(value="pageSize") int pageSize){
		VoteList voteList=subjectService.getSubjectListByPage(pageSize,pageNum);
		//LogManager.getLogger().debug("list请求成功。。。。。。。。。。。");
		if(voteList!=null && !"".equals(voteList)){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
			return voteList;
		}
		return null;
	}

	@RequestMapping(value="/jumpList")
	public String jumpList(){
		return "list";
	}

	@RequestMapping(value="/addNewVote")
	public String addNewVote(){
		return "add";
	}

	//添加新投票
	@RequestMapping(value="/addNewSubject")
	public String addNewSubject(ModelMap map,VoteSubject voteSubject,BindingResult bindingResult,
			@RequestParam(value="voOption",required=false) String[] voOption,
			@RequestParam(value="voIntro",required=false) String[] voIntro,
			HttpSession session){
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
				if(!ops.equals("") && ops != null){
					optionService.addOptions(vsId,ops,voIntro[i],++i);
				}
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

	//查询我发布的所有投票
	@ResponseBody
	@RequestMapping(value="/mySetUpVote")
	public VoteList mySetUpVote(int pageSize,int pageNum,HttpSession session){
		//从数据库查出我发布的投票
		VoteUser user=(VoteUser) session.getAttribute(SessionAttributeInfo.CurrUser);
		VoteList voteList=subjectService.getMySetByPage(pageSize,pageNum,user.getVuId());
		//LogManager.getLogger().debug("list请求成功。。。。。。。。。。。");
		if(voteList!=null && !"".equals(voteList)){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
			return voteList;
		}
		return null;
	}

	//关闭投票
	@RequestMapping(value="/closeVote")
	public String closeVote(int vsId,HttpSession session){
		//关闭我发布的投票(隐藏)，将投票主题状态设为2  其他用户只能查看了
		if(subjectService.closeVote(vsId)!=1){
			LogManager.getLogger().error("closeVote投票关闭失败。");
		}
		return "mySet";
	}

	//开启投票
	@RequestMapping(value="/openVote")
	public String openVote(int vsId,HttpSession session){
		//开启我发布的投票，将投票主题状态设为1  
		if(subjectService.openVote(vsId)!=1){
			LogManager.getLogger().error("openVote投票开启失败。");
		}
		return "mySet";
	}

	//普通用户删除投票
	@RequestMapping(value="/userDelete")
	public String userDelete(int vsId){
		deleteVote(vsId);
		return "mySet";
	}

	//删除投票
	private void deleteVote(int vsId){
		//删除我发布的投票(隐藏)，  将状态设为3，普通用户删除的投票就只有管理员可见了
		if(subjectService.deleteVote(vsId)!=1){
			LogManager.getLogger().error("closeVote投票删除失败。");
		}
	}

	@RequestMapping(value="/jumpMyJoinedVote")
	public String jumpMyJoinedVote(){
		return "myJoin";
	}

	//我参与的投票
	@ResponseBody
	@RequestMapping(value="/myJoinVote")
	public VoteList myJoinVote(int pageSize,int pageNum,HttpSession session){
		//从数据库查出我参与的投票
		VoteUser user=(VoteUser) session.getAttribute(SessionAttributeInfo.CurrUser);
		VoteList voteList=subjectService.getMyJoinByPage(pageSize,pageNum,user.getVuId());
		//LogManager.getLogger().debug("list请求成功。。。。。。。。。。。");
		if(voteList!=null && !"".equals(voteList)){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
			return voteList;
		}
		return null;
	}

	@RequestMapping(value="/jumpSearch")
	public String jumpSearch(String searchRole,String keywords){
		SessionAttributeInfo.searchObj=searchRole;
		SessionAttributeInfo.searchWords=keywords;
		return "search";
	}

	//普通用户搜索投票
	@ResponseBody
	@RequestMapping(value="/search")
	public VoteList search(@RequestParam(value="pageNum") int pageNum,
			@RequestParam(value="pageSize") int pageSize){
		VoteList voteList;
		if(SessionAttributeInfo.searchObj.equals("用户")){
			voteList=subjectService.getSearchListByPage(pageSize,pageNum,"user",SessionAttributeInfo.searchWords);
		}else{
			voteList=subjectService.getSearchListByPage(pageSize,pageNum,"sub",SessionAttributeInfo.searchWords);
		}
		if(voteList!=null && !"".equals(voteList)){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
			return voteList;
		}
		return null;
	}

	@RequestMapping(value="/jumpAdminSearch")
	public String jumpAdminSearch(String searchRole,String keywords){
		if(searchRole!=null && keywords !=null){
			SessionAttributeInfo.searchObj=searchRole;
			SessionAttributeInfo.searchWords=keywords;
			if(searchRole.equals("用户")){
				return "adminSearchUser";
			}else{
				return "adminSearchSubject";
			}
		}else{
			String oneobj=SessionAttributeInfo.searchObj;
			if(oneobj!=null && oneobj.equals("用户")){
				return "adminSearchUser";
			}else if(oneobj!=null && oneobj.equals("主题")){
				return "adminSearchSubject";
			}else{
				LogManager.getLogger().error("没有获取到搜索信息。");
			}
			return null;
		}

	}

	//管理员搜索
	@ResponseBody
	@RequestMapping(value="/adminSearchSubject")
	public VoteList adminSearchSubject(@RequestParam(value="pageNum") int pageNum,
			@RequestParam(value="pageSize") int pageSize){
		VoteList voteList=subjectService.getSearchSubjectListByPage(pageSize,pageNum,SessionAttributeInfo.searchWords);
		if(voteList!=null && !"".equals(voteList)){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
			return voteList;
		}
		return null;
	}

	//管理员管理所有投票
	@RequestMapping(value="/jumpManageVote")
	public String jumpManageVote(){
		return "manage";
	}

	//管理员管理所有投票
	@ResponseBody
	@RequestMapping(value="/manageAll")
	public VoteList manageAll(@RequestParam(value="pageNum") int pageNum,
			@RequestParam(value="pageSize") int pageSize){
		VoteList voteList=subjectService.getSubjectManageListByPage(pageSize,pageNum);
		if(voteList!=null && !"".equals(voteList)){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
			return voteList;
		}
		return null;
	}

	//管理员删除投票
	@RequestMapping(value="/adminDelete")
	public String adminDelete(int vsId){
		deleteVote(vsId);
		return "manage";
	}


	//查询某个用户发布的所有投票
	@ResponseBody
	@RequestMapping(value="/onesvote")
	public VoteList onesvote(int pageNum,int pageSize,HttpSession session){
		//从数据库查出我发布的投票
		VoteUser vu=(VoteUser) session.getAttribute(SessionAttributeInfo.SeeUser);
		VoteList voteList=subjectService.getMySetByPage(pageSize,pageNum,vu.getVuId());
		if(voteList!=null && !"".equals(voteList)){
			if(voteList.getTotal()%pageSize==0){
				voteList.setTotal(voteList.getTotal()/pageSize);
			}else{
				voteList.setTotal(((int)(voteList.getTotal()/pageSize))+1);
			}
			return voteList;
		}
		return null;
	}
}
