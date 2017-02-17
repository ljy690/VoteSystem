package com.jy.vote.mapper;

import com.jy.vote.entity.VoteUser;

public interface UserMapping {
	int insertUser(VoteUser user);

	VoteUser findUserByNP(VoteUser user);

	VoteUser checkName(String vuUsername);

	int changeStatus(String vuUsername);
	
	//检测邮箱是否被占用
	VoteUser checkEmail(String email);
}
