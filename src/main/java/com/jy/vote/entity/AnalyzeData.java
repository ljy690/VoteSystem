package com.jy.vote.entity;

import java.io.Serializable;

public class AnalyzeData implements Serializable{

	/**
	 * 数据分析
	 */
	private static final long serialVersionUID = 7328068374607913897L;

	private int voteUserCount;//每个选项的投票数
	private int totalVote;//总票数
	private int voteMaleSex;//男生数
	private int voteFemaleSex;//女生数
	private String voOption;//选项名字
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
	public String getVoOption() {
		return voOption;
	}
	public void setVoOption(String voOption) {
		this.voOption = voOption;
	}
	public AnalyzeData() {
		super();
	}
	public AnalyzeData( int voteUserCount, int totalVote,
			int voteMaleSex, int voteFemaleSex, String voOption) {
		super();
		this.voteUserCount = voteUserCount;
		this.totalVote = totalVote;
		this.voteMaleSex = voteMaleSex;
		this.voteFemaleSex = voteFemaleSex;
		this.voOption = voOption;
	}
	@Override
	public String toString() {
		return "AnalyzeData [voteUserCount=" + voteUserCount
				+ ", totalVote=" + totalVote + ", voteMaleSex=" + voteMaleSex
				+ ", voteFemaleSex=" + voteFemaleSex + ", voOption=" + voOption
				+ "]";
	}
	
}
