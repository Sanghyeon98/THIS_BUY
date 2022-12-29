package com.pcwk.ehr.main.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.main.domain.ProductImgVO;

public interface MainService {
	
	/* 전체 최신 상품 조회 */
	List<ProductImgVO> getAll() throws SQLException;
	
	List<ProductImgVO> cateList1() throws SQLException;
	
	List<ProductImgVO> cateList2() throws SQLException;
	
	List<ProductImgVO> cateList3() throws SQLException;
	
	List<ProductImgVO> cateList4() throws SQLException;
	
	List<ProductImgVO> cateList5() throws SQLException;
	
	/*상품 검색*/
	List<ProductImgVO> getGoodsList(ProductImgVO inVO) throws SQLException;

	/**
	 * categoryNo 건수 조회
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int getCount() throws SQLException;
	
	
	List<ProductImgVO> doRetrieve(DTO inVO) throws SQLException;
	
}
