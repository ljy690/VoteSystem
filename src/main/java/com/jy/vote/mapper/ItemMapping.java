package com.jy.vote.mapper;

import java.util.List;

import com.jy.vote.entity.VoteItem;


public interface ItemMapping {
	//判断当前用户是否投过此主题
	List<VoteItem> checkVsVoteStatus(int vsId, String usname);

	int vote(int vsId, int vuId, int i);

	VoteItem checkReVote(int vsId, int vuId);
}
