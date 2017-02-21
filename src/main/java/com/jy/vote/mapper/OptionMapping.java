package com.jy.vote.mapper;

import java.util.List;

import com.jy.vote.entity.VoteOption;
import com.jy.vote.entity.VoteSubject;


public interface OptionMapping {
	//查看投票内容
	List<VoteOption> getSbOpsById(int vsId);

	List<VoteOption> checkSoInfo(int vsId);
}
