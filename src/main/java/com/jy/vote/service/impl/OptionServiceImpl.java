package com.jy.vote.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.vote.entity.VoteOption;
import com.jy.vote.mapper.OptionMapping;
import com.jy.vote.service.OptionService;

@Service("optionService")
public class OptionServiceImpl implements OptionService {

	@Autowired
	private OptionMapping optionMapping;
	
	@Override
	public List<VoteOption> getSbOpsById(int vsId) {
		return optionMapping.getSbOpsById(vsId);
	}

}
