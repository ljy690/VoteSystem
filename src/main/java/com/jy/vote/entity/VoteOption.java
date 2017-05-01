package com.jy.vote.entity;

import java.io.Serializable;

public class VoteOption implements Serializable{
	private static final long serialVersionUID = -783464658671957541L;
	private int voId;
	private String voOption;
	private int vsId;
	private int voOrder;
	private String voIntro;
	private int voteUserCount;//每个选项的投票数
	private int totalVote;//总票数
	private int voteMaleSex;//男生数
	private int voteFemaleSex;//女生数
	
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
	public int getTotalVote() {
		return totalVote;
	}
	public void setTotalVote(int totalVote) {
		this.totalVote = totalVote;
	}
	public int getVoteMaleSex() {
		return voteMaleSex;
	}
	public void setVoteMaleSex(int voteMaleSex) {
		this.voteMaleSex = voteMaleSex;
	}
	public int getVoteFemaleSex() {
		return voteFemaleSex;
	}
	public void setVoteFemaleSex(int voteFemaleSex) {
		this.voteFemaleSex = voteFemaleSex;
	}
	public String getVoIntro() {
		return voIntro;
	}
	public void setVoIntro(String voIntro) {
		this.voIntro = voIntro;
	}
	public VoteOption() {
		super();
	}
	public VoteOption(int voId, String voOption, int vsId, int voOrder,
			String voIntro, int voteUserCount, int totalVote, int voteMaleSex,
			int voteFemaleSex) {
		super();
		this.voId = voId;
		this.voOption = voOption;
		this.vsId = vsId;
		this.voOrder = voOrder;
		this.voIntro = voIntro;
		this.voteUserCount = voteUserCount;
		this.totalVote = totalVote;
		this.voteMaleSex = voteMaleSex;
		this.voteFemaleSex = voteFemaleSex;
	}
}
