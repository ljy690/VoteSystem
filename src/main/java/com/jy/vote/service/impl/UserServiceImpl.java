package com.jy.vote.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.vote.entity.VoteUser;
import com.jy.vote.mapper.UserMapping;
import com.jy.vote.service.UserService;
import com.jy.vote.util.Encrypt;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapping userMapping;
	
	@Override
	public boolean register(VoteUser user) {
		user.setVuPassword(Encrypt.md5AndSha( user.getVuPassword() ));
		try {
			return userMapping.insertUser(user) > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public VoteUser login(VoteUser user) {
		user.setVuPassword(Encrypt.md5AndSha(user.getVuPassword()));
		return userMapping.findUserByNP(user);
	}

	@Override
	public boolean checkName(String username) {
		 VoteUser user = userMapping.checkName(username);
		 if(null == user){
			 return false;
		 }
		 return true;
	}

	@Override
	public int changeStatus(String username) {
		return userMapping.changeStatus(username);
	}

	@Override
	public boolean checkEmail(String email) {
		VoteUser user = userMapping.checkEmail(email);
		 if(null == user){
			 return false;
		 }
		 return true;
	}

	@Override
	public boolean checkStatus(String username) {
		VoteUser user = userMapping.checkStatus(username);
		if(null==user){//代表已经激活
			return false;
		}
		return true;
	}

	@Override
	public VoteUser checkUserId(String username) {
		return userMapping.checkName(username);
	}

	@Override
	public int changeUserInfo(VoteUser user) {
		user.setVuPassword(Encrypt.md5AndSha( user.getVuPassword() ));
		int re = userMapping.changeUserInfo(user);
		return re;
	}
}
