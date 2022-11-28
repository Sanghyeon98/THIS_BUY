package com.pcwk.ehr.admin.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.SearchVO;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
	final Logger LOG = LogManager.getLogger(getClass());
	
	final String NAMESPACE = "com.pcwk.ehr.admin";
	final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public AdminDaoImpl() {}

	@Override
	public int doSave(CategoryVO inVO) throws SQLException {
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "doSaveCategory";
		LOG.debug("|  statement : " + statement);
		
		int flag = sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("|  flag : " + flag);
		LOG.debug("└--------------------------------┘");
		
		return flag;
	}

	@Override
	public int doDelete(CategoryVO inVO) throws SQLException {
		LOG.debug("================================");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "doDeleteCategory";
		LOG.debug("|  statement: " + statement);
		
		int flag = sqlSessionTemplate.delete(statement, inVO);
		LOG.debug("|  flag: " + flag);
		LOG.debug("================================");
		
		return flag;
	}

	@Override
	public int doUpdate(CategoryVO inVO) throws SQLException {
		int flag = 0;
		
		LOG.debug("================================");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "doUpdateCategory";
		LOG.debug("|  statement: " + statement);
		
		flag = sqlSessionTemplate.update(statement, inVO);
		LOG.debug("|  flag: " + flag);
		LOG.debug("================================");
		
		return flag;
	}

	@Override
	public CategoryVO doSelectOne(CategoryVO inVO) throws SQLException {
		return null;
	}

	@Override
	public List<CategoryVO> doRetrieve(DTO inVO) throws SQLException {
		SearchVO search = (SearchVO) inVO;
		List<CategoryVO> list = new ArrayList<CategoryVO>();
		
        String statement = NAMESPACE + DOT + "doRetrieveCategory";
        LOG.debug("================================");
		LOG.debug("|  param:" + inVO );        
		LOG.debug("|  statement:" + statement );  
		
		list = sqlSessionTemplate.selectList(statement, search);
		
		for(CategoryVO vo : list) {
			LOG.debug("|  vo : " + vo );
		}
		LOG.debug("================================");
		
		return list;
	}

}
