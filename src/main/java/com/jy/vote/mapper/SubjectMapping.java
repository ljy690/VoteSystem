package com.jy.vote.mapper;

import java.util.List;

import com.jy.vote.entity.VoteSubject;


public interface SubjectMapping {
	List<VoteSubject> getSubjectAll();

	VoteSubject getSubjectAllById(int vsId);

	VoteSubject getCurrSubject(int vsId);
}
