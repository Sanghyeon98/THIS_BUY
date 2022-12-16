package com.pcwk.ehr.cmn;

public class SearchVO extends DTO {
	private int pageSize;	// 페이지 사이즈
	private int pageNo;		// 페이지 번호
	// 카테고리 searchDiv : 10(카테고리이름), 20(상태값 1:사용/0:미사용)
	private String searchDiv;	// 검색 구분
	private String searchWord;	// 검색어
	
	private String cateClass01;	// 카테고리 1차 분류
	private String cateClass02;	// 카테고리 2차 분류
	
	private String cateId;	// 카테고리 ID (제품 검색 시 사용)
	
	private String div;		// 구분

	public SearchVO() {}
	
	public SearchVO(int pageSize, int pageNo, String searchDiv, String searchWord) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.searchDiv = searchDiv;
		this.searchWord = searchWord;
	}
	
	public SearchVO(int pageSize, int pageNo, String searchDiv, String searchWord, String cateClass01,
			String cateClass02, String cateId, String div) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.searchDiv = searchDiv;
		this.searchWord = searchWord;
		this.cateClass01 = cateClass01;
		this.cateClass02 = cateClass02;
		this.cateId = cateId;
		this.div = div;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getSearchDiv() {
		return searchDiv;
	}

	public void setSearchDiv(String searchDiv) {
		this.searchDiv = searchDiv;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	public String getDiv() {
		return div;
	}

	public void setDiv(String div) {
		this.div = div;
	}

	public String getCateId() {
		return cateId;
	}

	public void setCateId(String cateId) {
		this.cateId = cateId;
	}
	
	public String getCateClass01() {
		return cateClass01;
	}

	public void setCateClass01(String cateClass01) {
		this.cateClass01 = cateClass01;
	}

	public String getCateClass02() {
		return cateClass02;
	}

	public void setCateClass02(String cateClass02) {
		this.cateClass02 = cateClass02;
	}

	@Override
	public String toString() {
		return "SearchVO [pageSize=" + pageSize + ", pageNo=" + pageNo + ", searchDiv=" + searchDiv + ", searchWord="
				+ searchWord + ", cateClass01=" + cateClass01 + ", cateClass02=" + cateClass02 + ", cateId=" + cateId
				+ ", div=" + div + ", toString()=" + super.toString() + "]";
	}

}
