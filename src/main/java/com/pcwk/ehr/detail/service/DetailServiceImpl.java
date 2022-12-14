package com.pcwk.ehr.detail.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.detail.dao.DetailDao;
import com.pcwk.ehr.detail.domain.DetailVO;

@Service("detailService")
public class DetailServiceImpl implements DetailService {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	DetailDao detailDao;

	public DetailServiceImpl() {
	}

	@Override
	public int upDeleteAll(List<DetailVO> details) throws SQLException {
		int cnt = 0;

		return cnt;
	}

	@Override
	public int idCheck(DetailVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public int add(DetailVO inVO) throws SQLException {
		return detailDao.doSave(inVO);
	}

	@Override
	public int doDelete(DetailVO inVO) throws SQLException {
		return detailDao.doDelete(inVO);
	}

	@Override
	public int doUpdate(DetailVO inVO) throws SQLException {
		return detailDao.doUpdate(inVO);
	}

	@Override
	public DetailVO doSelectOne(DetailVO inVO) throws SQLException {
		return detailDao.doSelectOne(inVO);
	}

	@Override
	public List<DetailVO> doRetrieve(DTO inVO) throws SQLException {
		return detailDao.doRetrieve(inVO);
	}

	@Override
	public int getCount(DetailVO inVO) throws SQLException {
		return detailDao.getCount(inVO);
	}

}
