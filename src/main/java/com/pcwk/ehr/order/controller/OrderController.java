package com.pcwk.ehr.order.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.Message;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.code.domain.CodeVO;
import com.pcwk.ehr.code.service.CodeService;
import com.pcwk.ehr.member.domain.MemberVO;
import com.pcwk.ehr.member.service.MemberService;
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
	CodeService codeService;

	@Autowired
	MemberService memberService;

	public OrderController() {
	}

	@RequestMapping(value = "/memberSelectOne.do", method = RequestMethod.GET,
	        produces = "application/json;charset=UTF-8")
@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
public String memberSelectOne(MemberVO inVO ,Model model) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		LOG.debug("└=============================┘");

		MemberVO outVO = memberService.doSelectOne(inVO);

		jsonString = new Gson().toJson(outVO);
		LOG.debug("┌=============================┐");
		LOG.debug("|outVO=" + outVO);
		model.addAttribute("Membervo", outVO);
		LOG.debug("└=============================┘");

		return jsonString; 
	}
	
	
	// 주문내역
	@RequestMapping(value = "/doRetrieve.do", method = RequestMethod.POST,
			        produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String orderList(OrderSearchVO inVO) throws SQLException {
		String jsonString = "";

		// 주문내역 Default값 설정

		// 페이지 번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// 페이지사이즈
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}

		// 검색구분
		if (null != inVO && null == inVO.getSearchDiv()) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv()));
		}

		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		List<OrderVO> list = orderService.doRetrieve(inVO);

		jsonString = new Gson().toJson(list);
		LOG.debug("|jsonString=" + jsonString);
		return jsonString;
	}

	// 상품내역
	@RequestMapping(value = "/orderView.do")
	public String orderView(Model model, OrderSearchVO inVO, HttpSession session) throws SQLException {
		String VIEW_NAME = "order/mypage_product_list";
		
		MemberVO memberSession = (MemberVO) session.getAttribute("memberInfo");
		String memberId = memberSession.getMemberid();
		
		inVO.setMemberId(memberId);

		// 페이지 번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// 페이지 사이즈
		if (null != inVO && inVO.getPageSize() == 0) {
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
		// 검색조건
		List<CodeVO> searchList = new ArrayList<CodeVO>();

		// 페이지사이즈
		List<CodeVO> pageSizeList = new ArrayList<CodeVO>();
		for (CodeVO vo : outCodeList) {
			if (vo.getMstCode().equals("PAGE_SIZE") == true) {
				pageSizeList.add(vo);
			}
			if (vo.getMstCode().equals("ORDER_SEARCH") == true) {
				searchList.add(vo);
			}
		}
		int totalCnt = 0;// 총글수
		double pageTotal = 0;// 총페이지수

		if (null != list && list.size() > 0) {
			totalCnt = list.get(0).getTotalCnt();

			pageTotal = Math.ceil((totalCnt / (inVO.getPageSize() * 1.0)));
			LOG.debug("Math.ceil=" + (totalCnt / (inVO.getPageSize() * 1.0)));
			LOG.debug("totalCnt=" + totalCnt);
			LOG.debug("|pageTotal=" + pageTotal);
			LOG.debug("|PageSize=" + inVO.getPageSize());

		}
		LOG.debug("|outCodeList=" + outCodeList);
		model.addAttribute("list", list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageTotal", (int) pageTotal);

		model.addAttribute("PAGE_SIZE", pageSizeList);
		model.addAttribute("ORDER_SEARCH", searchList);
		return VIEW_NAME;
	}

	/**
	 * 업데이트
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doUpdate.do", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doUpdate(OrderVO inVO) throws SQLException {
		LOG.debug("┌=============================┐");
		LOG.debug("│=doRetrieve()=");
		LOG.debug("│inVO:" + inVO);
		LOG.debug("└=============================┘");
		List<OrderVO> list = (List<OrderVO>) orderService.doRetrieve(inVO);
		for (OrderVO vo : list) {
			LOG.debug(vo.toString());
		}

		String jsonList = new Gson().toJson(list);

		return jsonList;

	}

	/**
	 * 개인정보수정화면으로 이동
	 * 
	 * @param meodel
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/moveToLogin.do", method = RequestMethod.GET)
	public String moveToLogin(Model model, SearchVO inVO) throws SQLException {
		String VIEW_NAME = "order/mypage_private_login";
		LOG.debug("┌=============================┐");	
		LOG.debug("|inVO="+inVO);		
		LOG.debug("|VIEW_NAME="+VIEW_NAME);		
		
		//code목록 조회
		List<String>  codeList=new ArrayList<String>();
		
		codeList.add("ORDER_DIV");
		
		List<CodeVO> outCodeList = codeService.doRetrieve(codeList);
		
		LOG.debug("|outCodeList="+outCodeList);		
		LOG.debug("└=============================┘");	
		
		model.addAttribute("ORDER_DIV", outCodeList);
		model.addAttribute("vo", inVO);
		return VIEW_NAME;
	}
//
//	@RequestMapping(value = "/doLogin.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public String doLogin(MemberVO inVO, HttpSession session) throws SQLException {
//		String jsonString = "";
//		MemberService memberService;
//		LOG.debug("┌=============================┐");
//		LOG.debug("|param=" + inVO);
//
//		// 10: id가 존재하지 않습니다.
//		// 20: 비번을 확인 하세요.
//		// 30: 로그인 되었습니다.
//
//		// 40: ID 화면입력 체크
//		// 50: 비번 화면입력 체크
//		MessageVO outMessage = new MessageVO();
//
//		if (null == inVO.getPasswd() || "".equals(inVO.getPasswd())) {
//			outMessage.setMsgId("50");
//			outMessage.setMsgContents("비번을 입력 하세요.");
//
//			return new Gson().toJson(outMessage);
//		}
//
//		int loginStatus = memberService.idPassCheck(inVO);
//
//		String message = "";
//
//		if (10 == loginStatus) {
//			message = inVO.getMemberid() + "가 존재하지 않습니다.";
//		} else if (20 == loginStatus) {
//			message = inVO.getMemberid() + "의 비번을 확인 하세요.";
//		} else if (30 == loginStatus) {
//			message = inVO.getMemberid() + "가 로그인 되었습니다.";
//			// ------------------------------------------------
//			// 로그인 정보 조회
//			// -----------------------------------------------
//			MemberVO loginInfo = memberService.doSelectOne(inVO);
//			// 접속자 수가 적은 경우(내부사이트)
//			if (null != loginInfo) {
//				session.setAttribute("memberInfo", loginInfo);
//			}
//
//		} else {
//			message = "알수없는 오류!";
//		}
//
//		outMessage.setMsgId(String.valueOf(loginStatus));
//		outMessage.setMsgContents(message);
//
//		jsonString = new Gson().toJson(outMessage);
//		LOG.debug("|jsonString=" + jsonString);
//		LOG.debug("└=============================┘");
//		return jsonString;
//	}

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
