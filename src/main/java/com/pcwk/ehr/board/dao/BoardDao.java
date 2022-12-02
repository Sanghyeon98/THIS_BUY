package com.pcwk.ehr.board.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.DTO;

public interface BoardDao {

	/**
	 * 공지사항 삭제
	 * @param dto
	 * @return int (1성공, 0 실패)
	 * @throws SQLException
	 */
	// query, param 처리
	// 예외처리, 자원반납의 경우는 JdbcTemplate 내부로 이동
	int doDelete(DTO dto) throws SQLException; 

	/**
	 * 공지사항 등록
	 * @param dto
	 * @return int (1성공, 0 실패)
	 * @throws SQLException
	 */
	// query, param 처리
	// 예외처리, 자원반납의 경우는 JdbcTemplate 내부로 이동
	int doInsert(DTO dto)throws SQLException;

	/**
	 * 공지사항 단건조회
	 * @param DTO
	 * @return DTO
	 * @throws SQLException
	 */
	DTO doSelectOne(DTO dto) throws SQLException;
	
	/**
	 * 공지사항 수정
	 * @param dto
	 * @return int (1성공, 0 실패)
	 * @throws SQLException
	 */
	int doUpdate(DTO dto) throws SQLException;
	
	/**
	 * 공지사항 목록조회 (검색포함)
	 * @param dto
	 * @return List<?>
	 * @throws SQLException
	 */
	List<BoardVO> doRetrieve(DTO dto) throws SQLException;
	
}
