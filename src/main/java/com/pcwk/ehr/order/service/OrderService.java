package com.pcwk.ehr.order.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.DTO;

import com.pcwk.ehr.order.domain.OrderVO;

public interface OrderService {
	 /**
     * 주문상품 다건 삭제
     * @param users
     * @return 삭제 건수 
     * @throws SQLException
     */
	int upDeleteAll(List<OrderVO> products) throws SQLException;
	
	/**
	 * 주문상품명 중복 체크
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int idCheck(OrderVO inVO) throws SQLException;
	
	/**
	 * 신규 회원 등록 로직
	 * 
	 * @param inVO
	 */
	public int add(OrderVO inVO) throws SQLException;
	/**
	 * 주문상품 삭제
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doDelete(OrderVO inVO) throws SQLException;

	
	/**
	 * 상품 수정
	 * 
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doUpdate(OrderVO inVO) throws SQLException;
	
	
	/**
	 * 상품 추가
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doSave(OrderVO inVO) throws	SQLException;
	
	/**
	 * 단건 조회
	 * @param t
	 * @return T
	 * @throws SQLException
	 */
	OrderVO doSelectOne(OrderVO inVO) throws SQLException;
	
	/**
	 * 주문목록 조회
	 * @param t
	 * @return List<DTO>
	 * @throws SQLException
	 */
	List<OrderVO> doRetrieve(DTO inVO) throws SQLException;
   
}

