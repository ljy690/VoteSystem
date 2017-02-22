package com.jy.vote.entity;

public class VoteOption {
	private int voId;
	private String voOption;
	private int vsId;
	private int voOrder;
	private int voteUserCount;//每个选项的投票数
	
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
	public VoteOption(int voId, String voOption, int vsId, int voOrder,
			int voteUserCount) {
		super();
		this.voId = voId;
		this.voOption = voOption;
		this.vsId = vsId;
		this.voOrder = voOrder;
		this.voteUserCount = voteUserCount;
	}
	public VoteOption() {
		super();
	}
	@Override
	public String toString() {
		return "VoteOption [voId=" + voId + ", voOption=" + voOption
				+ ", vsId=" + vsId + ", voOrder=" + voOrder
				+ ", voteUserCount=" + voteUserCount + "]";
	}
}
