package com.pcwk.ehr.main.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.main.dao.MainDao;
import com.pcwk.ehr.main.domain.MainJoinVO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	MainDao mainDao;
	
	public MainServiceImpl() {}
	
	@Override
	public MainJoinVO doSelectOne(MainJoinVO inVO) throws SQLException {
		return mainDao.doSelectOne(inVO);
	}

	@Override
	public List<MainJoinVO> doRetrieve(DTO inVO) throws SQLException {
		return mainDao.doRetrieve(inVO);
	}
	
}
