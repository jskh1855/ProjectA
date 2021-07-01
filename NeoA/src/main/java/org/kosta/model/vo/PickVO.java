package org.kosta.model.vo;

import java.time.LocalDate;

public class PickVO {
	private String PickNo;
	private LocalDate prickTime;
	public PickVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PickVO(String pickNo, LocalDate prickTime) {
		super();
		PickNo = pickNo;
		this.prickTime = prickTime;
	}
	public String getPickNo() {
		return PickNo;
	}
	public void setPickNo(String pickNo) {
		PickNo = pickNo;
	}
	public LocalDate getPrickTime() {
		return prickTime;
	}
	public void setPrickTime(LocalDate prickTime) {
		this.prickTime = prickTime;
	}
	@Override
	public String toString() {
		return "PickVO [PickNo=" + PickNo + ", prickTime=" + prickTime + "]";
	}
	
}
