package com.jy.vote.entity;

public class VoteItem {
	private int viId;
	private int voId;
	private int vsId;
	private int vuId;
	
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
	
	public VoteItem(int viId, int voId, int vsId, int vuId) {
		super();
		this.viId = viId;
		this.voId = voId;
		this.vsId = vsId;
		this.vuId = vuId;
	}
	
	public VoteItem() {
		super();
	}
	
	@Override
	public String toString() {
		return "VoteItem [viId=" + viId + ", voId=" + voId + ", vsId=" + vsId
				+ ", vuId=" + vuId + "]";
	}
}
