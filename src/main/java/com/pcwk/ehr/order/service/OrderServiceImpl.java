package com.pcwk.ehr.order.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cart.dao.CartDao;
import com.pcwk.ehr.cart.domain.CartJoinVO;
import com.pcwk.ehr.cart.domain.CartVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.order.dao.OrderDao;
import com.pcwk.ehr.order.domain.OrderVO;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao orderdao;
	
	@Autowired
	CartDao cartdao;
	
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
	
	public int doMultiSave(OrderVO inVO) throws SQLException{
		int flag = 0;
		
		CartJoinVO cartJoinVO = new CartJoinVO();
		cartJoinVO.setMemberId(inVO.getMemberId());
		
		List<CartJoinVO> cartList = cartdao.getAll(cartJoinVO);
		
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		
		if(cartList.size() <1) {
			return 0;
		}
		int sameOrder = cartList.get(0).getCartNO();
		for(CartJoinVO vo : cartList) {
			OrderVO tempVO = new OrderVO();
			tempVO.setSameOrder(sameOrder);
			tempVO.setMemberId(inVO.getMemberId());
			tempVO.setItemNO(vo.getItemNO());
			tempVO.setPrice(vo.getPrice());
			tempVO.setPaymentId(inVO.getPaymentId());
			tempVO.setName(inVO.getName());
			tempVO.setAddress(inVO.getAddress());
			tempVO.setRequest(inVO.getRequest());
			
			orderList.add(tempVO);
		}
		
		for(OrderVO vo:orderList) {
			flag += orderdao.doSave(vo);
		}
		
		return flag;
	}

}
