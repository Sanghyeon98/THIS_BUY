package com.pcwk.ehr.admin.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.cmn.DTO;

public interface ProductService {
	
	/**
	 * 상품 다건 품절
	 * @param products
	 * @return
	 * @throws SQLException
	 */
	int upSoldOutAll(List<ProductVO> products) throws SQLException;
	
    /**
     * 상품 다건 삭제
     * @param users
     * @return 삭제 건수 
     * @throws SQLException
     */
	int upDeleteAll(List<ProductVO> products) throws SQLException;
	
	/**
	 * 상품명 중복 체크
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int idCheck(ProductVO inVO) throws SQLException;

	/**
	 * 신규 회원 등록 로직
	 * @param inVO
	 */
	public int add(ProductVO inVO) throws SQLException;

	/**
	 * 상품 삭제
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doDelete(ProductVO inVO) throws SQLException;

	/**
	 * 상품 수정
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doUpdate(ProductVO inVO) throws SQLException;

	/**
	 * 단건 조회
	 * @param t
	 * @return T
	 * @throws SQLException
	 */
	ProductVO doSelectOne(ProductVO inVO) throws SQLException;

	/**
	 * 목록 조회
	 * @param t
	 * @return List<DTO>
	 * @throws SQLException
	 */
	List<ProductVO> doRetrieve(DTO inVO) throws SQLException;

	/**
	 * categoryNo 건수 조회
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int getCount(ProductVO inVO) throws SQLException;
}
