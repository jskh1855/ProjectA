package org.kosta.model.vo;

import java.time.LocalDate;

public class PostVO {
	private String postNo;
	private String productNo;
	private String productName;
	private int startPrice;
	private int nowPrice;
	private LocalDate productUpTime; 
	private int unitPrice;
	private int giveMeThatPrice;
	private String detail;
	private LocalDate bidEndTime;
	private MemberVO memberVO;
	private CategoryVO categoryVO;
	private QnAVO qnaVO;
	private PickVO pickVO;
	private BidLogVO bidLogVO;
	public PostVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostVO(String postNo, String productNo, String productName, int startPrice, int nowPrice,
			LocalDate productUpTime, int unitPrice, int giveMeThatPrice, String detail, LocalDate bidEndTime,
			MemberVO memberVO, CategoryVO categoryVO, QnAVO qnaVO, PickVO pickVO, BidLogVO bidLogVO) {
		super();
		this.postNo = postNo;
		this.productNo = productNo;
		this.productName = productName;
		this.startPrice = startPrice;
		this.nowPrice = nowPrice;
		this.productUpTime = productUpTime;
		this.unitPrice = unitPrice;
		this.giveMeThatPrice = giveMeThatPrice;
		this.detail = detail;
		this.bidEndTime = bidEndTime;
		this.memberVO = memberVO;
		this.categoryVO = categoryVO;
		this.qnaVO = qnaVO;
		this.pickVO = pickVO;
		this.bidLogVO = bidLogVO;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}
	public int getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(int nowPrice) {
		this.nowPrice = nowPrice;
	}
	public LocalDate getProductUpTime() {
		return productUpTime;
	}
	public void setProductUpTime(LocalDate productUpTime) {
		this.productUpTime = productUpTime;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getGiveMeThatPrice() {
		return giveMeThatPrice;
	}
	public void setGiveMeThatPrice(int giveMeThatPrice) {
		this.giveMeThatPrice = giveMeThatPrice;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public LocalDate getBidEndTime() {
		return bidEndTime;
	}
	public void setBidEndTime(LocalDate bidEndTime) {
		this.bidEndTime = bidEndTime;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public CategoryVO getCategoryVO() {
		return categoryVO;
	}
	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}
	public QnAVO getQnaVO() {
		return qnaVO;
	}
	public void setQnaVO(QnAVO qnaVO) {
		this.qnaVO = qnaVO;
	}
	public PickVO getPickVO() {
		return pickVO;
	}
	public void setPickVO(PickVO pickVO) {
		this.pickVO = pickVO;
	}
	public BidLogVO getBidLogVO() {
		return bidLogVO;
	}
	public void setBidLogVO(BidLogVO bidLogVO) {
		this.bidLogVO = bidLogVO;
	}
	@Override
	public String toString() {
		return "PostVO [postNo=" + postNo + ", productNo=" + productNo + ", productName=" + productName
				+ ", startPrice=" + startPrice + ", nowPrice=" + nowPrice + ", productUpTime=" + productUpTime
				+ ", unitPrice=" + unitPrice + ", giveMeThatPrice=" + giveMeThatPrice + ", detail=" + detail
				+ ", bidEndTime=" + bidEndTime + ", memberVO=" + memberVO + ", categoryVO=" + categoryVO + ", qnaVO="
				+ qnaVO + ", pickVO=" + pickVO + ", bidLogVO=" + bidLogVO + "]";
	}
	
	
}
