package com.pcwk.ehr.answer.domain;

import com.pcwk.ehr.cmn.DTO;
 
public class AnswerVO extends DTO{

	private int answerNo; 	// 답변 번호
	private int seq; 		//문의 번호 
	private String title;   //제목
	private String contents; //내용
	private String regDt; //등록일
	private String regId; //등록자
	
	public AnswerVO() {}

	public AnswerVO(int answerNo, int seq, String title, String contents, String regDt, String regId) {
		super();
		this.answerNo = answerNo;
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.regDt = regDt;
		this.regId = regId;
	}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	@Override
	public String toString() {
		return "AnswerVO [answerNo=" + answerNo + ", seq=" + seq + ", title=" + title + ", contents=" + contents
				+ ", regDt=" + regDt + ", regId=" + regId + "]";
	}
	
	
}
