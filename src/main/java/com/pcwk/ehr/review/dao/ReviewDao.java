package com.pcwk.ehr.review.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.DTO;

public interface ReviewDao {

	/**
	 * 후기삭제
	 * @param dto
	 * @return int (1성공, 0실패)
	 * @throws SQLException
	 */
	int doDelete(DTO dto)throws SQLException;
	
	/**
	 * 후기 단건조회
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	int doInsert(DTO dto)throws SQLException;	
	
	/**
	 * 후기 수정
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	int doUpdate(DTO dto)throws SQLException;
	
	/**
	 * 후기 목록 조회(검색포함)
	 * @param dto
	 * @return List<?>
	 * @throws SQLException
	 */
	List<?> doRetrieve(DTO dto)throws SQLException;
	
}
