package com.pcwk.ehr.admin.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.cmn.DTO;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
	final Logger LOG = LogManager.getLogger(getClass());
	
	final String NAMESPACE = "com.pcwk.ehr.user";
	final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public AdminDaoImpl() {}

	@Override
	public int doSave(CategoryVO inVO) throws SQLException {
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "doSave";
		LOG.debug("|  statement : " + statement);
		
		int flag = sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("|  flag : " + flag);
		LOG.debug("└--------------------------------┘");
		
		return flag;
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
