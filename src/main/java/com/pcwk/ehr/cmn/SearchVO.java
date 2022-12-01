package com.pcwk.ehr.cmn;

public class SearchVO extends DTO {
	private int pageSize;	// 페이지 사이즈
	private int pageNo;		// 페이지 번호
	// 카테고리 searchDiv : 10(카테고리이름), 20(상태값 1:사용/0:미사용)
	// 1:1 문의 - 10: 배송사항, 20: 상품문의 , 30 : 기타
	private String searchDiv;	// 검색 구분
	private String searchWord;	// 검색어
	
	private String gubun; // 게시판 구분 (10: 공지사항 , 20: 1:1 문의) 
	
	public SearchVO() {}

	public SearchVO(int pageSize, int pageNo, String searchDiv, String searchWord, String gubun) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.searchDiv = searchDiv;
		this.searchWord = searchWord;
		this.gubun = gubun;
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

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

	@Override
	public String toString() {
		return "SearchVO [pageSize=" + pageSize + ", pageNo=" + pageNo + ", searchDiv=" + searchDiv + ", searchWord="
				+ searchWord + ", gubun=" + gubun + "]";
	}

	
}
