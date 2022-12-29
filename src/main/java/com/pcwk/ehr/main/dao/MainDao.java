package com.pcwk.ehr.main.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.WorkDiv;
import com.pcwk.ehr.main.domain.ProductImgVO;

public interface MainDao extends WorkDiv<ProductImgVO>{
	
	//전체 최신 데이터
	List<ProductImgVO> getAll() throws SQLException;
	
	
	//상위 카테고리별 데이터
	List<ProductImgVO> cateList1() throws SQLException;
	
	List<ProductImgVO> cateList2() throws SQLException;
	
	List<ProductImgVO> cateList3() throws SQLException;
	
	List<ProductImgVO> cateList4() throws SQLException;
	
	List<ProductImgVO> cateList5() throws SQLException;
	
	
	//등록된 데이터 건수 확인
	int getCount() throws SQLException;
}
