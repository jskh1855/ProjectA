package org.kosta.model.vo;

import java.time.LocalDate;

public class BidLogVO {
	private String bidNo;
	private int bidPrice;
	private LocalDate bidTime;
	public BidLogVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BidLogVO(String bidNo, int bidPrice, LocalDate bidTime) {
		super();
		this.bidNo = bidNo;
		this.bidPrice = bidPrice;
		this.bidTime = bidTime;
	}
	public String getBidNo() {
		return bidNo;
	}
	public void setBidNo(String bidNo) {
		this.bidNo = bidNo;
	}
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	public LocalDate getBidTime() {
		return bidTime;
	}
	public void setBidTime(LocalDate bidTime) {
		this.bidTime = bidTime;
	}
	@Override
	public String toString() {
		return "BidLogVO [bidNo=" + bidNo + ", bidPrice=" + bidPrice + ", bidTime=" + bidTime + "]";
	}
	
	
}
