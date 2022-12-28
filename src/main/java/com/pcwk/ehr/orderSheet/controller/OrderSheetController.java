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
import com.pcwk.ehr.member.domain.MemberVO;
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
	public String cartView(MemberVO inVO, Model model)throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		MemberVO outVO = memberService.doSelectOne(inVO);

		jsonString = new Gson().toJson(outVO);
		LOG.debug("|jsonString=" + jsonString);
		model.addAttribute("vo",outVO);
		LOG.debug("└=============================┘");
		
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
	
	
	@RequestMapping(value = "/doSelectOne.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doSelectOne(MemberVO inVO, Model model) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		MemberVO outVO = memberService.doSelectOne(inVO);

		jsonString = new Gson().toJson(outVO);
		LOG.debug("|jsonString=" + jsonString);
		model.addAttribute("vo",outVO);
		LOG.debug("└=============================┘");
		
		return jsonString;
	}
	
	@RequestMapping(value = "/deleteAll.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String deleteAll()throws SQLException{
		
		return "";
	}
}
