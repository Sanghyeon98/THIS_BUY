package com.pcwk.ehr.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.member.domain.MemberVO;
import com.pcwk.ehr.member.service.MemberService;

@Controller("loginController")
@RequestMapping("login")
public class LoginController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	MemberService  memberservice;
	
	
	final String VIEW_NAME = "member/login";

	
	public LoginController() {}
	
	//login화면 보여 주기
	@RequestMapping(value="/login.do")
	public String loginView() {
		LOG.debug("┌=============================┐");
		LOG.debug("|view=                        |");
		LOG.debug("└=============================┘");
		return VIEW_NAME;		
	}
	
	@RequestMapping(value="/doLogout.do")
	public String doLogout(HttpSession session) {
		LOG.debug("┌=============================┐");
		LOG.debug("|doLogout=                    |");
		LOG.debug("└=============================┘");
		
		if(null != session.getAttribute("memberInfo") ) {
			session.removeAttribute("memberInfo");
			session.invalidate();
			LOG.debug("|session.invalidate()     |");
		}
		return VIEW_NAME;		
	}
	
	
	@RequestMapping(value="/doLogin.do",  method = RequestMethod.POST
			,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doLogin(MemberVO inVO, HttpSession session)throws SQLException{
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|param="+inVO);
		
		//10: id가 존재하지 않습니다.
		//20: 비번을 확인 하세요.
		//30: 로그인 되었습니다.
		
		//40: ID 화면입력 체크 
		//50: 비번 화면입력 체크
		MessageVO  outMessage = new MessageVO();
		
		if(null == inVO.getMemberid()|| "".equals(inVO.getMemberid())) {
			outMessage.setMsgId("40");
			outMessage.setMsgContents("ID를 입력 하세요.");
			
			return new Gson().toJson(outMessage);
		}
		
		if(null == inVO.getPasswd()|| "".equals(inVO.getPasswd())) {
			outMessage.setMsgId("50");
			outMessage.setMsgContents("비번을 입력 하세요.");
			
			return new Gson().toJson(outMessage);
		}
		
		
		int loginStatus = memberservice.idPassCheck(inVO);
		
		
		String     message = "";
		if(10 == loginStatus) {
			message = inVO.getMemberid()+"가 존재하지 않습니다.";
		}else if(20 == loginStatus) {
			message = inVO.getMemberid()+"의 비번을 확인 하세요.";
		}else if(30 == loginStatus) {
			message = inVO.getMemberid()+"가 로그인 되었습니다.";
			//------------------------------------------------
			//로그인 정보 조회
			//-----------------------------------------------
			MemberVO loginInfo = memberservice.doSelectOne(inVO);
			//접속자 수가 적은 경우(내부사이트)
			if(null !=loginInfo) {
				session.setAttribute("memberInfo", loginInfo);
			}
			}else if(60 == loginStatus) {
				message = "관리자"+inVO.getMemberid()+"가 로그인 되었습니다.";
				//------------------------------------------------
				//로그인 정보 조회
				//-----------------------------------------------
				MemberVO loginInfo1 = memberservice.doSelectOne(inVO);
				if(null !=loginInfo1) {
					session.setAttribute("memberInfo", loginInfo1);
				}
			
			
		}else {
			message = "알수없는 오류!";
		}
		
		outMessage.setMsgId(String.valueOf(loginStatus));
		outMessage.setMsgContents(message);
		
		jsonString = new Gson().toJson(outMessage);
		LOG.debug("|jsonString="+jsonString);
		LOG.debug("└=============================┘");		
		return jsonString;
	}
	
	
	
}
	
