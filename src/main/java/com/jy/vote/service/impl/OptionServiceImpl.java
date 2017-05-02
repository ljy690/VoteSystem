package com.jy.vote.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.vote.entity.AnalyzeData;
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

	@Override
	public List<VoteOption> checkSoInfo(int vsId) {
		return optionMapping.checkSoInfo(vsId);
	}

	@Override
	public void addOptions(int vsId, String ops,String voIntro, int i) {
		optionMapping.addOptions(vsId,ops,voIntro,i);
	}

	@Override
	public List<VoteOption> analyzeSubject(int vsId) {
		return optionMapping.analyzeSubject(vsId);
	}

	@Override
	public List<AnalyzeData> getHotData(int num, int vsId) {
		return optionMapping.getHotData(num,vsId);
	}

	@Override
	public List<AnalyzeData> getHotFdata(int num, int vsId) {
		return optionMapping.getHotFdata(num,vsId);
	}

	@Override
	public List<AnalyzeData> getHotMdata(int num, int vsId) {
		return optionMapping.getHotMdata(num,vsId);
	}

}
