package com.pcwk.ehr.order.dao;

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
import com.pcwk.ehr.order.domain.OrderVO;

@Repository("OrderDao")
public class OrderDaoImpl implements OrderDao {
	final Logger LOG = LogManager.getFormatterLogger(getClass());

	final String NAMESPACE = "com.pcwk.ehr.order";
	final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public OrderDaoImpl() {
	}
    
	
	
	@Override
	public int doDelete(DTO dto) throws SQLException {
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + dto);

		String statement = NAMESPACE + DOT + "doInsert";
		LOG.debug("|  statement : " + statement);

		int flag = sqlSessionTemplate.insert(statement, dto);
		LOG.debug("|  flag : " + flag);
		LOG.debug("└--------------------------------┘");

		return flag;
	}

	@Override
	public int doSave(DTO dto) throws SQLException {
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + dto);

		String statement = NAMESPACE + DOT + "doInsert";
		LOG.debug("|  statement : " + statement);

		int flag = sqlSessionTemplate.insert(statement, dto);
		LOG.debug("|  flag : " + flag);
		LOG.debug("└--------------------------------┘");

		return flag;
	}

	@Override
	public List<OrderVO> doRetrieve(DTO dto) throws SQLException {
		SearchVO search = (SearchVO) dto;
		List<OrderVO> list = new ArrayList<OrderVO>();
		
		String statement = NAMESPACE + DOT + "doRetrieve";
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param:" + dto);
		LOG.debug("|  statement:" + statement);
		LOG.debug("└--------------------------------┘");
		
		return list;
	}

	@Override
	public int doUpdate(OrderVO inVO) throws SQLException {
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + inVO);

		String statement = NAMESPACE + DOT + "doInsert";
		LOG.debug("|  statement : " + statement);

		int flag = sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("|  flag : " + flag);
		LOG.debug("└--------------------------------┘");

		return flag;
	}



	@Override
	public OrderVO selectOne(OrderVO inVO) throws SQLException {
		String statement = NAMESPACE + DOT + "doSelectOne";
		OrderVO outVO = null;
		
		LOG.debug("================================");
		LOG.debug("|  param : " + inVO);
		LOG.debug("|  statement: " + statement);

		outVO = sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("|  outVO : " + outVO);
		LOG.debug("================================");

		return outVO;
	}

	@Override
	public int getCount(OrderVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
