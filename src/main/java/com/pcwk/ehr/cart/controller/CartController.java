package com.pcwk.ehr.cart.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.pcwk.ehr.cart.domain.CartVO;
import com.pcwk.ehr.cart.service.CartService;
import com.pcwk.ehr.cmn.Message;
import com.pcwk.ehr.cmn.MessageVO;

@Controller("CartController")
@RequestMapping("cart")
public class CartController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired 
	CartService cartService;
	
	public CartController() {};
	
	@RequestMapping(value="/view.do")
	public String cartView(Model model)throws SQLException {
		System.out.println("=============================================");
		System.out.println("==cartcontroller=cartView====");
		System.out.println("=============================================");
		
		
		return "cart/cart";
	}
	
	
	//수정
	@RequestMapping(value = "/doUpdate.do",method=RequestMethod.POST
			,produces = "application/json;charset=UTF-8")
	@ResponseBody //비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.	
	public String doUpdate(CartVO inVO)throws SQLException{
		String jsonString="";
		LOG.debug("┌=============================┐");	
		LOG.debug("|inVO="+inVO);
		int flag = cartService.doUpdate(inVO);
		
		String message = "";//json으로 전달할 메시지
		if(1==flag) {
			message = inVO.getQuantity()+"수정 되었습니다.";
		}else {
			message = inVO.getQuantity()+"수정 실패";
		}
		
		Message messageVO=new Message(String.valueOf(flag), message);
		
		jsonString = new Gson().toJson(messageVO);
		
		LOG.debug("|jsonString="+jsonString);
		LOG.debug("└=============================┘");	
		
		return jsonString;
	}
	@RequestMapping(value = "/doSave.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSave(CartVO inVO)throws SQLException{
		String jsonString = "";
		LOG.debug("┌=============================┐");

		LOG.debug("|inVO=" + inVO);

		int flag = this.cartService.doSave(inVO);

		String message = "";
		if (1 == flag) {
			message = inVO.getCartNO() + "이 등록되었습니다.";
		} else {
			message = inVO.getCartNO() + "등록 실패!";
		}
		LOG.debug("|flag=" + flag);
		jsonString = new Gson().toJson(new Message(flag + "", message));
		LOG.debug("|jsonString=" + jsonString);
		
		return jsonString;
	}
	@RequestMapping(value = "/doDelete.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(HttpServletRequest req)throws SQLException{
		
		String jsonString = "";
		String cartNoString= (String)req.getParameter("cartString");
		LOG.debug("┌=============================┐");
		LOG.debug("|cartNoString=" + cartNoString);

		String[] cartNoArray =cartNoString.split(",");

		int flagCnt =0;
		
		for(String str : cartNoArray) {
			CartVO inVO = new CartVO();
			inVO.setCartNO(Integer.parseInt(str));
		
			flagCnt += cartService.doDelete(inVO);
		
		}
		
		MessageVO messageVO = new MessageVO(flagCnt+"","삭제되었습니다."); 
		
		jsonString =new Gson().toJson(messageVO);
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");

		return jsonString;
	}
	
	@RequestMapping(value = "/getAll.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
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
