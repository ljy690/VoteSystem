package com.jy.vote.service.impl;

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
		VoteItem vo=itemMapping.checkVsVoteStatus(vsId, usname);
		if(null == vo){
			return true;
		}
		return false;
	}

}
