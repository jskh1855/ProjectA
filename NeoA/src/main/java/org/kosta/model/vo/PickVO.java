package org.kosta.model.vo;

public class PickVO {
	private String pickNo;
	private String pickTime;
	private String memberId;
	
	public PickVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PickVO(String pickNo, String pickTime, String memberId) {
		super();
		this.pickNo = pickNo;
		this.pickTime = pickTime;
		this.memberId = memberId;
	}

	public String getPickNo() {
		return pickNo;
	}

	public void setPickNo(String pickNo) {
		this.pickNo = pickNo;
	}

	public String getPickTime() {
		return pickTime;
	}

	public void setPickTime(String pickTime) {
		this.pickTime = pickTime;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "PickVO [pickNo=" + pickNo + ", pickTime=" + pickTime + ", memberId=" + memberId + "]";
	}
	
	
}
