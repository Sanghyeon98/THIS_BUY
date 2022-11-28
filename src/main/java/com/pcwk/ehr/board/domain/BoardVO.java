package com.pcwk.ehr.board.domain;

import com.pcwk.ehr.cmn.DTO;

public class BoardVO extends DTO {

	private int seq;		// 게시글 번호
	private int gubun;		// 게시판 구분 10_공지사항 20_1:1문의
	private String title;		// 제목
	private String contents;	// 내용
	private String regDt;		// 등록일
	private String regId;		// 등록일
	private int answerCheck;	// 답변 체크
	
	public BoardVO() {}

	public BoardVO(int seq, int gubun, String title, String contents, String regDt, String regId, int answerCheck) {
		super();
		this.seq = seq;
		this.gubun = gubun;
		this.title = title;
		this.contents = contents;
		this.regDt = regDt;
		this.regId = regId;
		this.answerCheck = answerCheck;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getGubun() {
		return gubun;
	}

	public void setGubun(int gubun) {
		this.gubun = gubun;
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

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public int getAnswerCheck() {
		return answerCheck;
	}

	public void setAnswerCheck(int answerCheck) {
		this.answerCheck = answerCheck;
	}

	@Override
	public String toString() {
		return "QuestionVO [seq=" + seq + ", gubun=" + gubun + ", title=" + title + ", contents=" + contents
				+ ", regDt=" + regDt + ", regId=" + regId + ", answerCheck=" + answerCheck + "]";
	}
	
	
	
	
}
