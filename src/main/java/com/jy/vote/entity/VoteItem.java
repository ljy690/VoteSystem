package com.jy.vote.entity;

import java.io.Serializable;

public class VoteItem implements Serializable{
	private static final long serialVersionUID = -1754989764361891162L;
	private int viId;
	private int voId;
	private int vsId;
	private int vuId;
	private String voteTime;
	
	public int getViId() {
		return viId;
	}
	public void setViId(int viId) {
		this.viId = viId;
	}
	public int getVoId() {
		return voId;
	}
	public void setVoId(int voId) {
		this.voId = voId;
	}
	public int getVsId() {
		return vsId;
	}
	public void setVsId(int vsId) {
		this.vsId = vsId;
	}
	public int getVuId() {
		return vuId;
	}
	public void setVuId(int vuId) {
		this.vuId = vuId;
	}
	public String getVoteTime() {
		return voteTime;
	}
	public void setVoteTime(String voteTime) {
		this.voteTime = voteTime;
	}
	public VoteItem(int viId, int voId, int vsId, int vuId, String voteTime) {
		super();
		this.viId = viId;
		this.voId = voId;
		this.vsId = vsId;
		this.vuId = vuId;
		this.voteTime = voteTime;
	}
	public VoteItem() {
		super();
	}
	@Override
	public String toString() {
		return "VoteItem [viId=" + viId + ", voId=" + voId + ", vsId=" + vsId
				+ ", vuId=" + vuId + ", voteTime=" + voteTime + "]";
	}
}
