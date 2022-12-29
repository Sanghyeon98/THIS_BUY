package com.pcwk.ehr.order.domain;

import com.pcwk.ehr.cmn.DTO;

public class OrderSearchVO extends DTO {
	
	private int pageSize;  //페이지 사이즈
	private int pageNo;    //페이지 번호
    private String searchDiv;  //검색구분
    private String searchWord;  // 검색어
    private String memberId;	// 회원ID
    
    public OrderSearchVO() {};
    
	public OrderSearchVO(int pageSize, int pageNo, String searchDiv, String searchWord) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.searchDiv = searchDiv;
		this.searchWord = searchWord;
	}
	
	public OrderSearchVO(int pageSize, int pageNo, String searchDiv, String searchWord, String memberId) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.searchDiv = searchDiv;
		this.searchWord = searchWord;
		this.memberId = memberId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	@Override
	public String toString() {
		return "OrderSearchVO [pageSize=" + pageSize + ", pageNo=" + pageNo + ", searchDiv=" + searchDiv
				+ ", searchWord=" + searchWord + ", memberId=" + memberId + ", toString()=" + super.toString() + "]";
	}

}
