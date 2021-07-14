package org.kosta.model.vo;

public class QnAVO {
	private String qnaNo;
	private String qnaTime;
	private String qnaContent;
	private int qnaType;
	private String memberId;

	public QnAVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnAVO(String qnaNo, String qnaTime, String qnaContent, int qnaType, String memberId) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTime = qnaTime;
		this.qnaContent = qnaContent;
		this.qnaType = qnaType;
		this.memberId = memberId;
	}

	public String getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(String qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaTime() {
		return qnaTime;
	}

	public void setQnaTime(String qnaTime) {
		this.qnaTime = qnaTime;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public int getQnaType() {
		return qnaType;
	}

	public void setQnaType(int qnaType) {
		this.qnaType = qnaType;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", qnaTime=" + qnaTime + ", qnaContent=" + qnaContent + ", qnaType=" + qnaType
				+ ", memberId=" + memberId + "]";
	}

}
