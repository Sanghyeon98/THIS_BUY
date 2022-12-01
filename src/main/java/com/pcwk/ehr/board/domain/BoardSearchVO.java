package com.pcwk.ehr.board.domain;

import com.pcwk.ehr.cmn.DTO;

public class BoardSearchVO extends DTO {
	private int pageSize;	// 페이지 사이즈
	private int pageNo;		// 페이지 번호
	private String searchDiv;	// 검색 구분
	private String searchWord;	// 검색어
	
	private String gubun; // 게시판 구분 (10: 공지사항 , 20: 1:1 문의) 
	private String gubunQuestion; // 게시판 구분 (10: 공지사항 , 20: 1:1 문의)   
	
	public BoardSearchVO() {}

	public BoardSearchVO(int pageSize, int pageNo, String searchDiv, String searchWord, String gubun,
			String gubunQuestion) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.searchDiv = searchDiv;
		this.searchWord = searchWord;
		this.gubun = gubun;
		this.gubunQuestion = gubunQuestion;
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

	public String getGubunQuestion() {
		return gubunQuestion;
	}

	public void setGubunQuestion(String gubunQuestion) {
		this.gubunQuestion = gubunQuestion;
	}

	@Override
	public String toString() {
		return "BoardSearchVO [pageSize=" + pageSize + ", pageNo=" + pageNo + ", searchDiv=" + searchDiv
				+ ", searchWord=" + searchWord + ", gubun=" + gubun + ", gubunQuestion=" + gubunQuestion + "]";
	}

	
}
