package com.pcwk.ehr.cmn;

public class SearchVO extends DTO {
	private int pageSize;	// 페이지 사이즈
	private int pageNo;		// 페이지 번호
	// 카테고리 searchDiv : 10(카테고리이름), 20(상태값 1:사용/0:미사용)
	private String searchDiv;	// 검색 구분
	private String searchWord;	// 검색어
	
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
	
	public SearchVO(int pageSize, int pageNo, String searchDiv, String searchWord, String cateId, String div) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.searchDiv = searchDiv;
		this.searchWord = searchWord;
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

	@Override
	public String toString() {
		return "SearchVO [pageSize=" + pageSize + ", pageNo=" + pageNo + ", searchDiv=" + searchDiv + ", searchWord="
				+ searchWord + ", cateId=" + cateId + ", div=" + div + ", toString()=" + super.toString() + "]";
	}

}
