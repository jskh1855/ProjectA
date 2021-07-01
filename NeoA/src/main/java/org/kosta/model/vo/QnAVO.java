package org.kosta.model.vo;

import java.time.LocalDate;

public class QnAVO {
	private String qnaNo;
	private LocalDate qnaTime;
	private String qnaContent;
	private Boolean qnaType;
	public QnAVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnAVO(String qnaNo, LocalDate qnaTime, String qnaContent, Boolean qnaType) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTime = qnaTime;
		this.qnaContent = qnaContent;
		this.qnaType = qnaType;
	}
	public String getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(String qnaNo) {
		this.qnaNo = qnaNo;
	}
	public LocalDate getQnaTime() {
		return qnaTime;
	}
	public void setQnaTime(LocalDate qnaTime) {
		this.qnaTime = qnaTime;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Boolean getQnaType() {
		return qnaType;
	}
	public void setQnaType(Boolean qnaType) {
		this.qnaType = qnaType;
	}
	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", qnaTime=" + qnaTime + ", qnaContent=" + qnaContent + ", qnaType=" + qnaType
				+ "]";
	}
	
	
}
