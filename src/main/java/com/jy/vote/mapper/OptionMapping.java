package com.jy.vote.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.vote.entity.AnalyzeData;
import com.jy.vote.entity.VoteOption;


public interface OptionMapping {
	//查看投票内容
	List<VoteOption> getSbOpsById(int vsId);

	List<VoteOption> checkSoInfo(int vsId);

	void addOptions(@Param("vsId")int vsId,@Param("ops")String ops,@Param("voIntro") String voIntro, @Param("voUrl")String voUrl, @Param("i")int i,@Param("picName") String picName);

	//获取投票分析结果
	List<VoteOption> analyzeSubject(int vsId);

	List<AnalyzeData> getHotData(int num, int vsId);

	List<AnalyzeData> getHotFdata(int num, int vsId);

	List<AnalyzeData> getHotMdata(int num, int vsId);

	List<VoteOption> seeDetails(int vsId);
}
