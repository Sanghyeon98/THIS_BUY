package com.pcwk.ehr.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.member.domain.MemberVO;
import com.pcwk.ehr.member.service.MemberService;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Balance;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.model.StorageType;
import net.nurigo.sdk.message.request.MessageListRequest;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.MessageListResponse;
import net.nurigo.sdk.message.response.MultipleDetailMessageSentResponse;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;


@Controller("signupController")
@RequestMapping("signup")
public class SignupController {

	final Logger LOG = LogManager.getLogger(getClass());
	
	final DefaultMessageService messageService;

	@Autowired
	MemberService memberService;
	@Autowired
	private SendService mailService;
	private int authNumber1; 
	public void makeRandomNumber1() {
		// 난수의 범위 1111 ~ 9999 (4자리 난수)
		Random r = new Random();
		int checkNum1 = r.nextInt(8888) + 1111;
		System.out.println("인증번호 : " + checkNum1);
		authNumber1 = checkNum1;
	}
	
	final String VIEW_NAME = "member";

	public SignupController() {
		this.messageService = NurigoApp.INSTANCE.initialize("NCSJ9GCNZVQLQVPM", "SGVQVNWGTK4PDKXGQGQ6G44OCZNIALH0", "https://api.coolsms.co.kr");
	}

	// 화면
	@RequestMapping(value = "/signup.do")
	public String singup() {
		LOG.debug("┌=============================┐");
		LOG.debug("|signup=                      |");
		LOG.debug("└=============================┘");

		return VIEW_NAME+"/signup";
		
	}
	@RequestMapping(value = "/iframe.do")
	public String iframe() {
		LOG.debug("┌=============================┐");
		LOG.debug("|iframe=                      |");
		LOG.debug("└=============================┘");

		return "member_popup/iframe";
		
	}
	@RequestMapping(value = "/signup_address.do")
	public String singup_adress() {
		LOG.debug("┌=============================┐");
		LOG.debug("|signup=                      |");
		LOG.debug("└=============================┘");

		return "member_popup/signup_address";
	}
	@RequestMapping(value = "phonech.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody 
    public String sendOne(String phone) {
        Message message = new Message();
        makeRandomNumber1();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01028009441");
        message.setTo(phone);
        message.setText("[" + authNumber1 + "] This_buy 인증 번호를 입력해주세요.");

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);
        System.out.println(authNumber1);

        return Integer.toString(authNumber1);
    }

	
	@RequestMapping(value = "mailCheck.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String mailCheck(String email) throws MessagingException {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
	
		
		return mailService.joinEmail(email);
	}
	
	@RequestMapping(value = "upDeleteAll.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String upDeleteAll(HttpServletRequest req) throws SQLException {
		String jsonString = "";
		String memberidStr = req.getParameter("memberid");
		LOG.debug("┌=============================┐");
		LOG.debug("|memberid=" + memberidStr);
		List<MemberVO> list = new ArrayList<MemberVO>();

		// 다건
		if (memberidStr.indexOf(",") != -1) {
			String[] userArray = memberidStr.split(",");
			for (String memberid : userArray) {
				MemberVO tmpVO = new MemberVO();
				tmpVO.setMemberid(memberid);

				list.add(tmpVO);
			}
			// 한건
		} else {
			MemberVO tmpVO = new MemberVO();
			tmpVO.setMemberid(memberidStr);

			list.add(tmpVO);
		}

		int delCnt = this.memberService.upDeleteAll(list);

		String message = "";
		if (0 == delCnt) {
			message = "삭제 실패!";
		} else {
			message = memberidStr + "가 삭제 되었습니다.";
		}

		jsonString = new Gson().toJson(new MessageVO(String.valueOf(delCnt), message));
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");

		return jsonString;
	}

	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String idCheck(MemberVO inVO) throws SQLException {
		String jsonString = "";

		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		int cnt = memberService.idCheck(inVO);
		LOG.debug("|cnt=" + cnt);

		String message = "";
		if (1 == cnt) {
			message = inVO.getMemberid() + "는 이미 존재하는 ID 입니다.";
		} else {
			message = inVO.getMemberid() + "는 사용 가능합니다.";
		}

		jsonString = new Gson().toJson(new MessageVO(String.valueOf(cnt), message));
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");

		return jsonString;
	}
	


	@RequestMapping(value = "/doRetrieve.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doRetrieve(SearchVO inVO) throws SQLException {
		String jsonString = "";
		// 페이지 사이즈(default =10)
		if (0 == inVO.getPageSize()) {
			inVO.setPageSize(10);
		}

		// 페이지 번호(default =1)
		if (0 == inVO.getPageNo()) {
			inVO.setPageNo(1);
		}

		// 검색구분(default ="")
		if (null == inVO.getSearchDiv()) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv()));
		}

		// 검색어(default ="")
		if (null == inVO.getSearchWord()) {
			inVO.setSearchWord(StringUtil.nvl(inVO.getSearchWord()));
		}

		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		List<MemberVO> list = memberService.doRetrieve(inVO);

		jsonString = new Gson().toJson(list);
		/*
		 * JSON 값
		 * 
		 * 문자열 (string) { "site":"cafe" } 숫자 (number) { "year":2022} 객체 (object)
		 * {"UserVO":{"msgId":"1","msgContents":"p99_01수정 되었습니다.","totalCnt":0,"num":0}}
		 * 배열 (array) 참거짓 (boolean) { "member":true } 널 (null) { "point":null }
		 */
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");

		return jsonString;
	}

	@RequestMapping(value = "/doUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doUpdate(MemberVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		int flag = memberService.doUpdate(inVO);

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

	@RequestMapping(value = "/doSelectOne.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doSelectOne(MemberVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		MemberVO outVO = memberService.doSelectOne(inVO);

		jsonString = new Gson().toJson(outVO);
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String add(MemberVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		int flag = memberService.add(inVO);

		String message = "";// json으로 전달할 메시지
		if (1 == flag) {
			message = inVO.getMemberid() + "등록 되었습니다.";
		} else {
			message = inVO.getMemberid() + "등록 실패";
		}

		MessageVO messageVO = new MessageVO(String.valueOf(flag), message);

		jsonString = new Gson().toJson(messageVO);

		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}

	//
	@RequestMapping(value = "/doDelete.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(HttpServletRequest req, MemberVO inVO) throws SQLException {
		String jsonString = "";

		LOG.debug("┌=============================┐");

		String memberid = req.getParameter("memberid");
		LOG.debug("|memberid=" + memberid);

		// Command객체
		//
		LOG.debug("|inVO=" + inVO);
		MemberVO inpuVO = new MemberVO();
		inpuVO.setMemberid(memberid);

		LOG.debug("|inpuVO=" + inpuVO);

		int flag = memberService.doDelete(inpuVO);

		LOG.debug("|flag=" + flag);

		String message = "";
		if (1 == flag) {
			message = inpuVO.getMemberid() + "가 삭제 되었습니다.";
		} else {
			message = inpuVO.getMemberid() + " 삭제 실패!";
		}

		MessageVO messageVO = new MessageVO(String.valueOf(flag), message);

		jsonString = new Gson().toJson(messageVO);

		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}
	

}