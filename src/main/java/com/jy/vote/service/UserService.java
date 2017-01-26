package com.jy.vote.service;

import com.jy.vote.entity.VoteUser;

public interface UserService {
	boolean register(VoteUser user);
	
	VoteUser login(VoteUser user);

	boolean checkName(String username);

	//激活账号
	int changeStatus(String username);
}
