package com.pcwk.ehr.detail.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.detail.domain.DetailVO;

@Repository("DetailDao")
public class DetailDaoImpl implements DetailDao {
	final Logger LOG = LogManager.getLogger(getClass());
	
	final String NAMESPACE = "com.pcwk.ehr.detail";
	final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public DetailDaoImpl() {}

	@Override
	public int doSave(DetailVO inVO) throws SQLException {

		return 0;
	}

	@Override
	public int doDelete(DetailVO inVO) throws SQLException {
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
	public int doUpdate(DetailVO inVO) throws SQLException {
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
	public DetailVO doSelectOne(DetailVO inVO) throws SQLException {
		DetailVO outVO = null;
		
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
	public List<DetailVO> doRetrieve(DTO inVO) throws SQLException {
		SearchVO search = (SearchVO) inVO;
		List<DetailVO> list = new ArrayList<DetailVO>();
		
        String statement = NAMESPACE + DOT + "doRetrieve";
        LOG.debug("================================");
		LOG.debug("|  param:" + inVO );        
		LOG.debug("|  statement:" + statement );  
		
		list = sqlSessionTemplate.selectList(statement, search);
		
		for(DetailVO vo : list) {
			LOG.debug("|  vo : " + vo );
		}
		LOG.debug("================================");
		
		return list;
	}

	@Override
	public int getCount(DetailVO inVO) throws SQLException {
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
	public List<DetailVO> getALL(DetailVO inVO) throws SQLException {
		List<DetailVO> list = null;
		
		String statement = NAMESPACE + DOT + "getALL";

		LOG.debug("================================");
		LOG.debug("|  param : " + inVO);
		LOG.debug("|  statement: " + statement);
		
		list = sqlSessionTemplate.selectList(statement, inVO);
		
		for(DetailVO vo : list) {
			LOG.debug("|  vo : " + vo);
		}
		LOG.debug("================================");
		
		return list;
	}




}
