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

@Repository("CategoryDao")
public class CategoryDaoImpl implements CategoryDao {
	final Logger LOG = LogManager.getLogger(getClass());
	
	final String NAMESPACE = "com.pcwk.ehr.category";
	final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public CategoryDaoImpl() {}

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
		LOG.debug("================================");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "doDelete";
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
		
		String statement = NAMESPACE + DOT + "doUpdate";
		LOG.debug("|  statement: " + statement);
		
		flag = sqlSessionTemplate.update(statement, inVO);
		LOG.debug("|  flag: " + flag);
		LOG.debug("================================");
		
		return flag;
	}

	@Override
	public CategoryVO doSelectOne(CategoryVO inVO) throws SQLException {
		CategoryVO outVO = null;
		
		String statement = NAMESPACE + DOT + "doSelectOne";

		LOG.debug("================================");
		LOG.debug("|  param : " + inVO);
		LOG.debug("|  statement: " + statement);
		
		outVO = sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("|  outVO : " + outVO);
		LOG.debug("================================");
		
		return outVO;
	}

	@Override
	public List<CategoryVO> doRetrieve(DTO inVO) throws SQLException {
		SearchVO search = (SearchVO) inVO;
		List<CategoryVO> list = new ArrayList<CategoryVO>();
		
        String statement = NAMESPACE + DOT + "doRetrieve";
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

	@Override
	public int getCount(CategoryVO inVO) throws SQLException {
		int count = 0;
		
		String statement = NAMESPACE + DOT + "getCount";
		LOG.debug("================================");
		LOG.debug("|  param : " + inVO);
		LOG.debug("|  statement: " + statement);
		
		count = sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("================================");
		
		return count;
	}

	@Override
	public List<CategoryVO> getALL(CategoryVO inVO) throws SQLException {
		List<CategoryVO> list = null;
		
		String statement = NAMESPACE + DOT + "getALL";

		LOG.debug("================================");
		LOG.debug("|  param: " + inVO);
		LOG.debug("|  statement: " + statement);
		
		list = sqlSessionTemplate.selectList(statement, inVO);
		
		for(CategoryVO vo : list) {
			LOG.debug("|  vo : " + vo);
		}
		LOG.debug("================================");
		
		return list;
	}

}
