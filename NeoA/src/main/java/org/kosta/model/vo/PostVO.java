package org.kosta.model.vo;

import java.util.Date;

public class PostVO {
	private String title;
	private String productNo;
	private String productName;
	private int startPrice;
	private int nowPrice;
	private Date productUpTime; 
	private int unitPrice;
	private int giveMeThatPrice;
	private String detail;
	private String postImage;
	private int bidTimeUnit;
	private Date bidEndTime;
	private MemberVO memberVO;
	private CategoryVO categoryVO;
	private QnAVO qnaVO;
	private PickVO pickVO;
	private BidLogVO bidLogVO;
	public PostVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostVO(String title, String productNo, String productName, int startPrice, int nowPrice, Date productUpTime,
			int unitPrice, int giveMeThatPrice, String detail, String postImage, int bidTimeUnit, Date bidEndTime,
			MemberVO memberVO, CategoryVO categoryVO, QnAVO qnaVO, PickVO pickVO, BidLogVO bidLogVO) {
		super();
		this.title = title;
		this.productNo = productNo;
		this.productName = productName;
		this.startPrice = startPrice;
		this.nowPrice = nowPrice;
		this.productUpTime = productUpTime;
		this.unitPrice = unitPrice;
		this.giveMeThatPrice = giveMeThatPrice;
		this.detail = detail;
		this.postImage = postImage;
		this.bidTimeUnit = bidTimeUnit;
		this.bidEndTime = bidEndTime;
		this.memberVO = memberVO;
		this.categoryVO = categoryVO;
		this.qnaVO = qnaVO;
		this.pickVO = pickVO;
		this.bidLogVO = bidLogVO;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getProductUpTime() {
		return productUpTime;
	}
	public void setProductUpTime(Date productUpTime) {
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
	public String getPostImage() {
		return postImage;
	}
	public void setPostImage(String postImage) {
		this.postImage = postImage;
	}
	public int getBidTimeUnit() {
		return bidTimeUnit;
	}
	public void setBidTimeUnit(int bidTimeUnit) {
		this.bidTimeUnit = bidTimeUnit;
	}
	public Date getBidEndTime() {
		return bidEndTime;
	}
	public void setBidEndTime(Date bidEndTime) {
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
		return "PostVO [title=" + title + ", productNo=" + productNo + ", productName=" + productName + ", startPrice="
				+ startPrice + ", nowPrice=" + nowPrice + ", unitPrice=" + unitPrice + ", giveMeThatPrice="
				+ giveMeThatPrice + ", detail=" + detail + ", postImage=" + postImage + ", bidTimeUnit=" + bidTimeUnit
				+ ", memberVO=" + memberVO + ", categoryVO=" + categoryVO + ", qnaVO=" + qnaVO + ", pickVO=" + pickVO
				+ ", bidLogVO=" + bidLogVO + "]";
	}
	
	
}
