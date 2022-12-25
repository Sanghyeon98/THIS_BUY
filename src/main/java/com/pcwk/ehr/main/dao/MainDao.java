package com.pcwk.ehr.main.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.main.domain.MainCateSearchVO;

public interface MainDao extends WorkDiv<MainCateSearchVO>{
	
	// 전체 데이터 리턴
	List<MainCateSearchVO> getALL() throws SQLException;
	
}
