package com.pcwk.ehr.cart.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cart.domain.CartVO;
import com.pcwk.ehr.cmn.DTO;

public interface CartDao {

	/**
	 * 장바구니 선택 삭제
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	int doDelete(DTO dto)throws SQLException;
	
	/**
	 * 장바구니 추가
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	
	int doInsert(DTO dto)throws SQLException;
	
	/**
	 * 장바구니 목록조회
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	
	List<CartVO> doRetrieve(DTO dto) throws SQLException;
}
