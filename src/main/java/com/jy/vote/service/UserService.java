package com.jy.vote.service;

import com.jy.vote.entity.VoteUser;

public interface UserService {
	boolean register(VoteUser user);
	
	VoteUser login(VoteUser user);

	//检测账号是否存在
	boolean checkName(String username);

	//激活账号
	int changeStatus(String username);

	//检测邮箱是否被占用
	boolean checkEmail(String email);

	//检测邮箱是否已经激活
	boolean checkStatus(String username);

	VoteUser checkUserId(String username);

	int changeUserInfo(VoteUser user);
}
