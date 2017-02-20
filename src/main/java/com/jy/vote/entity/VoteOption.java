package com.jy.vote.entity;

public class VoteOption {
	private int voId;
	private String voOption;
	private String vsTitle;
	private int vsId;
	private int voOrder;
	private int voteUserCount;//每个选项的投票数
	private int voteAllCount;//总共多少人投票
	private int vsType;//对应的主题的类型
	
	public int getVoId() {
		return voId;
	}
	public void setVoId(int voId) {
		this.voId = voId;
	}
	public String getVoOption() {
		return voOption;
	}
	public void setVoOption(String voOption) {
		this.voOption = voOption;
	}
	public int getVsId() {
		return vsId;
	}
	public void setVsId(int vsId) {
		this.vsId = vsId;
	}
	public int getVoOrder() {
		return voOrder;
	}
	public void setVoOrder(int voOrder) {
		this.voOrder = voOrder;
	}
	public int getVoteUserCount() {
		return voteUserCount;
	}
	public void setVoteUserCount(int voteUserCount) {
		this.voteUserCount = voteUserCount;
	}
	public int getVoteAllCount() {
		return voteAllCount;
	}
	public void setVoteAllCount(int voteAllCount) {
		this.voteAllCount = voteAllCount;
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
	public VoteOption(int voId, String voOption, String vsTitle, int vsId,
			int voOrder, int voteUserCount, int voteAllCount, int vsType) {
		super();
		this.voId = voId;
		this.voOption = voOption;
		this.vsTitle = vsTitle;
		this.vsId = vsId;
		this.voOrder = voOrder;
		this.voteUserCount = voteUserCount;
		this.voteAllCount = voteAllCount;
		this.vsType = vsType;
	}
	public VoteOption() {
		super();
	}
	@Override
	public String toString() {
		return "VoteOption [voId=" + voId + ", voOption=" + voOption
				+ ", vsTitle=" + vsTitle + ", vsId=" + vsId + ", voOrder="
				+ voOrder + ", voteUserCount=" + voteUserCount
				+ ", voteAllCount=" + voteAllCount + ", vsType=" + vsType + "]";
	}
}
