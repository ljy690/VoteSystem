package com.jy.vote.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
