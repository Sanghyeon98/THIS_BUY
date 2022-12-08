package com.pcwk.ehr.admin.controller;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pcwk.ehr.admin.service.CategoryService;
import com.pcwk.ehr.cmn.SearchVO;

@Controller("adminCategory")
@RequestMapping("category")
public class AdminCategoryController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	CategoryService cateService;
	
	public AdminCategoryController() {}
	
	@RequestMapping(value = "categoryView.do", method = RequestMethod.GET)
	public String categoryView(Model model, SearchVO inVO) throws SQLException {
		String VIEW_NAME = "admin/admin_category_mng";
		
		
		
		return VIEW_NAME;
	}
	
}
