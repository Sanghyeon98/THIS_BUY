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

import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.admin.service.ProductService;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;

@Controller
@RequestMapping("product")
public class AdminController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ProductService prodService;
	
	public AdminController() {}
	
	
	// 제품 목록 화면
	@RequestMapping(value = "/productView.do", method = RequestMethod.GET)
	public String productView(Model model, SearchVO inVO) throws SQLException {
		String viewPage = "admin/admin_product_mng";
		
		//페이지 번호
		if(null !=inVO && inVO.getPageNo()==0) {
			inVO.setPageNo(1);
		}
		
		//페이지사이즈
		if(null !=inVO && inVO.getPageSize()==0) {
		    inVO.setPageSize(10);
		}
		
		//검색구분
		if(null !=inVO && null == inVO.getSearchDiv()) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv()));
		}
		
		//검색어
		if(null !=inVO && null == inVO.getSearchWord()) {  
			inVO.setSearchWord(StringUtil.nvl(inVO.getSearchWord()));
		}
		
		LOG.debug("┌-------------------------------------┐");	
		LOG.debug("|  inVO = " + inVO);
		
		// 제품 목록 조회
		List<ProductVO> list = prodService.doRetrieve(inVO);
		
		int totalCnt = 0;	// 총 제품 수
		double totalPage = 0;	// 총 페이지 수
		
		
		if(null != list && list.size() > 0) {
			totalCnt = list.get(0).getTotalCnt();
			totalPage = Math.ceil((totalCnt / (inVO.getPageSize() * 1.0)));
			
			LOG.debug("|  totalCnt = " + totalCnt);
			LOG.debug("|  pageTotal = " + totalPage);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("totalPage", totalPage);
		
		return viewPage;
	}
	
}
