package com.pcwk.ehr.admin.domain;

import com.pcwk.ehr.cmn.DTO;

public class CategoryVO extends DTO {
	private int categoryNo;		// 카테고리 번호
	private String categoryNm;		// 카테고리 이름
	private String regDt;	// 등록일
	private String modDt;	// 수정일
	private int status;		// 상태값 (1:사용, 0:미사용)
	
	public CategoryVO() {}
	
	public CategoryVO(String categoryNm) {
		super();
		this.categoryNm = categoryNm;
		this.status = 1;	// default 1
	}
	
	public CategoryVO(int categoryNo, String categoryNm) {
		super();
		this.categoryNo = categoryNo;
		this.categoryNm = categoryNm;
		this.status = 1;	// default 1
	}
	
	public CategoryVO(int categoryNo, String categoryNm, String regDt, String modDt, int status) {
		super();
		this.categoryNo = categoryNo;
		this.categoryNm = categoryNm;
		this.regDt = regDt;
		this.modDt = modDt;
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
	
	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CategoryVO [categoryNo=" + categoryNo + ", categoryNm=" + categoryNm + ", regDt=" + regDt + ", modDt="
				+ modDt + ", status=" + status + "]";
	}
}
