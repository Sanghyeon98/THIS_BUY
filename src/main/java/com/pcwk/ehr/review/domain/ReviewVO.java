package com.pcwk.ehr.review.domain;

import com.pcwk.ehr.cmn.DTO;

public class ReviewVO extends DTO {
		
	private int reviewNo;     // 후기글 번호(pk, 시퀀스 적용)
	private String memberId;  // 회원아이디
	private int orderItemNo;  // 주문상품번호
	private String title;     // 제목
	private String contents;  // 내용
	private int readCnt;      // 조회수
	private String regDt;     // 등록일
	
	
	public ReviewVO() {
		
	}


	public ReviewVO(int reviewNo, String memberId, int orderItemNo, String title, String contents, int readCnt,
			String regDt) {
		super();
		this.reviewNo = reviewNo;
		this.memberId = memberId;
		this.orderItemNo = orderItemNo;
		this.title = title;
		this.contents = contents;
		this.readCnt = readCnt;
		this.regDt = regDt;
	}




	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getOrderItemNo() {
		return orderItemNo;
	}


	public void setOrderItemNo(int orderItemNo) {
		this.orderItemNo = orderItemNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public int getReadCnt() {
		return readCnt;
	}


	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}


	public String getRegDt() {
		return regDt;
	}


	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}


	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", memberId=" + memberId + ", orderItemNo=" + orderItemNo + ", title="
				+ title + ", contents=" + contents + ", readCnt=" + readCnt + ", regDt=" + regDt + "]";
	}




}