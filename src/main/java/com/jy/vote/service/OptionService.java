package com.jy.vote.service;

import java.util.List;

import com.jy.vote.entity.VoteOption;

public interface OptionService {
	//查看投票
	List<VoteOption> getSbOpsById(int vsId);

	//提供投票所需的信息
	List<VoteOption> checkSoInfo(int vsId);

	void addOptions(int vsId, String ops, String voIntro, int i);

	//查看分析的结果
	List<VoteOption> analyzeSubject(int vsId);
}
