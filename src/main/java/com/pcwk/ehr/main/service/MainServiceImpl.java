package com.pcwk.ehr.main.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.main.dao.MainDao;
import com.pcwk.ehr.main.domain.ProductImgVO;

@Service("mainServiceImpl")
public class MainServiceImpl implements MainService {
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	MainDao maindao;
	
	public MainServiceImpl() {}

	@Override
	public List<ProductImgVO> getAll() throws SQLException {
		return maindao.getAll();
	}
	
	@Override
	public List<ProductImgVO> getGoodsList(ProductImgVO inVO) throws SQLException {
		
		return maindao.doRetrieve(inVO);
	}

	@Override
	public int getCount() throws SQLException {
		return maindao.getCount();
	}

	@Override
	public List<ProductImgVO> doRetrieve(DTO inVO) throws SQLException {
		return maindao.doRetrieve(inVO);
	}

	@Override
	public List<ProductImgVO> cateList1() throws SQLException {
		return maindao.cateList1();
	}

	@Override
	public List<ProductImgVO> cateList2() throws SQLException {
		return maindao.cateList2();
	}

	@Override
	public List<ProductImgVO> cateList3() throws SQLException {
		return maindao.cateList3();
	}

	@Override
	public List<ProductImgVO> cateList4() throws SQLException {
		return maindao.cateList4();
	}

	@Override
	public List<ProductImgVO> cateList5() throws SQLException {
		return maindao.cateList5();
	}

}
