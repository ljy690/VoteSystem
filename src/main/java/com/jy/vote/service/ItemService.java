package com.jy.vote.service;


public interface ItemService {	
	//判断当前用户是否投过此主题
	boolean checkVsVoteStatus(int vsId, String usname);

	//投票
	boolean vote(int vsId, int vuId, int i);
}
