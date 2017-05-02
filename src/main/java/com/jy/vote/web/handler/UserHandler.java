package com.jy.vote.web.handler;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
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

import com.jy.vote.entity.UsersList;
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
		LogManager.getLogger().debug("当前的激活成功用户是：===>"+username);
		//通过用户名查询当前用户信息
		VoteUser currUser = userService.checkUserId(username);
		//判断用户状态
		if(currUser==null || currUser.getVuStatus()==3){
			//说明账号不存在或者已经被删除,重新注册
			return "rereg";
		}else if(currUser.getVuStatus()==1){
			//说明用户未激活
			if(userService.changeStatus(username)>0){
				LogManager.getLogger().debug("激活账号。");
				return "reg_success";
			}else{
				LogManager.getLogger().error("账号激活失败。");
			}
		}else if(currUser.getVuStatus()==2){
			//说明账号已经激活
			return "reg_error";
		}
		return "rereg";
	}

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String showRegister(VoteUser voteUser){
		return "register";
	}

	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("voteUser")VoteUser user,BindingResult bindingResult,
			ModelMap map,HttpServletRequest request){
		LogManager.getLogger().debug("当前注册的用户：===》"+user);
		if(bindingResult.hasFieldErrors()){
			map.put("regErrorMsg", "注册失败!!!");
			return "register";
		}
		//将用户信息插入数据库
		if(userService.register(user)){
			//成功注册，发送邮件，激活账号
			//接收激活用户的连接地址
			activeSendMail("激活用户",getContentSend(request,user.getVuUsername()),user.getVuEmail(),"ljy_690@163.com");
			LogManager.getLogger().debug("邮件发送结束");
			return "active";
		}
		map.put("regErrorMsg", "注册失败!!!");
		return "register";
	}

	//登陆跳转
	@RequestMapping(value="/login")
	public String login(VoteUser voteUser,ModelMap map,HttpSession session){
		LogManager.getLogger().debug("user login..."+voteUser);
		VoteUser vuer=(VoteUser) session.getAttribute(SessionAttributeInfo.CurrUser);
		if(vuer == null && voteUser.getVuUsername()==null){
			return "login";
		}else if(vuer==null &&  voteUser.getVuUsername()!=null){
			VoteUser currUser = userService.checkUserId(voteUser.getVuUsername());
			session.setAttribute( SessionAttributeInfo.CurrUser, currUser);
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
			if(voteUser.getVuStatus()==3){
				map.put("errorMsg", "该用户不存在。");
				return "login";
			}
			if(voteUser.getVuUsername().trim().equals("admin")){
				return "manage";
			}
		}else{
			if(vuer.getVuUsername().equals("admin")){
				return "manage";
			}else{
				return "list";
			}
		}
		return "list";
	}

	//等待激活时，跳到登陆界面
	@RequestMapping(value="/jumpLogin")
	public String jumpLogin(HttpSession session){
		LogManager.getLogger().debug("jump user login...");
		session.setAttribute(SessionAttributeInfo.CurrUser, null);
		return "login";
	}

	@ResponseBody
	@RequestMapping(value="/checkUname")
	public boolean checkUname(VoteUser voteUser){
		//System.out.println("检测用户"+voteUser.getVuUsername().trim()+"是否被用...");
		boolean result=userService.checkName(voteUser.getVuUsername().trim()); 
		return result;
	}

	@ResponseBody
	@RequestMapping(value="/checkEmail")
	public boolean checkEmail(VoteUser voteUser){
		//System.out.println("检测邮箱"+voteUser.getVuEmail().trim()+"是否被用...");
		boolean result=userService.checkEmail(voteUser.getVuEmail().trim()); 
		return result;
	}

	//用户中心
	@RequestMapping(value="/userCenter")
	public String userCenter(){
		return "userCenter";
	}

	//管理员中心
	@RequestMapping(value="/adminCenter")
	public String adminCenter(){
		return "adminCenter";
	}

	//修改用户信息
	@RequestMapping(value="/changeUserInfo")
	public String changeUserInfo(VoteUser user,ModelMap map,HttpSession session){
		//将信息插入数据库
		LogManager.getLogger().debug(user+"修改信息");
		if(userService.changeUserInfo(user)==1){
			session.setAttribute( SessionAttributeInfo.CurrUser, userService.checkUserId(user.getVuUsername()));
			return "changeinfo_success";
		}
		map.put("regErrorMsg", "信息修改失败!!!");
		return "userCenter";
	}

	//修改管理员密码
	@RequestMapping(value="/changeAdminInfo")
	public String changeAdminInfo(VoteUser user,ModelMap map,HttpSession session){
		//将信息插入数据库
		LogManager.getLogger().debug(user+"修改密码");
		if(userService.changeAdminPass(user)==1){
			return "changeAdminInfo_success";
		}
		map.put("regErrorMsg", "密码修改失败!!!");
		return "adminCenter";
	}

	@RequestMapping(value="/jumpManageUser")
	public String jumpManageUser(){
		return "manageUsers";
	}

	//管理所有的用户
	@ResponseBody
	@RequestMapping(value="/manageAllUsers")
	public UsersList getAllUsers(@RequestParam(value="pageNum") int pageNum,
			@RequestParam(value="pageSize") int pageSize){
		UsersList users = userService.getAllUsers(pageSize,pageNum);
		if(users!=null && !"".equals(users)){
			if(users.getTotal()%pageSize==0){
				users.setTotal(users.getTotal()/pageSize);
			}else{
				users.setTotal(((int)(users.getTotal()/pageSize))+1);
			}
			return users;
		}
		return null;
	}

	//激活用户
	@RequestMapping(value="/upUser")
	public String upUser(int vuId){
		LogManager.getLogger().debug("激活用户:"+vuId);
		if(userService.adminChangeStatus(vuId)!=1){
			LogManager.getLogger().error("激活用户失败");
		}
		return "manageUsers";
	}

	//删除用户
	@RequestMapping(value="/deleteUser")
	public String deleteUser(int vuId){
		LogManager.getLogger().debug("删除用户:"+vuId);
		int result=userService.deleteUser(vuId);
		if(result!=1){
			LogManager.getLogger().error("删除用户失败");
		}
		return "manageUsers";
	}

	//查看某个用户信息
	@RequestMapping(value="/seeUser")
	public String seeUser(int vuId,HttpSession session){
		VoteUser seeUser = userService.getOneUser(vuId);
		if(seeUser==null){
			LogManager.getLogger().error("该用户不存在。");
		}
		session.setAttribute( SessionAttributeInfo.SeeUser, seeUser);
		return "seeUser";
	}

	@RequestMapping(value="/jumpOnes")
	public String jumpOnes(String vuUsername,HttpSession session){
		//查出当前用户信息存入数据字典
		session.setAttribute(SessionAttributeInfo.SeeUser,userService.checkUserId(vuUsername) );
		return "onesSet";
	}

	//管理员搜索用户
	@ResponseBody
	@RequestMapping(value="/adminSearchUser")
	public UsersList adminSearchUser(@RequestParam(value="pageNum") int pageNum,
			@RequestParam(value="pageSize") int pageSize){
		//根据用户名模糊搜索
		UsersList userList=userService.getAdminSearchUsersListByPage(pageSize,pageNum,SessionAttributeInfo.searchWords);
		if(userList!=null && !"".equals(userList)){
			if(userList.getTotal()%pageSize==0){
				userList.setTotal(userList.getTotal()/pageSize);
			}else{
				userList.setTotal(((int)(userList.getTotal()/pageSize))+1);
			}
			return userList;
		}
		return null;
	}
	/**
	 * 链接地址
	 * @param request
	 */
	private String getContentSend(HttpServletRequest request,String username) {
		// activeURL===>http://localhost:8080/VoteSystem/user/active/
		String activeURL = request.getScheme()+"://"+request.getServerName()+":"
				+request.getServerPort()+request.getContextPath()+"/user/register_success?username="+username;
		activeURL = String.format("<a href='%s'>%s</a><br/><br/>如果此链接无效，请您将此链接拷贝到地址栏激活...%s",
				activeURL, "激活用户",activeURL);
		return activeURL;
	}

	//发送邮件
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

}
