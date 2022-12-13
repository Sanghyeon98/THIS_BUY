package com.pcwk.ehr.board.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.WorkDiv;

public interface BoardDao extends WorkDiv<BoardVO> {

	// 비번체크
	int answerCheck(BoardVO inVO) throws SQLException;
	
	// like 전체 데이터 리턴
	List<BoardVO> getALL(BoardVO inVO) throws SQLException;
		
	
}
