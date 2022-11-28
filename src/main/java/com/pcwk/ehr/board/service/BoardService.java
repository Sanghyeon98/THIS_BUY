package com.pcwk.ehr.board.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.DTO;


public interface BoardService {
	
	/**
	 * 등록
	 * @param DTO
	 * @return 
	 * @throws SQLException
	 */
	int  doInsert(DTO dto) throws  SQLException;
	
	/**
	 * 삭제
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doDelete(DTO dto)throws SQLException;
	
	/**
	 * 수정
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doUpdate(DTO dto)throws SQLException;
	
	
	/**
	 * 단건조회
	 * @param t
	 * @return T
	 * @throws SQLException
	 */
	DTO doSelectOne(DTO dto)throws SQLException;
	
	/**
	 * 목록조회
	 * @param t
	 * @return List<DTO>
	 * @throws SQLException
	 */
	List<?> doRetrive(DTO dto)throws SQLException;

}
