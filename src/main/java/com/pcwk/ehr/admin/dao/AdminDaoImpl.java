package com.pcwk.ehr.admin.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.cmn.DTO;

public class AdminDaoImpl implements AdminDao {

	@Override
	public int doSave(CategoryVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public int doDelete(CategoryVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public int doUpdate(CategoryVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public CategoryVO doSelectOne(CategoryVO inVO) throws SQLException {
		return null;
	}

	@Override
	public List<DTO> doRetrieve(CategoryVO inVO) throws SQLException {
		return null;
	}

}
