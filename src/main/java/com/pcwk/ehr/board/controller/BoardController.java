package com.pcwk.ehr.board.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.board.domain.BoardSearchVO;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.board.service.BoardService;
import com.pcwk.ehr.cmn.Message;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;

@Controller("boardController")
@RequestMapping("board")
public class BoardController {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	BoardService boardService;

	public BoardController() {
	}

	// board화면 보여주기
	@RequestMapping(value = "/boardView.do")
	public String boardView(Model model, BoardVO inVO) throws SQLException {
		String VIEW_NAME = "board/board_list";

		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│boardView ");
		LOG.debug("└──────────────────────────────┘");
		List<BoardVO> list = boardService.getALL(inVO);

		model.addAttribute("list", list);
		return VIEW_NAME;
	}

//	// 등록화면보여주기
//	@RequestMapping(value = "/questionView.do")
//	public String questionView(Model model, BoardVO inVO) throws SQLException {
//		String VIEW_NAME = "board/board_question";
//		LOG.debug("┌──────────────────────────────┐");
//		LOG.debug("│boardView ");
//		LOG.debug("└──────────────────────────────┘");
//		List<BoardVO> list = boardService.getALL(inVO);
//
//		model.addAttribute("list", list);
//		return VIEW_NAME;
//	}

	
	// board화면 등록화면보여주기
	@RequestMapping(value = "/questionReg.do",method = RequestMethod.GET)
	public String questionReg(Model model, BoardVO inVO) throws SQLException {
		String VIEW_NAME = "board/question_reg";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│boardView ");
		LOG.debug("└──────────────────────────────┘");

		return VIEW_NAME;
	}
	
	// board화면 등록화면보여주기
		@RequestMapping(value = "/boardReg.do",method = RequestMethod.GET)
		public String boardReg(Model model, BoardVO inVO) throws SQLException {
			String VIEW_NAME = "board/board_reg";
			LOG.debug("┌──────────────────────────────┐");
			LOG.debug("│boardView ");
			LOG.debug("└──────────────────────────────┘");

			return VIEW_NAME;
		}

	/**
	 * 목록조회
	 * 
	 * @param inVO
	 * @return JSON(String)
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doRetrive.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doRetrive(BoardSearchVO inVO) throws SQLException {
		String jsonString = "";

		// 페이지 번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// 페이지사이즈
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}

		// 10번 공지, 20번 자유게시판
		if (null != inVO && null == inVO.getGubun()) {
			inVO.setGubun(StringUtil.nvl(inVO.getGubun(), "10"));
		}
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│inVO = " + inVO);

		List<BoardVO> list = boardService.doRetrive(inVO);

		jsonString = new Gson().toJson(list);
		LOG.debug("│jsonString = " + jsonString);
		LOG.debug("└──────────────────────────────┘");

		return jsonString;
	}

	@RequestMapping(value = "/doUpdate.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doUpdate(BoardVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		int flag = boardService.doUpdate(inVO);

		String message = "";// json으로 전달할 메시지
		if (1 == flag) {
			message = inVO.getTitle() + "수정 되었습니다.";
		} else {
			message = inVO.getTitle() + "수정 실패";
		}

		Message messageVO = new Message(String.valueOf(flag), message);

		jsonString = new Gson().toJson(messageVO);

		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}

	/**
	 * 검색
	 * 
	 * @param inVO
	 * @param model
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doSelectOne.do", method = RequestMethod.GET)
	public String doSelectOne(BoardVO inVO, Model model) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		LOG.debug("└=============================┘");

		BoardVO outVO = boardService.doSelectOne(inVO);

		jsonString = new Gson().toJson(outVO);
		LOG.debug("┌=============================┐");
		LOG.debug("|outVO=" + outVO);
		model.addAttribute("vo", outVO);
		LOG.debug("└=============================┘");

		return jsonString;
	}

	/**
	 * 추가
	 * 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doSave.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSave(BoardVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");

		LOG.debug("|inVO=" + inVO);

		int flag = this.boardService.doSave(inVO);

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

	/**
	 * 삭제
	 * 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doDelete.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(BoardVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		int flag = boardService.doDelete(inVO);

		LOG.debug("|flag=" + flag);

		String message = "";
		if (1 == flag) {
			message = "삭제 되었습니다.";
		} else {
			message = "삭제 실패!";
		}

		jsonString = new Gson().toJson(new Message(String.valueOf(flag), message));
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");

		return jsonString;
	}

}
