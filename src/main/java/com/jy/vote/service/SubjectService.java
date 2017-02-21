package com.jy.vote.service;

import java.util.List;

import com.jy.vote.entity.VoteSubject;

public interface SubjectService {
	List<VoteSubject> getSubjectAll();

	VoteSubject getSubjectAllById(int vsId);

	VoteSubject getCurrSubject(int vsId);
}
