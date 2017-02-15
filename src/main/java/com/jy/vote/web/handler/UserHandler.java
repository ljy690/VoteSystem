package com.jy.vote.web.handler;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.vote.entity.VoteUser;
import com.jy.vote.service.UserService;
import com.jy.vote.util.SessionAttributeInfo;

@Controller
@RequestMapping("/user")
public class UserHandler {
	
	@Autowired
	private UserService userService;

	//跳转到激活成功的界面
	@RequestMapping(value="/register_success", method=RequestMethod.GET)
	public String registerSuccess(@RequestParam("username") String username,HttpSession session){
		System.out.println("当前的激活成功用户是：===>"+username);
		//将用户状态设置为激活
		if(userService.changeStatus(username)>0){
			session.setAttribute( SessionAttributeInfo.CurrUser, username);
			return "reg_success";
		};
		//否则跳到注册页面 ，不人性化 ，没有失败原因提醒
		return "register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String showRegister(VoteUser voteUser){
		return "register";
	}
	
	//注册新用户,加一句废话总行了吧
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("voteUser")VoteUser user,BindingResult bindingResult, ModelMap map,HttpServletRequest request){
		System.out.println("当前注册的用户：===》"+user);

		if(bindingResult.hasFieldErrors()){
			map.put("regErrorMsg", "注册失败!!!");
			return "register";
		}
		//将用户信息插入数据库
		if(userService.register(user)){
			//成功注册，发送邮件，激活账号
			//接收激活用户的连接地址
			activeSendMail("激活用户",getContentSend(request,user.getVuUsername()),user.getVuEmail(),"ljy_690@163.com");
			System.out.println("邮件发送结束");
			return "active";
		}
		map.put("regErrorMsg", "注册失败!!!");
		return "register";
	}
	
	@RequestMapping(value="/login")
	public String login(VoteUser voteUser,ModelMap map){
		System.out.println("user login..."+voteUser);
		//密码加密
		voteUser = userService.login(voteUser);
		//登陆结果页面跳转
		if(voteUser == null){
			map.put("errorMsg", "用户名或密码错误!!!");
			return "login";
		}
		if(voteUser.getVuStatus()==1){
			map.put("errorMsg", "用户未激活，请去邮箱激活后再进行操作...");
			return "login";
		}
		return "manage";
	}
	
	//等待激活时，跳到登陆界面
	@RequestMapping(value="/jumpLogin")
	public String jumpLogin(){
		System.out.println("jump user login...");
		return "login";
		
	}
	
/*	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(){
		System.out.println("点击返回的登陆界面...");
		return "login";
	}*/

	/**
	 * 链接地址
	 * @param request
	 */
	private String getContentSend(HttpServletRequest request,String username) {
		// activeURL===>http://localhost:8080/VoteSystem/user/active/
		String activeURL = request.getScheme()+"://"+request.getServerName()+":"
				+request.getServerPort()+request.getContextPath()+"/user/register_success?username="+username;
		activeURL = String.format("<a href='%s'>%s</a><br/><br/>如果此链接无效，请您将此链接拷贝到地址栏激活...%s",activeURL, "激活用户",activeURL);
		return activeURL;
	}

	@Autowired
	private JavaMailSender javaMailSender;
	private void activeSendMail(String subject,String content, String to,String from) {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		try {
			MimeMessageHelper mmHelper = new MimeMessageHelper(mimeMessage, true,"UTF-8");
			mmHelper.setTo(to);
			mmHelper.setFrom(from);
			mmHelper.setSubject(subject);//设置主题
			mmHelper.setText(content,true);//设置内容
			javaMailSender.send(mimeMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkUname")
	public boolean checkUname(VoteUser voteUser){
		//System.out.println("检测用户"+voteUser.getVuUsername().trim()+"是否被用...");
		boolean result=userService.checkName(voteUser.getVuUsername().trim()); 
		return result;
	}
}
