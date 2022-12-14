package com.pcwk.ehr.admin.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.cmn.DTO;

public interface CategoryService {
	
    /**
     * 카테고리 다건 삭제
     * @param users
     * @return 삭제 건수 
     * @throws SQLException
     */
	int upDeleteAll(List<CategoryVO> users) throws SQLException;
	
	/**
	 * 카테고리 이름 중복 체크
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int idCheck(CategoryVO inVO) throws SQLException;

	/**
	 * 카테고리 추가
	 * @param inVO
	 */
	public int add(CategoryVO inVO) throws SQLException;

	/**
	 * 카테고리 삭제
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doDelete(CategoryVO inVO) throws SQLException;

	/**
	 * 카테고리 수정
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doUpdate(CategoryVO inVO) throws SQLException;

	/**
	 * 단건조회
	 * @param t
	 * @return T
	 * @throws SQLException
	 */
	CategoryVO doSelectOne(CategoryVO inVO) throws SQLException;

	/**
	 * 카테고리 목록조회
	 * @param t
	 * @return List<DTO>
	 * @throws SQLException
	 */
	List<CategoryVO> doRetrieve(DTO inVO) throws SQLException;
	
	
	/**
	 * 조건절 없이 모든 카테고리 목록 조회
	 * @return
	 * @throws SQLException
	 */
	List<CategoryVO> getALL() throws SQLException;

}
