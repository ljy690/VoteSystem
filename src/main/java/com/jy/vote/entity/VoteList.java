package com.jy.vote.entity;

import java.io.Serializable;
import java.util.List;

public class VoteList implements Serializable{

	/**
	 * 存放投票列表里面的值
	 */
	private static final long serialVersionUID = -5608683829796920588L;
	private int total;
	private List<VoteSubject> subjects;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<VoteSubject> getSubjects() {
		return subjects;
	}
	public void setSubjects(List<VoteSubject> subjects) {
		this.subjects = subjects;
	}
	public VoteList(int total, List<VoteSubject> subjects) {
		super();
		this.total = total;
		this.subjects = subjects;
	}
	public VoteList() {
		super();
	}
	@Override
	public String toString() {
		return "VoteList [total=" + total + ", subjects=" + subjects + "]";
	}
}
