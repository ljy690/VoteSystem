package com.jy.vote.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.vote.entity.VoteList;
import com.jy.vote.entity.VoteSubject;
import com.jy.vote.mapper.SubjectMapping;
import com.jy.vote.service.SubjectService;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectMapping subjectMapping;
	
	@Override
	public List<VoteSubject> getSubjectAll() {
		 return subjectMapping.getSubjectAll();
	}

	@Override
	public VoteSubject getSubjectAllById(int vsId) {
		return subjectMapping.getSubjectAllById(vsId);
	}

	@Override
	public VoteSubject getCurrSubject(int vsId) {
		return subjectMapping.getCurrSubject(vsId);
	}

	@Override
	public int addNewSubject(VoteSubject voteSubject) {
		return subjectMapping.addNewSubject(voteSubject);
	}

	@Override
	public int getCurrSequence() {
		return subjectMapping.getCurrSequence();
	}

	@Override
	public VoteList getSubjectListByPage(int pageSize, int pageNum) {
		return subjectMapping.getSubjectListByPage(pageSize,pageNum);
	}

	@Override
	public VoteList getMySetByPage(int pageSize, int pageNum,int vsvuId) {
		return subjectMapping.getMySetByPage(pageSize,pageNum,vsvuId);
	}

	@Override
	public int closeVote(int vsId) {
		return subjectMapping.closeVote(vsId);
	}

	@Override
	public int deleteVote(int vsId) {
		return subjectMapping.deleteVote(vsId);
	}

	@Override
	public VoteList getMyJoinByPage(int pageSize, int pageNum, int vuId) {
		return subjectMapping.getMyJoinByPage(pageSize,pageNum,vuId);
	}

	@Override
	public VoteList getSearchListByPage(int pageSize, int pageNum, String sRole,String kwords) {
		return subjectMapping.getSearchListByPage(pageSize, pageNum, sRole,kwords);
	}

	@Override
	public VoteList getSubjectManageListByPage(int pageSize, int pageNum) {
		return subjectMapping.getSubjectManageListByPage(pageSize,pageNum);
	}

	@Override
	public int openVote(int vsId) {
		return subjectMapping.openVote(vsId);
	}

	
}
