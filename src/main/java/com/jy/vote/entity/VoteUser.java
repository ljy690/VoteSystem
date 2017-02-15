package com.jy.vote.entity;

import org.hibernate.validator.constraints.Length;

public class VoteUser {
	private int vuId;
	@Length(max=8,message="长度最大为8...")
	private String vuUsername;
	private String vuDate;
	private String vuPassword;
	private int vuStatus;
	private int vuVersion;
	private String confirmPassword;
	private String vuEmail;
	private Integer voteCount;
	private Integer optionCount;

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
	public void setVuDate(String vuDate) {
		this.vuDate = vuDate;
	}
	public VoteUser(int vuId, String vuUsername, String vuDate,
			String vuPassword, int vuStatus, int vuVersion,
			String confirmPassword, String vuEmail, Integer voteCount,
			Integer optionCount) {
		super();
		this.vuId = vuId;
		this.vuUsername = vuUsername;
		this.vuDate = vuDate;
		this.vuPassword = vuPassword;
		this.vuStatus = vuStatus;
		this.vuVersion = vuVersion;
		this.confirmPassword = confirmPassword;
		this.vuEmail = vuEmail;
		this.voteCount = voteCount;
		this.optionCount = optionCount;
	}
	public VoteUser() {
		super();
	}
	@Override
	public String toString() {
		return "VoteUser [vuId=" + vuId + ", vuUsername=" + vuUsername
				+ ", vuDate=" + vuDate + ", vuPassword=" + vuPassword
				+ ", vuStatus=" + vuStatus + ", vuVersion=" + vuVersion
				+ ", confirmPassword=" + confirmPassword + ", vuEmail="
				+ vuEmail + ", voteCount=" + voteCount + ", optionCount="
				+ optionCount + "]";
	}

}
