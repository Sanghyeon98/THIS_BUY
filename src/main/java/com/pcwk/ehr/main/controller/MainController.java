package com.pcwk.ehr.main.controller;

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
import com.pcwk.ehr.admin.domain.CategoryVO;
import com.pcwk.ehr.admin.service.CategoryService;
 
@Controller("mainController")
@RequestMapping("main")
public class MainController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	final String VIEW_NAME = "main/main_page";
	
	@Autowired
	CategoryService cateService;
	
	@RequestMapping(value = "/main_page.do", method = RequestMethod.GET)
	public String singup() {
		LOG.debug("┌=============================┐");
		LOG.debug("|main_page                    |");
		LOG.debug("└=============================┘");

		return VIEW_NAME;
	}
	
	
	@RequestMapping(value = "/mainTop.do", method = RequestMethod.GET,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mainTop(Model model) throws SQLException {
		String jsonString = "";
		
		List<CategoryVO> list = cateService.getALL();
		
		List<CategoryVO> cate01List = new ArrayList<CategoryVO>();	// 1차 분류
		List<CategoryVO> cate02List = new ArrayList<CategoryVO>();	// 2차 분류
		
		for(CategoryVO vo : list) {
			if(vo.getTopNo() == 0) {	// 1차 분류면
				cate01List.add(vo);
			} else {	// 2차 분류면
				cate02List.add(vo);
			}
		}
		
		LOG.debug("cate01List(1차분류) : " + cate01List);
		LOG.debug("cate02List(2차분류) : " + cate02List);
		
		model.addAttribute("cate01List", cate01List);
		model.addAttribute("cate02List", cate02List);
		
		jsonString = new Gson().toJson(list);
		
		return jsonString;
	}
}