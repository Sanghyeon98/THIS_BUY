package com.pcwk.ehr.detail.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.detail.domain.DetailVO;

public interface DetailService {
    /**
     * 상품 다건 삭제
     * @param users
     * @return 삭제 건수 
     * @throws SQLException
     */
	int upDeleteAll(List<DetailVO> products) throws SQLException;
	
	/**
	 * 상품명 중복 체크
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int idCheck(DetailVO inVO) throws SQLException;

	/**
	 * 신규 회원 등록 로직
	 * @param inVO
	 */
	public int add(DetailVO inVO) throws SQLException;

	/**
	 * 상품 삭제
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doDelete(DetailVO inVO) throws SQLException;

	/**
	 * 상품 수정
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doUpdate(DetailVO inVO) throws SQLException;

	/**
	 * 단건 조회
	 * @param t
	 * @return T
	 * @throws SQLException
	 */
	DetailVO doSelectOne(DetailVO inVO) throws SQLException;

	/**
	 * 목록 조회
	 * @param t
	 * @return List<DTO>
	 * @throws SQLException
	 */
	List<DetailVO> doRetrieve(DTO inVO) throws SQLException;

	/**
	 * categoryNo 건수 조회
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int getCount(DetailVO inVO) throws SQLException;
}
