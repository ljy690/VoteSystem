package com.jy.vote.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

	VoteList getMyJoinByPage(int pageSize, int pageNum, int vuId);

	VoteList getSearchListByPage(@Param("pageSize")int pageSize,@Param("pageNum") int pageNum, @Param("sRole")String sRole,@Param("kwords")String kwords);

	VoteList getSubjectManageListByPage(int pageSize, int pageNum);
	
	int openVote(int vsId);

}
