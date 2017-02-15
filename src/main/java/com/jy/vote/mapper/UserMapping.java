package com.jy.vote.mapper;

import com.jy.vote.entity.VoteUser;

public interface UserMapping {
	int insertUser(VoteUser user);

	VoteUser findUserByNP(VoteUser user);

	VoteUser checkName(String vuUsername);

	int changeStatus(String vuUsername);
	
}
