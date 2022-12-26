package com.pcwk.ehr.admin.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.admin.service.CategoryService;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.SearchVO;

@Controller("adminCategory")
@RequestMapping("category")
public class AdminCategoryController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	CategoryService cateService;
	
	public AdminCategoryController() {}
	
	@RequestMapping(value = "categoryView.do", method = RequestMethod.GET)
	public String categoryView(Model model, CategoryVO inVO) throws SQLException {
		String VIEW_NAME = "admin/admin_category_mng";
		
		List<CategoryVO> list = cateService.getALL();
		
		model.addAttribute("list", list);
		
		return VIEW_NAME;
	}
	
	@RequestMapping(value = "/doUpdate.do", method = RequestMethod.GET,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doUpdate(CategoryVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌-------------------------------------┐");
		LOG.debug("|  inVO = " + inVO);
		
		int flag = cateService.doUpdate(inVO);
		
		String msg = "";
		if(0 == flag) {
			msg = inVO.getCategoryNm() + " 수정에 실패했습니다.";
		} else {
			msg = inVO.getCategoryNm() + " 수정에 성공했습니다.";
		}
		
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), msg));
		
		LOG.debug("|  jsonString : " + jsonString);
		LOG.debug("└-------------------------------------┘");
		return jsonString;
	}
	
	
	@RequestMapping(value = "/doDelete.do", method = RequestMethod.GET,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(CategoryVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌-------------------------------------┐");
		LOG.debug("|  inVO = " + inVO);
		
		int flag = cateService.doDelete(inVO);
		
		String msg = "";
		if(0 == flag) {
			msg = inVO.getCategoryNm() + " 삭제에 실패했습니다.";
		} else {
			msg = inVO.getCategoryNm() + " 삭제에 성공했습니다.";
		}
		
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), msg));
		
		LOG.debug("|  jsonString : " + jsonString);
		LOG.debug("└-------------------------------------┘");
		return jsonString;
	}
	
	@RequestMapping(value = "/doSelectOne.do", method = RequestMethod.GET,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSelectOne(CategoryVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌-------------------------------------┐");
		LOG.debug("|  inVO = " + inVO);
		
		CategoryVO outVO = cateService.doSelectOne(inVO);
		
		jsonString = new Gson().toJson(outVO);
		
		LOG.debug("|  jsonString : " + jsonString);
		LOG.debug("└-------------------------------------┘");
		return jsonString;
	}
	
	@RequestMapping(value = "/doSave.do", method = RequestMethod.GET,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSave(CategoryVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌-------------------------------------┐");
		LOG.debug("|  inVO = " + inVO);
		
		int flag = cateService.add(inVO);
		
		String msg = "";
		if(0 == flag) {
			msg = inVO.getCategoryNm() + " 등록에 실패했습니다.";
		} else {
			msg = inVO.getCategoryNm() + " 등록에 성공했습니다.";
		}
		
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), msg));
		
		LOG.debug("|  jsonString : " + jsonString);
		LOG.debug("└-------------------------------------┘");
		return jsonString;
	}
	
}
