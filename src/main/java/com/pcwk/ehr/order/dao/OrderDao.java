package com.pcwk.ehr.order.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.cart.domain.CartVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.order.domain.OrderVO;

public interface OrderDao {

	int doUpdate(OrderVO inVO)throws SQLException;
	/**
	 * 선택 삭제
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	int doDelete(DTO dto)throws SQLException;
	
	/**
	 *  추가
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	
	int doSave(DTO dto)throws SQLException;
	
	/**
	 *  목록조회
	 * @param dto
	 * @return
	 * @throws SQLException
	 */
	List<OrderVO> doRetrieve(DTO dto) throws SQLException;
	
	/**
	 * 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int getCount(OrderVO inVO) throws SQLException;
	
	/**
	 * 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	
	OrderVO selectOne(OrderVO inVO) throws SQLException;

	
	
	// 등록된 데이터 건수 확인

}

