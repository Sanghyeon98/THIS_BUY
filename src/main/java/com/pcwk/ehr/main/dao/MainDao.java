package com.pcwk.ehr.main.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.main.domain.MainJoinVO;

public interface MainDao extends WorkDiv<MainJoinVO> {
	//전체 데이터 조회
	List<MainJoinVO> getAll(MainJoinVO inVO) throws SQLException;
}
