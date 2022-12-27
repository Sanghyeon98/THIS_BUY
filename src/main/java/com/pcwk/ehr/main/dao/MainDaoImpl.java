package com.pcwk.ehr.main.dao;

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
import com.pcwk.ehr.main.domain.ProductImgVO;

@Repository("mainDao")
public class MainDaoImpl implements MainDao {
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	final String NAMESPACE = "com.pcwk.ehr.main";
	final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ProductVO> doRetrieve(DTO inVO) throws SQLException {
		
		SearchVO search = (SearchVO) inVO;
		List<ProductVO> list = new ArrayList<ProductVO>();
		
        String statement = NAMESPACE + DOT + "doRetrieve";
        LOG.debug("================================");
		LOG.debug("|  param:" + inVO );        
		LOG.debug("|  statement:" + statement );  
		
		list = sqlSessionTemplate.selectList(statement, search);
		
		for(ProductVO vo : list) {
			LOG.debug("|  vo : " + vo );
		}
		LOG.debug("================================");
		
		return list;
	}



	@Override
	public int doSave(ProductVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int doDelete(ProductVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int doUpdate(ProductVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public ProductVO doSelectOne(ProductVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<ProductImgVO> getAll() throws SQLException {
		List<ProductImgVO> list = null;
		
		String statement = NAMESPACE + DOT + "getALL";

		LOG.debug("================================");
		LOG.debug("|  statement: " + statement);
		
		list = sqlSessionTemplate.selectList(statement);
		
		for(ProductImgVO vo : list) {
			LOG.debug("|  vo : " + vo);
		}
		LOG.debug("================================");
		
		return list;
	}



	@Override
	public int getCount() throws SQLException {
        int count = 0;
		
		String statement = NAMESPACE + DOT + "getCount";
		LOG.debug("================================");
		LOG.debug("|  param : ");
		LOG.debug("|  statement: " + statement);
		
		count = sqlSessionTemplate.selectOne(statement);
		LOG.debug("================================");
		
		return count;
	}

	
}
