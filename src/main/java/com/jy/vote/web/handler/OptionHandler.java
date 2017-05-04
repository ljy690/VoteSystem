package com.jy.vote.web.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.vote.entity.AnalyzeData;
import com.jy.vote.entity.VoteOption;
import com.jy.vote.entity.VoteSubject;
import com.jy.vote.entity.VoteUser;
import com.jy.vote.service.ItemService;
import com.jy.vote.service.OptionService;
import com.jy.vote.service.SubjectService;
import com.jy.vote.util.SessionAttributeInfo;

@Controller
@RequestMapping("/option")
public class OptionHandler {
	@Autowired
	private OptionService optionService;

	@Autowired
	private SubjectService subjectService;

	@Autowired
	private ItemService itemService;

	//查看投票内容
	@RequestMapping(value="/view",method=RequestMethod.GET)
	public String showOption(int vsId,ModelMap map,HttpSession session){
		//将当前的vsId存到session，方便之后使用   
		VoteSubject subject = subjectService.getCurrSubject(vsId);
		session.setAttribute(SessionAttributeInfo.CurrSubject, subject);

		VoteUser user= (VoteUser) session.getAttribute(SessionAttributeInfo.CurrUser);

		//判断当前投票是不是可投状态
		if(subject.getVsStatus()==1){//可投
			//判断当前是查看投票还是取出投票
			if(itemService.checkVsVoteStatus(vsId,user.getVuUsername())){
				//说明没有进行过投票     ${sessionScope.存属性名} 取option  以及类型
				List<VoteOption> optis =optionService.checkSoInfo(vsId);
				session.setAttribute(SessionAttributeInfo.Options, optis);
				return "vote";
			}else{
				getSubOp(map, vsId);
				return "view";
			}
		}else{
			getSubOp(map, vsId);
			return "view";
		}

	}


	@RequestMapping(value="/jumpView")
	public String jumpView(ModelMap map,HttpSession session){
		//重新获取主题信息
		VoteSubject vs = (VoteSubject) session.getAttribute(SessionAttributeInfo.CurrSubject);
		VoteSubject subject = subjectService.getCurrSubject( vs.getVsId());
		session.setAttribute(SessionAttributeInfo.CurrSubject, subject);
		getSubOp(map, vs.getVsId());
		return "view";
	}

	private void getSubOp(ModelMap map,int vsId){
		//查看投票结果
		List<VoteOption> options = optionService.getSbOpsById(vsId);
		map.put("options", options);
	}

	@RequestMapping(value="/directView")
	public String directView(int vsId,HttpSession session,ModelMap map){
		//重新获取主题信息
		VoteSubject subject = subjectService.getCurrSubject( vsId );
		session.setAttribute(SessionAttributeInfo.CurrSubject, subject);
		getSubOp(map, vsId);
		return "view";
	}

	@RequestMapping(value="/analyzeResult")
	public String analyzeResult(int vsId,HttpSession session,ModelMap map){
		//根据主题获取分析的结果
		VoteSubject subject = subjectService.getCurrSubject( vsId );
		session.setAttribute(SessionAttributeInfo.CurrSubject, subject);
		getSubAnaly(map, vsId);
		return "result";
	}

	private void getSubAnaly(ModelMap map,int vsId){
		//查看分析结果
		List<VoteOption> options = optionService.analyzeSubject(vsId);
		map.put("options", options);
	}

	/**
	 * 结果分析 ，获取最热门的数据
	 * @param vsId
	 * @param num  获取几条数据
	 * @param session
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/analyzeData")
	public Map<String,Object> analyzeData(int vsId,int num){
		//根据主题获取热门数据
		Map<String,Object> maps=new HashMap<String, Object>();
		//前几名
		List<AnalyzeData> adatas = optionService.getHotData( num,vsId );
		//男性前几名
		List<AnalyzeData> fdatas = optionService.getHotFdata( num,vsId );
		//女性前几名
		List<AnalyzeData> mdatas = optionService.getHotMdata( num,vsId );
		//存数据
		maps.put("sum", adatas);
		maps.put("fe", fdatas);
		maps.put("ma", mdatas);
		maps.put("num", num);
		return maps;
	}
	
	@RequestMapping(value="/seeDetails")
	public String seeDetails(int vsId,ModelMap map,HttpSession session){
		List<VoteOption> op=optionService.seeDetails(vsId);
		map.put("details", op);
		return "detail";
	}
}
