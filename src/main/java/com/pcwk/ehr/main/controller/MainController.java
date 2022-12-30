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
import com.pcwk.ehr.admin.service.ProductService;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.code.service.CodeService;
import com.pcwk.ehr.image.service.ImageService;
import com.pcwk.ehr.main.domain.ProductImgVO;
import com.pcwk.ehr.main.service.MainService;

@Controller("mainController")
@RequestMapping("main")
public class MainController {

	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	ProductService prodService;

	@Autowired
	CategoryService cateService;

	@Autowired
	CodeService codeService;

	@Autowired
	ImageService imgService;

	@Autowired
	MainService mainService;

	public MainController() {}

	@RequestMapping(value = "/main_page.do", method = RequestMethod.GET)
	public String mainPage(Model model) throws SQLException {
		LOG.debug("┌=============================┐");
		LOG.debug("|main_page                    |");
		LOG.debug("└=============================┘");

		List<ProductImgVO> list1 = mainService.cateList1();
		List<ProductImgVO> list2 = mainService.cateList2();
		List<ProductImgVO> list3 = mainService.cateList3();
		List<ProductImgVO> list4 = mainService.cateList4();
		List<ProductImgVO> list5 = mainService.cateList5();
		List<ProductImgVO> list6 = mainService.cateList6();

		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list5", list5);
		model.addAttribute("list6", list6);

		return "main/main_page";
	}
	
	@RequestMapping(value = "/latestProductPage.do", method = RequestMethod.GET)
	public String latestProduct(Model model) throws SQLException {
		LOG.debug("┌=============================┐");
		LOG.debug("|latestProductPage            |");
		LOG.debug("└=============================┘");

		List<ProductImgVO> list = mainService.getAll();

		model.addAttribute("list", list);

		return "main/latestProductPage";
	}

	// 상품 검색
	@RequestMapping(value = "/doRetrieve.do", method = RequestMethod.GET, 
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doRetrieve(SearchVO inVO) throws SQLException {
		String jsonString = "";

		// 페이지 번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// 페이지사이즈
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}

		// 검색구분
		if (null != inVO && null == inVO.getSearchDiv()) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv()));
		}

		// 검색어
		if (null != inVO && null == inVO.getSearchWord()) {
			inVO.setSearchWord(StringUtil.nvl(inVO.getSearchWord()));
		}

		// 카테고리ID
		if (null != inVO && null == inVO.getCateId()) {
			inVO.setCateId(StringUtil.nvl(inVO.getCateId()));
		}

		// 카테고리ID
		if (null != inVO && null == inVO.getCateClass01()) {
			inVO.setCateClass01(StringUtil.nvl(inVO.getCateClass01()));
		}
 
		// 카테고리ID
		if (null != inVO && null == inVO.getCateClass02()) {
			inVO.setCateClass02(StringUtil.nvl(inVO.getCateClass02()));
		}

		LOG.debug("┌-------------------------------------┐");
		LOG.debug("|  inVO = " + inVO);

		List<ProductImgVO> list = mainService.doRetrieve(inVO);

		jsonString = new Gson().toJson(list);
		LOG.debug("|  jsonString = " + jsonString);
		LOG.debug("└-------------------------------------┘");

		return jsonString;
	}
	
	@RequestMapping(value = "/mainSearchProduct.do", method = RequestMethod.GET)
	public String mainSearchProduct(SearchVO inVO, Model model) throws SQLException {
		
		// 페이지 번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// 페이지사이즈
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}		
		
		LOG.debug("┌-------------------------------------┐");
		LOG.debug("|  ProductImgVO inVO = " + inVO);
		
		List<ProductImgVO> list = mainService.doRetrieve(inVO);
		
		model.addAttribute("list", list);
		LOG.debug("|  ProductImgVO list = " + list);
		
		LOG.debug("└-------------------------------------┘");
		
		return "main/mainSearchProduct";
	}

	
	@RequestMapping(value = "/mainTop.do", method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8")
	@ResponseBody
    public String mainTop(Model model) throws SQLException {
        String jsonString = "";
        
    	List<CategoryVO> list = cateService.getALL();
        
        List<CategoryVO> cate01List = new ArrayList<CategoryVO>();    // 1차 분류
        List<CategoryVO> cate02List = new ArrayList<CategoryVO>();    // 2차 분류
        
        for(CategoryVO vo : list) {
            if(vo.getTopNo() == 0) {    // 1차 분류면
                cate01List.add(vo);
            } else {    // 2차 분류면
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