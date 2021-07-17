package org.kosta.model.vo;

public class BidLogVO {
	private String bidNo;
	private int bidPrice;
	private String bidTime;
	private String memberId;
	private String productNo;
	public BidLogVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BidLogVO(int bidPrice,  String memberId, String productNo) {
		super();
		this.bidPrice = bidPrice;
		this.memberId = memberId;
		this.setProductNo(productNo);
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
	public String getBidTime() {
		return bidTime;
	}
	public void setBidTime(String bidTime) {
		this.bidTime = bidTime;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "BidLogVO [bidNo=" + bidNo + ", bidPrice=" + bidPrice + ", bidTime=" + bidTime + ", memberId=" + memberId
				+productNo+ "]";
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	
	
	
}
