package com.pcwk.ehr.board.controller;

import java.sql.SQLException;
import java.util.ArrayList;
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
import com.pcwk.ehr.answer.domain.AnswerVO;
import com.pcwk.ehr.answer.service.AnswerService;
import com.pcwk.ehr.board.domain.BoardSearchVO;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.board.service.BoardService;
import com.pcwk.ehr.cmn.Message;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.code.domain.CodeVO;
import com.pcwk.ehr.code.service.CodeService;

@Controller("boardController")
@RequestMapping("board")
public class BoardController {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	BoardService boardService;

	@Autowired
	CodeService codeService;
	
	@Autowired
	AnswerService answerService;

	public BoardController() {

	}

	@RequestMapping(value = "/moveToReg.do", method = RequestMethod.GET)
	public String moveToReg(Model model, SearchVO inVO) throws SQLException {
		String VIEW_NAME = "board/board_reg";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		LOG.debug("|VIEW_NAME=" + VIEW_NAME);

		// code목록 조회
		List<String> codeList = new ArrayList<String>();
		codeList.add("BOARD_DIV");

		List<CodeVO> outCodeList = codeService.doRetrieve(codeList);

		LOG.debug("|outCodeList=" + outCodeList);
		LOG.debug("└=============================┘");

		model.addAttribute("BOARD_DIV", outCodeList);
		model.addAttribute("vo", inVO);
		return VIEW_NAME;
	}

	// board화면 보여주기
	@RequestMapping(value = "/boardView.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String boardView(Model model, BoardSearchVO inVO) throws SQLException {
		String VIEW_NAME = "board/board_list";

		// 페이지 번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// 페이지사이즈
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}

		// 10공지,20 문의사항
		if (null != inVO && null == inVO.getGubun()) {
			inVO.setGubun(StringUtil.nvl(inVO.getGubun(), "10"));
		}

		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		List<BoardVO> list = boardService.doRetrieve(inVO);

		// code목록 조회
		List<String> codeList = new ArrayList<String>();
		codeList.add("PAGE_SIZE");
		codeList.add("BOARD_SEARCH");

		List<CodeVO> outCodeList = codeService.doRetrieve(codeList);
		// 검색조건
		List<CodeVO> searchList = new ArrayList<CodeVO>();
		

		// 페이지사이즈
		List<CodeVO> pageSizeList = new ArrayList<CodeVO>();
		for (CodeVO vo : outCodeList) {
			if (vo.getMstCode().equals("PAGE_SIZE") == true) {
				pageSizeList.add(vo);
			}

			if (vo.getMstCode().equals("BOARD_SEARCH") == true) {
				searchList.add(vo);
			}
		}
		
		int totalCnt = 0;// 총글수
		double pageTotal = 0;// 총페이지수

		if (null != list && list.size() > 0) {
			totalCnt = list.get(0).getTotalCnt();

			pageTotal = Math.ceil((totalCnt / (inVO.getPageSize() * 1.0)));
			
			LOG.debug("|Math.ceil=" + (totalCnt / (inVO.getPageSize() * 1.0)));
			LOG.debug("|totalCnt=" + totalCnt);
			LOG.debug("|pageTotal=" + pageTotal);
			LOG.debug("|PageSize=" + inVO.getPageSize());
		}

		LOG.debug("|outCodeList=" + outCodeList);
		model.addAttribute("list", list);

		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageTotal", (int) pageTotal);

		model.addAttribute("PAGE_SIZE", pageSizeList);
		model.addAttribute("BOARD_SEARCH", searchList);
		return VIEW_NAME;
	}

	// 등록화면보여주기
		@RequestMapping(value = "/questionView.do")
		public String questionView(Model model, BoardSearchVO inVO, AnswerVO in) throws SQLException {
			String VIEW_NAME = "board/question_list";
			LOG.debug("┌──────────────────────────────┐");
			LOG.debug("│boardView ");
			LOG.debug("└──────────────────────────────┘");
			// 페이지 번호
					if (null != inVO && inVO.getPageNo() == 0) {
						inVO.setPageNo(1);
					}
					// 페이지사이즈
					if (null != inVO && inVO.getPageSize() == 0) {
						inVO.setPageSize(10);
					}
					// 10공지,20 자유게시판
					if (null != inVO && null == inVO.getGubun()) {
						inVO.setGubun(StringUtil.nvl(inVO.getGubun(), "30"));
					}
					LOG.debug("┌=============================┐");
					LOG.debug("|inVO=" + inVO);
					List<BoardVO> list = boardService.doRetrieve(inVO);
					List<AnswerVO> list01 = answerService.doSelectOne(in);
					
					// code목록 조회
					List<String> codeList = new ArrayList<String>();
					codeList.add("PAGE_SIZE");
					codeList.add("BOARD_SEARCH");
					List<CodeVO> outCodeList = codeService.doRetrieve(codeList);
					// 검색조건
					List<CodeVO> searchList = new ArrayList<CodeVO>();
					// 페이지사이즈
					List<CodeVO> pageSizeList = new ArrayList<CodeVO>();
					for (CodeVO vo : outCodeList) {
						if (vo.getMstCode().equals("PAGE_SIZE") == true) {
							pageSizeList.add(vo);
						}
						if (vo.getMstCode().equals("BOARD_SEARCH") == true) {
							searchList.add(vo);
						}
					}
					int totalCnt = 0;// 총글수
					double pageTotal = 0;// 총페이지수
					if (null != list && list.size() > 0) {
						totalCnt = list.get(0).getTotalCnt();
						pageTotal = Math.ceil((totalCnt / (inVO.getPageSize() * 1.0)));
						LOG.debug("|Math.ceil=" + (totalCnt / (inVO.getPageSize() * 1.0)));
						LOG.debug("|totalCnt=" + totalCnt);
						LOG.debug("|pageTotal=" + pageTotal);
						LOG.debug("|PageSize=" + inVO.getPageSize());
					}
					LOG.debug("|outCodeList=" + outCodeList);
					model.addAttribute("list", list);
					model.addAttribute("list01", list01);
					model.addAttribute("totalCnt", totalCnt);
					model.addAttribute("pageTotal", (int) pageTotal);
					model.addAttribute("PAGE_SIZE", pageSizeList);
					model.addAttribute("BOARD_SEARCH", searchList);
					return VIEW_NAME;
		}

	// board화면 등록화면보여주기
	@RequestMapping(value = "/questionReg.do", method = RequestMethod.GET)
	public String questionReg(Model model, BoardVO inVO) throws SQLException {
		String VIEW_NAME = "board/question_reg";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│boardView ");
		LOG.debug("└──────────────────────────────┘");

		return VIEW_NAME;
	}

	// board화면 등록화면보여주기
	@RequestMapping(value = "/boardReg.do", method = RequestMethod.GET)
	public String boardReg(Model model, BoardSearchVO inVO) throws SQLException {
		String VIEW_NAME = "board/board_reg";
		LOG.debug("┌=============================┐");	
		LOG.debug("|inVO="+inVO);		
		LOG.debug("|VIEW_NAME="+VIEW_NAME);		
		
		//code목록 조회
		List<String>  codeList=new ArrayList<String>();
		codeList.add("BOARD_DIV");
		
		List<CodeVO> outCodeList = codeService.doRetrieve(codeList);
		
		LOG.debug("|outCodeList="+outCodeList);		
		LOG.debug("└=============================┘");	
		
		model.addAttribute("BOARD_DIV", outCodeList);
		model.addAttribute("vo", inVO);
		return VIEW_NAME;
	}

	
	 // 상세조회
	 
	 @RequestMapping(value = "/questionMod.do", method = RequestMethod.GET) public
	 String boardMod(Model model, BoardVO inVO) throws SQLException { 
		 String VIEW_NAME = "board/question_mod"; 
	 LOG.debug("┌──────────────────────────────┐");
	 LOG.debug("│boardView "); 
	 LOG.debug("│inVO "+inVO);
	 LOG.debug("└──────────────────────────────┘");
	 
	 List<BoardVO> list = boardService.getALL(inVO); 
	 LOG.debug("│list "+list);
	 model.addAttribute("list", list);
	 
	 return VIEW_NAME; 
	 }

	/**
	 * 목록조회
	 * 
	 * @param inVO
	 * @return JSON(String)
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doRetrieve.do", method = RequestMethod.GET
			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doRetrieve(BoardSearchVO inVO) throws SQLException {
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

		List<BoardVO> list = boardService.doRetrieve(inVO);
		
		
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
	 * 
	 * doSelectOne
	 * 
	 * @param inVO
	 * @param model
	 * @return "board/board_mod"
	 * @throws SQLException
	 */
	@RequestMapping(value = "/doSelectOne.do", method = RequestMethod.GET)
	public String doSelectOne(BoardVO inVO, Model model) throws SQLException {
		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│inVO = "+inVO);
		LOG.debug("└──────────────────────────────┘");


		BoardVO outVO = boardService.doSelectOne(inVO);
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│outVO = "+outVO);
		String message = "";
		
		model.addAttribute("vo", outVO);
		
		LOG.debug("└──────────────────────────────┘");
		
		
		return "board/board_mod";
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
