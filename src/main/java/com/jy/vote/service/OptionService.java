package com.jy.vote.service;

import java.util.List;

import com.jy.vote.entity.AnalyzeData;
import com.jy.vote.entity.VoteOption;

public interface OptionService {
	//查看投票
	List<VoteOption> getSbOpsById(int vsId);

	//提供投票所需的信息
	List<VoteOption> checkSoInfo(int vsId);

	void addOptions(int vsId, String ops, String voIntro, String voUrl, int i, String picName);

	//查看分析的结果
	List<VoteOption> analyzeSubject(int vsId);
	//总数据分析
	List<AnalyzeData> getHotData(int num, int vsId);
	//男性数据分析
	List<AnalyzeData> getHotFdata(int num, int vsId);
	//女性数据分析
	List<AnalyzeData> getHotMdata(int num, int vsId);
	//查看选项详情
	List<VoteOption> seeDetails(int vsId);
}
