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
import com.pcwk.ehr.board.service.BoardService;
import com.pcwk.ehr.cmn.Message;


@Controller("userController")
@RequestMapping("board")
public class BoardController {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	BoardService boardService;

	// 화면 파일
	final String VIEW_NAME = "board/board_mng";

	public BoardController() {
	}

	// 화면
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/question/do_delete.do", method =  RequestMethod.GET
			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(BoardVO question) throws SQLException {
		
		LOG.debug("=======================");
		LOG.debug("param : " + question);
		LOG.debug("=======================");
		
		int flag = this.boardService.doDelete(question);
		
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
}
