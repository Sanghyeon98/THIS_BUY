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

//@Controller
public class BoardController {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	BoardService boardService;

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
	
	@RequestMapping(value = "/doDelete.do", method = RequestMethod.GET
			,produces = "application/json;charset=UTF-8")
	public String doDelete(BoardVO inVO)throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");	
		LOG.debug("|inVO="+inVO);	
		
		int flag = boardService.doDelete(inVO);
		
		LOG.debug("|flag="+flag);
		
		String message = "";
		if(1==flag) {
			message = inVO.getTitle()+"가 삭제 되었습니다.";
		}else {
			message = inVO.getTitle()+" 삭제 실패!";
		}
		
		jsonString = new Gson().toJson(new Message(String.valueOf(flag),message));
		LOG.debug("|jsonString="+jsonString);
		LOG.debug("└=============================┘");	
		
		return jsonString;
	}
	
	
}
