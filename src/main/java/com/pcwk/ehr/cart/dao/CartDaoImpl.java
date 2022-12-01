package com.pcwk.ehr.cart.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cart.domain.CartVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.SearchVO;

@Repository("cartDao")
public class CartDaoImpl implements CartDao {
	final Logger LOG = LogManager.getFormatterLogger(getClass());

	final String NAMESPACE = "com.pcwk.ehr.cart";
	final String DOT = "."; 
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public CartDaoImpl() {}
	
	
	@Override
	public int doDelete(CartVO inVO) throws SQLException {
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "doDelete";
		LOG.debug("|  statement : " + statement);
		
		int flag = sqlSessionTemplate.delete(statement, inVO);
		LOG.debug("|  flag : " + flag);
		LOG.debug("└--------------------------------┘"); 
		
		return flag;
	}

	@Override
	public int doSave(CartVO inVO) throws SQLException {
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
	public List<CartVO> doRetrieve(DTO dto) throws SQLException {
		SearchVO search = (SearchVO) dto;
		List<CartVO> list = new ArrayList<CartVO>();
		
		String statement = NAMESPACE + DOT + "doRetrieve";
        LOG.debug("================================");
		LOG.debug("|  param:" + dto );        
		LOG.debug("|  statement:" + statement ); 
		
		list = sqlSessionTemplate.selectList(statement, search);
		
		for(CartVO vo : list) {
			LOG.debug("|  vo : " + vo );
		}
		LOG.debug("================================");
		
		return list;
	}


	@Override
	public int doUpdate(CartVO inVO) throws SQLException {
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "doUpdate";
		LOG.debug("|  statement : " + statement);
		
		int flag = sqlSessionTemplate.update(statement, inVO);
		LOG.debug("|  flag : " + flag);
		LOG.debug("└--------------------------------┘");
		
		return flag;
	}


	@Override
	public CartVO doSelectOne(CartVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
