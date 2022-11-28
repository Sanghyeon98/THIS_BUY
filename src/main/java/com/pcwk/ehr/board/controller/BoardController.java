package com.pcwk.ehr.board.controller;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.board.service.BoardServiceImpl;
import com.pcwk.ehr.cmn.Message;

//@Controller
public class BoardController {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	BoardServiceImpl boardServiceImpl;

	// 화면 파일
	final String VIEW_NAME = "board/board_mng";

	public BoardController() {
	}

	// 화면
	@RequestMapping(value = "/view.do")
	public String view() {
		LOG.debug("┌=============================┐");
		LOG.debug("│view=                        │");
		LOG.debug("└=============================┘");
		/*
		 * prefix = /WEB-INF/views/ user/user_mng ==> /WEB-INF/views/user/user_mng.jsp
		 * suffix = .jsp
		 */
		return VIEW_NAME;
	}
	
	@RequestMapping(value = "/board/do_delete.do", method =  RequestMethod.GET
			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(BoardVO question) throws SQLException {
		
		LOG.debug("=======================");
		LOG.debug("param : " + question);
		LOG.debug("=======================");
		
		int flag = this.boardServiceImpl.doDelete(question);
		
		String resultMsg = "";
		
		if(1 == flag) {
			resultMsg = question.getSeq() + "번의 1:1질의글이 \n삭제 성공했습니다.";
		}else {
			resultMsg = "1:1 질의 삭제 실패했습니다.";
		}
		
		Message message = new Message();
		message.setMsgId(flag + "");
		message.setMsgContents(resultMsg);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(message);
		
		LOG.debug("=======================");
		LOG.debug("jsonStr : " + jsonStr);
		LOG.debug("=======================");
		
		return jsonStr;
		
	}
	
	@RequestMapping(value="/doInsert.do", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	@ResponseBody //비동기 처리를 하는 경우 , HTTP 요청 부분의 body 부분이 그대로 브라우저에 전달된다.
	public String doInsert(BoardVO dto) throws SQLException{
		String jsonString = "" ;
		LOG.debug("┌=============================┐");
		LOG.debug("┌inVO:┐"+dto);
		int flag = boardServiceImpl.doInsert(dto);
		
		String message = ""; //json으로 전달할 메시지
		if(1==flag) {
			message = dto.getSeq()+"등록 되었습니다.";
		}else {
			message = dto.getSeq()+"등록 실패";
		}
		
		Message messageVO = new Message(String.valueOf(flag),message);
		
		jsonString = new Gson().toJson(messageVO);
		
		LOG.debug("│jsonString= "+jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}
}
