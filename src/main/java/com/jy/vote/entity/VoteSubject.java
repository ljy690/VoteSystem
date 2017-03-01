package com.jy.vote.entity;

import java.io.Serializable;

public class VoteSubject implements Serializable{
	private static final long serialVersionUID = 9222397426778619924L;
	private int vsId;
	private int vsvuId;
	private String vuUsername;
	private String vsTitle;
	private int vsType;
	private int vsStatus;
	private String vsBeginTime;
	private int optionCount;//当前主题有多少个选项
	private int voteAllCount;//当前有多少人投票

	public int getVsId() {
		return vsId;
	}
	public void setVsId(int vsId) {
		this.vsId = vsId;
	}
	public String getVsTitle() {
		return vsTitle;
	}
	public void setVsTitle(String vsTitle) {
		this.vsTitle = vsTitle;
	}
	public int getVsType() {
		return vsType;
	}
	public void setVsType(int vsType) {
		this.vsType = vsType;
	}
	public int getVsvuId() {
		return vsvuId;
	}
	public void setVsvuId(int vsvuId) {
		this.vsvuId = vsvuId;
	}
	public int getVsStatus() {
		return vsStatus;
	}
	public void setVsStatus(int vsStatus) {
		this.vsStatus = vsStatus;
	}
	public int getVoteAllCount() {
		return voteAllCount;
	}
	public void setVoteAllCount(int voteAllCount) {
		this.voteAllCount = voteAllCount;
	}
	public String getVsBeginTime() {
		return vsBeginTime;
	}
	public void setVsBeginTime(String vsBeginTime) {
		if(vsBeginTime!=null){
			String[] str=vsBeginTime.split("\\.");
			vsBeginTime=str[0];
		}
		this.vsBeginTime = vsBeginTime;
	}
	public int getOptionCount() {
		return optionCount;
	}
	public void setOptionCount(int optionCount) {
		this.optionCount = optionCount;
	}
	public String getVuUsername() {
		return vuUsername;
	}
	public void setVuUsername(String vuUsername) {
		this.vuUsername = vuUsername;
	}
	public VoteSubject(int vsId, int vsvuId, String vuUsername, String vsTitle,
			int vsType, int vsStatus, String vsBeginTime, int optionCount,
			int voteAllCount) {
		super();
		this.vsId = vsId;
		this.vsvuId = vsvuId;
		this.vuUsername = vuUsername;
		this.vsTitle = vsTitle;
		this.vsType = vsType;
		this.vsStatus = vsStatus;
		this.vsBeginTime = vsBeginTime;
		this.optionCount = optionCount;
		this.voteAllCount = voteAllCount;
	}
	public VoteSubject() {
		super();
	}
	@Override
	public String toString() {
		return "VoteSubject [vsId=" + vsId + ", vsvuId=" + vsvuId
				+ ", vuUsername=" + vuUsername + ", vsTitle=" + vsTitle
				+ ", vsType=" + vsType + ", vsStatus=" + vsStatus
				+ ", vsBeginTime=" + vsBeginTime + ", optionCount="
				+ optionCount + ", voteAllCount=" + voteAllCount + "]";
	}
}
