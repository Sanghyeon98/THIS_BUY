package com.pcwk.ehr.main.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.admin.dao.CategoryDao;
import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.main.dao.MainDao;
import com.pcwk.ehr.main.domain.MainCateSearchVO;

@Service("mainServiceImpl")
public class MainServiceImpl implements MainService {
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	MainDao mainDao;
	
	public MainServiceImpl() {}

	@Override
	public List<MainCateSearchVO> doRetrieve(DTO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return mainDao.doRetrieve(inVO);
	}

	@Override
	public List<MainCateSearchVO> getALL() throws SQLException {
		
		return mainDao.getALL();
	}

}
