package com.pcwk.ehr.cmn;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	public TestController() {}
	
	@RequestMapping(value="thisbuy/admin_product_mng.do")
	public String adminProductMngView() {
		System.out.println("=================================");
		System.out.println("=== TestController, adminProductMngView() ===");
		System.out.println("=================================");
		
		/*
		 prefix + return값 + suffix
		 "/WEB-INF/views/" + anno/anno + ".jsp"
		 URL : /WEB-INF/views/anno/anno.jsp
		 */
		return "admin/admin_product_mng";
	}
	
	@RequestMapping(value="thisbuy/admin_product_reg.do")
	public String adminProductRegView() {
		System.out.println("=================================");
		System.out.println("=== TestController, adminProductRegView() ===");
		System.out.println("=================================");
		
		return "admin/admin_product_reg";
	}
	
	@RequestMapping(value="thisbuy/admin_category_mng.do")
	public String adminCategoryMngView() {
		System.out.println("=================================");
		System.out.println("=== TestController, adminCategoryMngView() ===");
		System.out.println("=================================");
		
		return "admin/admin_category_mng";
	}

}
