package com.pcwk.ehr.main.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.admin.domain.ProductVO;
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
	public List<ProductVO> getGoodsList(ProductImgVO inVO) throws SQLException {
		
		return maindao.doRetrieve(inVO);
	}

	@Override
	public int getCount() throws SQLException {
		return maindao.getCount();
	}

	

}
