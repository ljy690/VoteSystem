package com.jy.vote.mapper;

import com.jy.vote.entity.VoteItem;


public interface ItemMapping {
	//判断当前用户是否投过此主题
	VoteItem checkVsVoteStatus(int vsId, String usname);

	int vote(int vsId, int vuId, int i);
}
