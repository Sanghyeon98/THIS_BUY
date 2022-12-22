package com.pcwk.ehr.order.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.order.dao.OrderDao;
import com.pcwk.ehr.order.domain.OrderVO;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao orderdao;
	
	public OrderServiceImpl() {
		
	}
	
	@Override
	public int upDeleteAll(List<OrderVO> products) throws SQLException {
			int cnt = 0;
		return 0;
	}

	@Override
	public int idCheck(OrderVO inVO) throws SQLException {

		return 0;
	}

	@Override
	public int add(OrderVO inVO) throws SQLException {
		 
		return orderdao.doSave(inVO);
	}

	@Override
	public int doDelete(OrderVO inVO) throws SQLException {

		return orderdao.doDelete(inVO);
	}

	@Override
	public int doUpdate(OrderVO inVO) throws SQLException {
	
		return orderdao.doUpdate(inVO);
	}

	@Override
	public OrderVO doSelectOne(OrderVO inVO) throws SQLException {

		return orderdao.doSelectOne(inVO);
	}

	@Override
	public List<OrderVO> doRetrieve(DTO inVO) throws SQLException {
	
		return orderdao.doRetrieve(inVO);
	}

	@Override
	public int doSave(OrderVO inVO) throws SQLException {
		
		return orderdao.doSave(inVO);
	}

}
