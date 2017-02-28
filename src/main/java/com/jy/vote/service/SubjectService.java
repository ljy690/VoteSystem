package com.jy.vote.service;

import java.util.List;

import com.jy.vote.entity.Search;
import com.jy.vote.entity.VoteList;
import com.jy.vote.entity.VoteSubject;

public interface SubjectService {
	List<VoteSubject> getSubjectAll();

	VoteSubject getSubjectAllById(int vsId);

	VoteSubject getCurrSubject(int vsId);

	int addNewSubject(VoteSubject voteSubject);

	int getCurrSequence();

	VoteList getSubjectListByPage(int pageSize, int pageNum);

	VoteList getMySetByPage(int pageSize, int pageNum, int vsvuId);

	int closeVote(int vsId);

	int deleteVote(int vsId);

	VoteList getMyJoinByPage(int pageSize, int pageNum, int vuId);

	VoteList getSearchListByPage(int pageSize, int pageNum, String sRole,String kwords);

}
