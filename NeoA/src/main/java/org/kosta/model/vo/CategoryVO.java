package org.kosta.model.vo;

public class CategoryVO {
	private String categoryNo;
	private String largeCate;
	private String mediumCate;
	private String smallCate;
	public CategoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryVO(String categoryNo, String largeCate, String mediumCate, String smallCate) {
		super();
		this.categoryNo = categoryNo;
		this.largeCate = largeCate;
		this.mediumCate = mediumCate;
		this.smallCate = smallCate;
	}
	public String getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getLargeCate() {
		return largeCate;
	}
	public void setLargeCate(String largeCate) {
		this.largeCate = largeCate;
	}
	public String getMediumCate() {
		return mediumCate;
	}
	public void setMediumCate(String mediumCate) {
		this.mediumCate = mediumCate;
	}
	public String getSmallCate() {
		return smallCate;
	}
	public void setSmallCate(String smallCate) {
		this.smallCate = smallCate;
	}
	@Override
	public String toString() {
		return "CategoryVO [categoryNo=" + categoryNo + ", largeCate=" + largeCate + ", mediumCate=" + mediumCate
				+ ", smallCate=" + smallCate + "]";
	}
	
}
