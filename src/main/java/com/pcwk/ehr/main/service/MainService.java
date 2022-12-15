package com.pcwk.ehr.main.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.main.domain.MainJoinVO;

public interface MainService {
	
	/**
	 * 단건 조회
	 * @param inVO
	 * @return 
	 * @throws SQLException
	 */
	MainJoinVO doSelectOne(MainJoinVO inVO) throws SQLException;
	
	/**
	 * 목록 조회
	 * @param inVO
	 * @return 
	 * @throws SQLException
	 */
	List<MainJoinVO> doRetrieve(DTO inVO) throws SQLException;

}
