package com.pcwk.ehr.member.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.google.gson.Gson;
import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.member.domain.MemberVO;
import com.pcwk.ehr.member.service.MemberService;

@Controller("adminmemberController")
@RequestMapping("admin")
public class adminmemberController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	MemberService  memberservice;
	
	
	final String VIEW_NAME = "member/admin_member";

	
	public adminmemberController() {}
	
	//login화면 보여 주기
	@RequestMapping(value="/member.do")
	public String loginView() {
		LOG.debug("┌=============================┐");
		LOG.debug("|view=                        |");
		LOG.debug("└=============================┘");
		return VIEW_NAME;		
	}
	
	
		
	@RequestMapping(value = "/doRetrieve.do",method=RequestMethod.GET
			,produces = "application/json;charset=UTF-8")
	@ResponseBody //비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.	
	public String doRetrive(SearchVO inVO)throws SQLException{
		String jsonString = "";
		// 페이지 사이즈(default =10)
		if( 0==inVO.getPageSize()) {
			inVO.setPageSize(10);
		}
		
		//페이지 번호(default =1)
		if( 0==inVO.getPageNo()) {
			inVO.setPageNo(1);
		}
		
		//검색구분(default ="")
		if(null == inVO.getSearchDiv()) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv()));
		}
		
		// 검색어(default ="")
		if(null == inVO.getSearchWord()) {
			inVO.setSearchWord(StringUtil.nvl(inVO.getSearchWord()));
		}
		
		LOG.debug("┌=============================┐");	
		LOG.debug("|inVO="+inVO);
		
		List<MemberVO> list = memberservice.doRetrieve(inVO);
		
		jsonString=new Gson().toJson(list);
		
		LOG.debug("|jsonString="+jsonString);
		LOG.debug("└=============================┘");	
		
		return jsonString;
	}
	@RequestMapping(value = "/doSelectOne.do",method=RequestMethod.GET
			,produces = "application/json;charset=UTF-8")
	@ResponseBody //비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.	
	public String doSelectOne(MemberVO inVO)throws SQLException{
		String jsonString = "";
		LOG.debug("┌=============================┐");	
		LOG.debug("|inVO="+inVO);		
		
		MemberVO outVO = memberservice.doSelectOne(inVO);
		
		jsonString = new Gson().toJson(outVO);
		LOG.debug("|jsonString="+jsonString);
		LOG.debug("└=============================┘");		
		return jsonString;
	}
	// 상품 삭제 처리
		@RequestMapping(value = "/upDeleteAll.do", method = RequestMethod.GET,
				produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String upDeleteAll(HttpServletRequest req) throws SQLException {
			String jsonString = "";
			
			String memberidStr = req.getParameter("memberid");
			LOG.debug("┌--------------------------------┐");	
			LOG.debug("|  memberidStr = " + memberidStr);
			
			List<MemberVO> list = new ArrayList<MemberVO>();
			
			// 다건 삭제
			if(memberidStr.indexOf(",") != -1) {
				String[] memberArray = memberidStr.split(",");
				
				for(String memberid : memberArray) {
					MemberVO tmpVO = new MemberVO();
					tmpVO.setMemberid(memberidStr);
					
					list.add(tmpVO);
				}
			} else {  // 한건 삭제
				MemberVO tmpVO = new MemberVO();
				tmpVO.setMemberid(memberidStr);
				
				list.add(tmpVO);
			}
			
			int delCnt = memberservice.upDeleteAll(list);
			
			String msg = "";
			if(0 == delCnt) {
				msg = "제품 삭제에 실패했습니다.";
			} else {
				msg = memberidStr + "제품 삭제 성공!";
			}
			
			jsonString = new Gson().toJson(new MessageVO(String.valueOf(delCnt), msg));
			
			return jsonString;
		}
}
