package com.jy.vote.service;

import java.util.List;

import com.jy.vote.entity.VoteOption;

public interface OptionService {
	//查看投票
	List<VoteOption> getSbOpsById(int vsId);

}
