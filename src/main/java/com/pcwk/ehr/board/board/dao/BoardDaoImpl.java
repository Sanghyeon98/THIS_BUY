package com.pcwk.ehr.board.board.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.pcwk.ehr.board.board.domain.BoardVO;
import com.pcwk.ehr.cmn.DTO;

public class BoardDaoImpl {

	final Logger LOG = LogManager.getLogger(getClass());
	
	final String NAMESPACE = "";		

	/*
	 * 답변 체크 (있으면 1, 없으면 0(=기본값))
	 */
	public int answerCheck(DTO dto) {
		
		int flag = 0;
		return flag;
		
	}
	
	
	/**
	 * 질의 조회수 (doSelectOne시)
	 */
	public int doReadCnt(DTO dto)  throws SQLException{
		
		int flag = 0;
		return flag;
		
	}
	
	/**
	 * 질의 삭제
	 */
	public int doDelete(DTO dto) throws SQLException {
		
		int flag = 0;

		return flag;
		
	}

	/**
	 * 질의 등록
	 */
	public int doInsert(DTO dto) throws SQLException {
		
		int flag = 0;
		return flag;
		
	}

	/**
	 * 질의 조회
	 */
	public DTO doSelectOne(DTO dto) throws SQLException {
		
		BoardVO inVO = (BoardVO) dto;

		return inVO;
	}

	/**
	 * 질의 수정
	 */
	public int doUpdate(DTO dto) throws SQLException {
		
		int flag = 0;
		return flag;
		
	}

	/**
	 * 질의목록 조회 (searchDiv : 10(소비자용), 20(관리자용))
	 */
	public List<?> doRetrieve(DTO dto) throws SQLException {
		
		List<?> list = null;
		
		return list;
	}

}
