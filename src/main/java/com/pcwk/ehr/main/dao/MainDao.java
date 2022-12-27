package com.pcwk.ehr.main.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.main.domain.ProductImgVO;

public interface MainDao extends WorkDiv<ProductVO>{
	
	//전체 데이터
	List<ProductImgVO> getAll() throws SQLException;
	
	//등록된 데이터 건수 확인
	int getCount() throws SQLException;
}
