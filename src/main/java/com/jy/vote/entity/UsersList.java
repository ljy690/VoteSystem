package com.jy.vote.entity;

import java.io.Serializable;
import java.util.List;

public class UsersList implements Serializable{

	/**
	 *  存放用户列表里面的值
	 */
	private static final long serialVersionUID = 7407877822991246538L;
	private List<VoteUser> users;
	private int total;
	public List<VoteUser> getUsers() {
		return users;
	}

	public void setUsers(List<VoteUser> users) {
		this.users = users;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public UsersList() {
		super();
	}

	public UsersList(List<VoteUser> users, int total) {
		super();
		this.users = users;
		this.total = total;
	}

	@Override
	public String toString() {
		return "UsersList [users=" + users + ", total=" + total + "]";
	}
}
