package com.pcwk.ehr.order.controller;


import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.cart.domain.CartJoinVO;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.code.service.CodeService;
import com.pcwk.ehr.order.domain.OrderVO;
import com.pcwk.ehr.order.service.OrderService;
@Controller("orderController")
@RequestMapping("order")
public class OrderController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CodeService  codeService;
	
	public OrderController() {}
	
	
	@RequestMapping(value = "/doUpdate.do",method=RequestMethod.POST
			,produces = "application/json;charset=UTF-8")
	@ResponseBody //비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doRetrieve(OrderVO inVO) throws SQLException{
		LOG.debug("┌=============================┐");	
		LOG.debug("│=doRetrieve()=");
		LOG.debug("│inVO:"+inVO);
		LOG.debug("└=============================┘");
		List<OrderVO> list = (List<OrderVO>) orderService.doRetrieve(inVO);
		for(OrderVO vo : list) {
			LOG.debug(vo.toString());
		}
		
		String jsonList =new Gson().toJson(list);
		
		return jsonList;
		
	}
	@RequestMapping(value = "/moveToLogin.do",method=RequestMethod.POST
			,produces = "application/json;charset=UTF-8")
	@ResponseBody //비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String moveToLogin(Model meodel,SearchVO inVO)throws SQLException{
		 String VIEW_NAME = "";
		 LOG.debug("┌=============================┐");	
		 LOG.debug("|inVO="+inVO);		
		 
		 
		 
		 LOG.debug("|VIEW_NAME="+VIEW_NAME);	
		 LOG.debug("└=============================┘");
		return VIEW_NAME;
	}
	
	
}
