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
import com.pcwk.ehr.board.domain.AnswerVO;
import com.pcwk.ehr.board.service.AnswerService;
import com.pcwk.ehr.cmn.Message;


@Controller("answerController")
@RequestMapping("answer")
public class AnswerController {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	AnswerService answerService;

	public AnswerController() {}
	
	/**
	 * 답변등록
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doInsert.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doInsert(AnswerVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");

		LOG.debug("|inVO=" + inVO);

		int flag = answerService.doInsert(inVO);

		String message = "";
		if (1 == flag) {
			message = inVO.getTitle() + "이 등록되었습니다.";
		} else {
			message = inVO.getTitle() + "등록 실패!";
		}
		LOG.debug("|flag=" + flag);
		jsonString = new Gson().toJson(new Message(flag + "", message));
		LOG.debug("|jsonString=" + jsonString);

		return jsonString;
	}
	
}
