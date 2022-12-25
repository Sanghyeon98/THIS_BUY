package com.pcwk.ehr.main.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.main.domain.MainCateSearchVO;

public interface MainService {
	
	/**
	 * 카테고리 목록조회
	 * @param t
	 * @return List<DTO>
	 * @throws SQLException
	 */
	List<MainCateSearchVO> doRetrieve(DTO inVO) throws SQLException;
	
	
	/**
	 * 조건절 없이 모든 카테고리 목록 조회
	 * @return
	 * @throws SQLException
	 */
	List<MainCateSearchVO> getALL() throws SQLException;
}
