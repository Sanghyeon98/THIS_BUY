package com.pcwk.ehr.main.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<ProductImgVO> doRetrieve(DTO inVO) throws SQLException {
		
		SearchVO search = (SearchVO) inVO;
		List<ProductImgVO> list = new ArrayList<ProductImgVO>();
		
        String statement = NAMESPACE + DOT + "doRetrieve";
        LOG.debug("================================");
		LOG.debug("|  param:" + inVO );        
		LOG.debug("|  statement:" + statement );  
		
		list = sqlSessionTemplate.selectList(statement, search);
		
		LOG.debug("|  list:" + list );  
		
		for(ProductImgVO vo : list) {
			LOG.debug("|  vo : " + vo );
		}
		LOG.debug("================================");
		
		return list;
	}



	@Override
	public int doSave(ProductImgVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int doDelete(ProductImgVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int doUpdate(ProductImgVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public ProductImgVO doSelectOne(ProductImgVO inVO) throws SQLException {
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



	@Override
	public List<ProductImgVO> cateList1() throws SQLException {
		List<ProductImgVO> list1 = null;
		
		String statement = NAMESPACE + DOT + "cateList1";

		LOG.debug("================================");
		LOG.debug("|  statement: " + statement);
		
		list1 = sqlSessionTemplate.selectList(statement);
		
		for(ProductImgVO vo : list1) {
			LOG.debug("|  vo : " + vo);
		}
		LOG.debug("================================");
		
		return list1;
	}



	@Override
	public List<ProductImgVO> cateList2() throws SQLException {
		List<ProductImgVO> list2 = null;
		
		String statement = NAMESPACE + DOT + "cateList2";

		LOG.debug("================================");
		LOG.debug("|  statement: " + statement);
		
		list2 = sqlSessionTemplate.selectList(statement);
		
		for(ProductImgVO vo : list2) {
			LOG.debug("|  vo : " + vo);
		}
		LOG.debug("================================");
		
		return list2;
	}



	@Override
	public List<ProductImgVO> cateList3() throws SQLException {
		List<ProductImgVO> list3 = null;
		
		String statement = NAMESPACE + DOT + "cateList3";

		LOG.debug("================================");
		LOG.debug("|  statement: " + statement);
		
		list3 = sqlSessionTemplate.selectList(statement);
		
		for(ProductImgVO vo : list3) {
			LOG.debug("|  vo : " + vo);
		}
		LOG.debug("================================");
		
		return list3;
	}



	@Override
	public List<ProductImgVO> cateList4() throws SQLException {
		List<ProductImgVO> list4 = null;
		
		String statement = NAMESPACE + DOT + "cateList4";

		LOG.debug("================================");
		LOG.debug("|  statement: " + statement);
		
		list4 = sqlSessionTemplate.selectList(statement);
		
		for(ProductImgVO vo : list4) {
			LOG.debug("|  vo : " + vo);
		}
		LOG.debug("================================");
		
		return list4;
	}



	@Override
	public List<ProductImgVO> cateList5() throws SQLException {
		List<ProductImgVO> list5 = null;
		
		String statement = NAMESPACE + DOT + "cateList5";

		LOG.debug("================================");
		LOG.debug("|  statement: " + statement);
		
		list5 = sqlSessionTemplate.selectList(statement);
		
		for(ProductImgVO vo : list5) {
			LOG.debug("|  vo : " + vo);
		}
		LOG.debug("================================");
		
		return list5;
	}

	
}
