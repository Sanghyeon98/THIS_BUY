package com.pcwk.ehr.answer.controller;

import java.awt.PageAttributes.MediaType;
import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.answer.domain.AnswerVO;
import com.pcwk.ehr.answer.service.AnswerService;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.Message;


@Controller("answerController")
@RequestMapping("answer")
public class AnswerController {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	AnswerService answerService;

	public AnswerController() {}
	

	@RequestMapping(value = "/answerView.do", method = RequestMethod.GET)
	public String view01(Model model,@RequestParam(value = "seq", required = false)String seq) throws Exception {
		LOG.debug("=================");
		LOG.debug("=answer view=");
		LOG.debug("=================");
		
		model.addAttribute("seq", seq);
		return "answer/answer_reg";
	}


	/**
	 * 답변 전체 목록 조회
	 * 
	 * @param dto
	 * @return JSON(Item)
	 * @throws RuntimeException
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/get_all.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getAllList() throws SQLException {
		List<AnswerVO> list = (List<AnswerVO>) answerService.getAllList();

		for (AnswerVO vo : list) {
			LOG.debug(vo.toString());
		}

		// list to json
		Gson gson = new Gson();
		String jsonList = gson.toJson(list);

		LOG.debug("jsonList:" + jsonList);

		return jsonList;

	}

	/**
	 * 전체조회
	 * 
	 * @param dto
	 * @return JSON(Item)
	 * @throws RuntimeException
	 * @throws SQLException
	 */
	@RequestMapping(value = "selectOne.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSelectOne(AnswerVO answer) throws SQLException {
		List<AnswerVO> list = (List<AnswerVO>) answerService.doSelectOne(answer);

		for (AnswerVO vo : list) {
			LOG.debug(vo.toString());
		}

		// list to json
		Gson gson = new Gson();
		String jsonList = gson.toJson(list);

		LOG.debug("jsonList:" + jsonList);

		return jsonList;
	}
	
	
	/**
	 * 
	 *  문의 별 답변 조회
	 * 
	 * @param inVO
	 * @param model
	 * @return "board/board_mod"
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doSelectAnswer.do", method = RequestMethod.GET)
	public String doSelectOne(AnswerVO inVO, Model model) throws SQLException {
		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│inVO = "+inVO);
		LOG.debug("└──────────────────────────────┘");


		AnswerVO outVO = answerService.doSelectAnswer(inVO);
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│outVO = "+outVO);
		String message = "";
		
		model.addAttribute("vo", outVO);
		
		LOG.debug("└──────────────────────────────┘");
		
		
		return "answer/answer_mod";
	}
	
  
	
	
	/**
	 * 답변 수정
	 * @param dto
	 * @return JSON(1:성공,0:실패)
	 * @throws RuntimeException
	 * @throws SQLException 
	 */     
	@RequestMapping(value = "/Update.do",method = RequestMethod.GET
			,produces = "application/json;charset=UTF-8")
	@ResponseBody       
	public String doUpdate(AnswerVO answer) throws SQLException {
		LOG.debug("param:"+answer);
		
		int flag = answerService.doUpdate(answer);
		String resultMsg = "";
		if(1 == flag) {
			resultMsg = "답변이 수정되었습니다.";
		}else {
			resultMsg = "답변 수정에 실패했습니다";
		}
		
		Message message=new Message();
		message.setMsgId(flag+"");
		message.setMsgContents(resultMsg);
		
		Gson  gson=new Gson();
		String jsonStr = gson.toJson(message);
		LOG.debug("jsonStr:"+jsonStr);
		
		return jsonStr;
	}

	/**
	 * 답변 삭제
	 * 
	 * @param user
	 * @return JSON(1:성공. 0:실패)
	 * @throws SQLException
	 */
	@RequestMapping(value = "/Delete.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(AnswerVO answer) throws SQLException {
		LOG.debug("param:" + answer);

		int flag = answerService.doDelete(answer);
		String resultMsg = "";

		if (1 == flag) {
			resultMsg = "답변을 삭제하였습니다.";
		} else {
			resultMsg = "답변 삭제에 실패하셨습니다.";
		}

		Message message = new Message();
		message.setMsgId(flag + "");
		message.setMsgContents(resultMsg);

		Gson gson = new Gson();
		String jsonStr = gson.toJson(message);
		LOG.debug("jsonStr:" + jsonStr);

		return jsonStr;
	}

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
