package com.pcwk.ehr.admin.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pcwk.ehr.admin.domain.CategoryVO;
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
	public String categoryView(Model model, CategoryVO inVO) throws SQLException {
		String VIEW_NAME = "admin/admin_category_mng";
		
		List<CategoryVO> list = cateService.getALL();
		
		model.addAttribute("list", list);
		
		return VIEW_NAME;
	}
	
}
