package com.jy.vote.mapper;

import java.util.List;

import com.jy.vote.entity.VoteList;
import com.jy.vote.entity.VoteSubject;


public interface SubjectMapping {
	List<VoteSubject> getSubjectAll();

	VoteSubject getSubjectAllById(int vsId);

	VoteSubject getCurrSubject(int vsId);

	int addNewSubject(VoteSubject voteSubject);

	int getCurrSequence();

	VoteList getSubjectListByPage(int pageSize, int pageNum);

	VoteList getMySetByPage(int pageSize, int pageNum, int vsvuId);

	int closeVote(int vsId);

	int deleteVote(int vsId);

}
