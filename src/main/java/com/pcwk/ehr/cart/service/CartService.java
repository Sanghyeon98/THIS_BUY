package com.pcwk.ehr.cart.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cart.domain.CartJoinVO;
import com.pcwk.ehr.cart.domain.CartVO;
import com.pcwk.ehr.cmn.DTO;

public interface CartService {
	/**
	 * 등록
	 * @param t
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	int doSave(CartVO inVO) throws SQLException;
	
	/**
	 * 삭제
	 * @param t
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	int doDelete(CartVO inVO) throws SQLException;
	
	/**
	 * 수정
	 * @param t
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	int doUpdate(CartVO inVO) throws SQLException;
	
	/**
	 * 목록 조회
	 * @param t
	 * @return
	 * @throws SQLException
	 */
	List<CartJoinVO> getAll(CartJoinVO inVO) throws SQLException;
}
