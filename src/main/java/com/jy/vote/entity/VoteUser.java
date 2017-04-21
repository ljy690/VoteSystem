package com.jy.vote.entity;

import java.io.Serializable;

//import org.hibernate.validator.constraints.Length;

public class VoteUser implements Serializable{
	private static final long serialVersionUID = -5479621232059207835L;
	private int vuId;
	//@Length(max=8,message="长度最大为8...")
	private String vuUsername;
	private String vuSex;
	private String vuDate;
	private String vuPassword;
	private int vuStatus;
	private int vuVersion;
	private String confirmPassword;
	private String vuEmail;
	private Integer voteCount;
	private Integer optionCount;
	private String vuUpTime;
	private int totalVote;//该用户总共投了几个主题

	public int getVuId() {
		return vuId;
	}
	public void setVuId(int vuId) {
		this.vuId = vuId;
	}
	public String getVuUsername() {
		return vuUsername;
	}
	public void setVuUsername(String vuUsername) {
		this.vuUsername = vuUsername;
	}
	public String getVuPassword() {
		return vuPassword;
	}
	public void setVuPassword(String vuPassword) {
		this.vuPassword = vuPassword;
	}
	public int getVuStatus() {
		return vuStatus;
	}
	public void setVuStatus(int vuStatus) {
		this.vuStatus = vuStatus;
	}
	public int getVuVersion() {
		return vuVersion;
	}
	public void setVuVersion(int vuVersion) {
		this.vuVersion = vuVersion;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getVuEmail() {
		return vuEmail;
	}
	public void setVuEmail(String vuEmail) {
		this.vuEmail = vuEmail;
	}

	public Integer getVoteCount() {
		return voteCount;
	}
	public void setVoteCount(Integer voteCount) {
		this.voteCount = voteCount;
	}
	public Integer getOptionCount() {
		return optionCount;
	}
	public void setOptionCount(Integer optionCount) {
		this.optionCount = optionCount;
	}
	public String getVuDate() {
		return vuDate;
	}
	public String getVuDate0() {
		return vuDate.substring(0,10);
	}
	public void setVuDate(String vuDate) {
		this.vuDate = vuDate;
	}
	public String getVuSex() {
		return vuSex;
	}
	public void setVuSex(String vuSex) {
		this.vuSex = vuSex;
	}
	public String getVuUpTime() {
		return vuUpTime;
	}
	public void setVuUpTime(String vuUpTime) {
		this.vuUpTime = vuUpTime;
	}
	public int getTotalVote() {
		return totalVote;
	}
	public void setTotalVote(int totalVote) {
		this.totalVote = totalVote;
	}
	public VoteUser() {
		super();
	}
	public VoteUser(int vuId, String vuUsername, String vuSex, String vuDate,
			String vuPassword, int vuStatus, int vuVersion,
			String confirmPassword, String vuEmail, Integer voteCount,
			Integer optionCount, String vuUpTime, int totalVote) {
		super();
		this.vuId = vuId;
		this.vuUsername = vuUsername;
		this.vuSex = vuSex;
		this.vuDate = vuDate;
		this.vuPassword = vuPassword;
		this.vuStatus = vuStatus;
		this.vuVersion = vuVersion;
		this.confirmPassword = confirmPassword;
		this.vuEmail = vuEmail;
		this.voteCount = voteCount;
		this.optionCount = optionCount;
		this.vuUpTime = vuUpTime;
		this.totalVote = totalVote;
	}
	
}
