package com.pcwk.ehr.orderSheet.controller;

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
import com.pcwk.ehr.cart.service.CartService;
import com.pcwk.ehr.member.service.MemberService;

@Controller("OrderSheetController")
@RequestMapping("orderSheet")
public class OrderSheetController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired 
	CartService cartService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/view.do")
	public String cartView(Model model)throws SQLException {
		System.out.println("=============================================");
		System.out.println("==cartcontroller=cartView====");
		System.out.println("=============================================");
		
		
		return "orderSheet/orderSheet";
	}
	
	@RequestMapping(value = "/cartgetAll.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getAll(CartJoinVO inVO) throws SQLException{
		LOG.debug("= getAll() =");
		LOG.debug("inVO : " + inVO);
		
		List<CartJoinVO> list = (List<CartJoinVO>) cartService.getAll(inVO);
		for(CartJoinVO vo : list) {
			LOG.debug(vo.toString());
		}
		
		String jsonList =new Gson().toJson(list);
		
		return jsonList;
		
	}
}
