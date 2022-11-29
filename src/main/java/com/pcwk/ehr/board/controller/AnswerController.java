package com.pcwk.ehr.board.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.board.domain.AnswerVO;
import com.pcwk.ehr.board.service.AnswerService;
import com.pcwk.ehr.cmn.Message;

@RequestMapping("answer")
public class AnswerController {
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	AnswerService answerService;
	
	//화면 파일
	final String VIEW_NAME = "answer/answer_mng";

	public AnswerController() {}

	@RequestMapping(value = "/answer_view.do", method = RequestMethod.GET)
	public String view01(Model model,@RequestParam(value = "questionNo", required = false)String questionNo) throws Exception {
		LOG.debug("=================");
		LOG.debug("=answer view=");
		LOG.debug("=================");
		
		model.addAttribute("questionNo", questionNo);
		return "answer/answer";
	}
	
	@RequestMapping(value = "/answer_moview.do",  method = RequestMethod.GET)
	public String view02(Model model, @RequestParam(value = "answerNo", required = false)String answerNo) throws Exception {
		LOG.debug("=================");
		LOG.debug("=answer view=");
		LOG.debug("=================");
		
		model.addAttribute("answerNo", answerNo);
		return "answer/answer_mod";
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
	 * 문의 별 답변 조회
	 * 
	 * @param dto
	 * @return JSON(Item)
	 * @throws RuntimeException
	 * @throws SQLException
	 */
	@RequestMapping(value = "/do_selectone.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
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
	
   
	@RequestMapping(value = "/do_selectans.do",method = RequestMethod.GET
			,produces = "application/json;charset=UTF-8")
	@ResponseBody	
	public String doSelectAnswer(AnswerVO answer) throws SQLException {
		LOG.debug("param:"+answer);
		
		AnswerVO outVO = (AnswerVO) answerService.doSelectAnswer(answer);
		
		LOG.debug("outVO:"+outVO);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(outVO);
		LOG.debug("jsonStr:"+jsonStr);
		
		return jsonStr;
	}
	
	
	/**
	 * 답변 수정
	 * @param dto
	 * @return JSON(1:성공,0:실패)
	 * @throws RuntimeException
	 * @throws SQLException 
	 */     
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/do_update.do",method = RequestMethod.POST
			,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
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
	@RequestMapping(value = "/do_delete.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
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
	 * 답변 등록
	 * 
	 * @param dto
	 * @return JSON(1:성공. 0:실패)
	 * @throws RuntimeException
	 * @throws SQLException
	 */
	@RequestMapping(value = "/do_insert.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doInsert(AnswerVO answer) throws SQLException {
		LOG.debug("param:" + answer);

		int flag = answerService.doInsert(answer);
		String resultMsg = "";

		if (1 == flag) {
			resultMsg = answer.getRegId() + "님 답변이 등록되었습니다.";
		} else {
			resultMsg = "답변 등록에 실패하셨습니다.";
		}

		Message message = new Message();
		message.setMsgId(flag + "");
		message.setMsgContents(resultMsg);

		Gson gson = new Gson();
		String jsonStr = gson.toJson(message);
		LOG.debug("jsonStr:" + jsonStr);

		return jsonStr;
	}
}
