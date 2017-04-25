package com.jy.vote.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.vote.entity.VoteItem;
import com.jy.vote.mapper.ItemMapping;
import com.jy.vote.service.ItemService;

@Service("itemService")
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemMapping itemMapping;
	
	@Override
	public boolean checkVsVoteStatus(int vsId, String usname) {
		List<VoteItem> vo=itemMapping.checkVsVoteStatus(vsId, usname);
		if(0 == vo.size()){
			return true;
		}
		return false;
	}

	@Override
	public boolean vote(int vsId, int vuId, int i) {
		if(itemMapping.vote( vsId, vuId, i)==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean checkReVote(int vsId, int vuId) {
		VoteItem vi=itemMapping.checkReVote( vsId, vuId);
		if(vi==null){
			//代表没有投票
			return false;
		}
		return true;
	}

}
