package com.pcwk.ehr.cart.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cart.dao.CartDao;
import com.pcwk.ehr.cart.domain.CartJoinVO;
import com.pcwk.ehr.cart.domain.CartVO;

@Service("CartService")
public class CartServiceImpl implements CartService {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	CartDao cartDao;
	
	@Override
	public int doSave(CartVO inVO) throws SQLException {
		return cartDao.doSave(inVO);
	}

	@Override
	public int doDelete(CartVO inVO) throws SQLException {
		return cartDao.doDelete(inVO);
	}

	@Override
	public int doUpdate(CartVO inVO) throws SQLException {
		return cartDao.doUpdate(inVO);
	}

	@Override
	public List<CartJoinVO> getAll(CartJoinVO inVO) throws SQLException {
		return cartDao.getAll(inVO);
	}

}
