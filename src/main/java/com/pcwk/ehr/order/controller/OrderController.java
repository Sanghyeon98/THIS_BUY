package com.pcwk.ehr.order.controller;


import java.sql.SQLException;
import java.util.ArrayList;
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
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.Message;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.code.domain.CodeVO;
import com.pcwk.ehr.code.service.CodeService;
import com.pcwk.ehr.order.domain.OrderSearchVO;
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
	
		
	// 주문내역
	@RequestMapping(value= "/orderView.do")
	public String orderView(Model model,OrderSearchVO inVO) throws SQLException{
		String VIEW_NAME = "mypage/mypage_product_list";
		
		// 페이지 번호
		if(null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}
		
		//페이지 사이즈
		if(null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		
		List<OrderVO> list = orderService.doRetrieve(inVO);
		
		// code목록 조회
		List<String> codeList = new ArrayList<String>();
		codeList.add("PAGE_SIZE");
		codeList.add("ORDER_SEARCH");

		List<CodeVO> outCodeList = codeService.doRetrieve(codeList);
		//검색조건
		List<CodeVO> searchList = new ArrayList<CodeVO>();
		
		//페이지사이즈
		List<CodeVO> pageSizeList = new ArrayList<CodeVO>();
		for(CodeVO vo : outCodeList) {
			if(vo.getMstCode().equals("PAGE_SIZE") == true) {
				pageSizeList.add(vo);
			}
			if(vo.getMstCode().equals("ORDER_SEARCH") == true) {
				searchList.add(vo);
			}
		}
		int totalCnt = 0;// 총글수
		double pageTotal = 0;// 총페이지수
		
		if(null != list && list.size() > 0) {
			totalCnt = list.get(0).getTotalCnt();
			
			pageTotal = Math.ceil((totalCnt / (inVO.getPageSize() * 1.0)));
			LOG.debug("Math.ceil=" + (totalCnt /(inVO.getPageSize() * 1.0)));
			LOG.debug("totalCnt=" + totalCnt);
			LOG.debug("|pageTotal=" + pageTotal);
			LOG.debug("|PageSize=" + inVO.getPageSize());

		}
		LOG.debug("|outCodeList=" + outCodeList);
		model.addAttribute("list", list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageTotal", (int) pageTotal);

		model.addAttribute("PAGE_SIZE", pageSizeList);
		model.addAttribute("BOARD_SEARCH", searchList);
		return VIEW_NAME;
	}
	
	
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
	/**
	 * 검색
	 * 
	 * @param inVO
	 * @param model
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doSelectOne.do", method = RequestMethod.GET)
	public String doSelectOne(OrderVO inVO, Model model) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		LOG.debug("└=============================┘");

		OrderVO outVO = orderService.doSelectOne(inVO);

		jsonString = new Gson().toJson(outVO);
		LOG.debug("┌=============================┐");
		LOG.debug("|outVO=" + outVO);
		model.addAttribute("vo", outVO);
		LOG.debug("└=============================┘");

		return jsonString;
	}
	
	/**
	 * 삭제
	 * 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doDelete.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(OrderVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		int flag = orderService.doDelete(inVO);

		LOG.debug("|flag=" + flag);

		String message = "";
		if (1 == flag) {
			message = "삭제 되었습니다.";
		} else {
			message = "삭제 실패!";
		}

		jsonString = new Gson().toJson(new Message(String.valueOf(flag), message));
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");

		return jsonString;
	
	}
	/**
	 * 추가
	 * 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doSave.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSave(OrderVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");

		LOG.debug("|inVO=" + inVO);

		int flag = this.orderService.doSave(inVO);

		String message = "";
		if (1 == flag) {
			message = inVO.getItemNO() + "이 등록되었습니다.";
		} else {
			message = inVO.getItemNO() + "등록 실패!";
		}
		LOG.debug("|flag=" + flag);
		jsonString = new Gson().toJson(new Message(flag + "", message));
		LOG.debug("|jsonString=" + jsonString);

		return jsonString;
	}
}
