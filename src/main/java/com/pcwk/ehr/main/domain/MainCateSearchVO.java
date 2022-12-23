package com.pcwk.ehr.main.domain;

import com.pcwk.ehr.cmn.DTO;

public class MainCateSearchVO extends DTO{
	
	private int categoryNo;		// 카테고리 번호
	private String categoryNm;	// 카테고리 이름
	private int topNo;		// 상위 카테고리 번호
	private int status;		// 상태값 (1:사용, 0:미사용)
	
	public MainCateSearchVO() {}
	
	public MainCateSearchVO(String categoryNm) {
		super();
		this.categoryNm = categoryNm;
		this.status = 1;	// default 1
	}
	
	public MainCateSearchVO(int categoryNo, String categoryNm, int topNo) {
		super();
		this.categoryNo = categoryNo;
		this.categoryNm = categoryNm;
		this.topNo = topNo;
		this.status = 1;	// default 1
	}
	

	public MainCateSearchVO(int categoryNo, String categoryNm, int topNo, int status) {
		super();
		this.categoryNo = categoryNo;
		this.categoryNm = categoryNm;
		this.topNo = topNo;
		this.status = status;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryNm() {
		return categoryNm;
	}

	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}

	public int getTopNo() {
		return topNo;
	}

	public void setTopNo(int topNo) {
		this.topNo = topNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MainCateSearchVO [categoryNo=" + categoryNo + ", categoryNm=" + categoryNm + ", topNo=" + topNo
				+ ", status=" + status + ", toString()=" + super.toString() + "]";
	}
}
