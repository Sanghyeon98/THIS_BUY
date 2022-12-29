package com.pcwk.ehr.member.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.member.domain.MemberVO;
import com.pcwk.ehr.member.service.MemberService;

@Controller("MupdateController")
@RequestMapping("memberupdate")
public class MupdateController {

	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	MemberService memberservice;
	
	
	
	final String VIEW_NAME = "member/memberCheck";

	public MupdateController() {
	}

	// 화면
	@RequestMapping(value = "/memberCheck.do")
	public String memberCheck() {
		LOG.debug("┌=============================┐");
		LOG.debug("|memberCheck=                 |");
		LOG.debug("└=============================┘");

		return "member/memberCheck";
	}
	
	@RequestMapping(value = "/pwUpdate.do")
	public String pwUpdate() {
		LOG.debug("┌=============================┐");
		LOG.debug("|pwUpdate=                 |");
		LOG.debug("└=============================┘");

		return "member/pwUpdate";
	}
	
	@RequestMapping(value = "/memberupdate.do")
	public String memberupdate() {
		LOG.debug("┌=============================┐");
		LOG.debug("|memberCheck=                 |");
		LOG.debug("└=============================┘");

		return "member/memberupdate";
	}

	@RequestMapping(value = "/doUpdate.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doUpdate(MemberVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		int flag = memberservice.doUpdate(inVO);

		String message = "";// json으로 전달할 메시지
		if (1 == flag) {
			message = inVO.getMemberid() + "수정 되었습니다.";
		} else {
			message = inVO.getMemberid() + "수정 실패";
		}

		MessageVO messageVO = new MessageVO(String.valueOf(flag), message);

		jsonString = new Gson().toJson(messageVO);

		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}
	
	@RequestMapping(value = "/pwUpdate.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String pwUpdate(MemberVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		int flag = memberservice.pwUpdate(inVO);

		String message = "";// json으로 전달할 메시지
		if (1 == flag) {
			message =  "비밀 번호가 수정 되었습니다.";
		} else {
			message ="수정 실패";
		}

		MessageVO messageVO = new MessageVO(String.valueOf(flag), message);

		jsonString = new Gson().toJson(messageVO);

		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}

	@RequestMapping(value = "/doSelectOne.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doSelectOne(MemberVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		MemberVO outVO = memberservice.doSelectOne(inVO);

		jsonString = new Gson().toJson(outVO);
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
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
				
				//------------------------------------------------
				//로그인 정보 조회
				//-----------------------------------------------
				MemberVO loginInfo1 = memberservice.doSelectOne(inVO);
				//접속자 수가 적은 경우(내부사이트)
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