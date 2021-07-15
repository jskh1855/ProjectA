package org.kosta.model.vo;

import java.time.LocalDate;

public class PickVO {
	private String pickNo;
	private String prickTime;
	private String memberId;
	public PickVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PickVO(String pickNo, String prickTime, String memberId) {
		super();
		this.pickNo = pickNo;
		this.prickTime = prickTime;
		this.memberId = memberId;
	}
	public String getPickNo() {
		return pickNo;
	}
	public void setPickNo(String pickNo) {
		this.pickNo = pickNo;
	}
	public String getPrickTime() {
		return prickTime;
	}
	public void setPrickTime(String prickTime) {
		this.prickTime = prickTime;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "PickVO [pickNo=" + pickNo + ", prickTime=" + prickTime + ", memberId=" + memberId + "]";
	}
	
	
}
