package com.pcwk.ehr.admin.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.admin.service.CategoryService;
import com.pcwk.ehr.admin.service.ProductService;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.code.domain.CodeVO;
import com.pcwk.ehr.code.service.CodeService;
import com.pcwk.ehr.image.domain.ImageVO;
import com.pcwk.ehr.image.service.ImageService;

@Controller("adminProduct")
@RequestMapping("product")
public class AdminProductController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ProductService prodService;
	
	@Autowired
	CategoryService cateService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	ImageService imgService;
	
	public AdminProductController() {}
	
	
	// 상품 수정
	@RequestMapping(value = "/doUpdate.do", method = RequestMethod.GET,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doUpdate(ProductVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌-------------------------------------┐");
		LOG.debug("|  inVO = " + inVO);
		
		int flag = prodService.doUpdate(inVO);
		LOG.debug("|  flag = " + flag);
		
		String msg = "";
		if(0 == flag) {	// 수정 실패
			msg = inVO.getName() + " 수정 실패"; 
		} else {
			msg = inVO.getName() + " 수정 성공"; 
		}
		
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), msg));
		
		LOG.debug("|  jsonString : " + jsonString);
		LOG.debug("└-------------------------------------┘");
		return jsonString;
	}
	
	
	// 상품 등록
	@RequestMapping(value = "/doSave.do", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSave(ProductVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌-------------------------------------┐");
		LOG.debug("|  inVO = " + inVO);
		
		int flag = prodService.add(inVO);
		
		String msg = "";
		if(0 == flag) {	// 상품 등록 실패
			msg = inVO.getName() + " 등록에 실패했습니다.";
		} else {
			msg = inVO.getName() + " 등록에 성공했습니다.";
		}
		
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(flag), msg));
		
		LOG.debug("|  jsonString : " + jsonString);
		LOG.debug("└-------------------------------------┘");
		
		return jsonString;
	}
	
	
	// 상품 품절 처리
	@RequestMapping(value = "/upSoldOutAll.do", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String upSoldOutAll(HttpServletRequest req) throws SQLException {
		String jsonString = "";
		
		String itemNoStr = req.getParameter("itemNo");
		LOG.debug("┌--------------------------------┐");	
		LOG.debug("|  itemNoStr = " + itemNoStr);
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		// 다건 품절 처리
		if(itemNoStr.indexOf(",") != -1) {
			String[] itemArray = itemNoStr.split(",");
			
			for(String itemNo : itemArray) {
				ProductVO tmpVO = new ProductVO();
				tmpVO.setItemNo(Integer.parseInt(itemNo));
				
				ProductVO tmpUpVO = prodService.doSelectOne(tmpVO);
				
				tmpUpVO.setQuantity(0);	// 제품 품절
				
				list.add(tmpUpVO);
			}
		} else {  // 한건 품절 처리
			ProductVO tmpVO = new ProductVO();
			tmpVO.setItemNo(Integer.parseInt(itemNoStr));
			
			ProductVO tmpUpVO = prodService.doSelectOne(tmpVO);
			
			tmpUpVO.setQuantity(0);	// 제품 품절
			
			list.add(tmpUpVO);
		}
		
		int soldOutCnt = prodService.upSoldOutAll(list);
		
		String msg = "";
		if(0 == soldOutCnt) {
			msg = "제품 품절에 실패했습니다.";
		} else {
			msg = itemNoStr + "제품 품절 성공!";
		}
		
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(soldOutCnt), msg));
		
		return jsonString;
	}
	
	
	// 상품 삭제 처리
	@RequestMapping(value = "/upDeleteAll.do", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String upDeleteAll(HttpServletRequest req) throws SQLException {
		String jsonString = "";
		
		String itemNoStr = req.getParameter("itemNo");
		LOG.debug("┌--------------------------------┐");	
		LOG.debug("|  itemNoStr = " + itemNoStr);
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		// 다건 삭제
		if(itemNoStr.indexOf(",") != -1) {
			String[] itemArray = itemNoStr.split(",");
			
			for(String itemNo : itemArray) {
				ProductVO tmpVO = new ProductVO();
				tmpVO.setItemNo(Integer.parseInt(itemNo));
				
				list.add(tmpVO);
			}
		} else {  // 한건 삭제
			ProductVO tmpVO = new ProductVO();
			tmpVO.setItemNo(Integer.parseInt(itemNoStr));
			
			list.add(tmpVO);
		}
		
		int delCnt = prodService.upDeleteAll(list);
		
		String msg = "";
		if(0 == delCnt) {
			msg = "제품 삭제에 실패했습니다.";
		} else {
			msg = itemNoStr + "제품 삭제 성공!";
		}
		
		jsonString = new Gson().toJson(new MessageVO(String.valueOf(delCnt), msg));
		
		return jsonString;
	}
	
	
	// 목록 검색
	@RequestMapping(value = "/doRetrieve.do", method = RequestMethod.GET,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doRetrieve(SearchVO inVO) throws SQLException {
		String jsonString = "";
		
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
		
		//카테고리ID
		if(null !=inVO && null == inVO.getCateId()) {  
			inVO.setCateId(StringUtil.nvl(inVO.getCateId()));
		}
		
		//카테고리ID
		if(null !=inVO && null == inVO.getCateClass01()) {  
			inVO.setCateClass01(StringUtil.nvl(inVO.getCateClass01()));
		}
		
		//카테고리ID
		if(null !=inVO && null == inVO.getCateClass02()) {  
			inVO.setCateClass02(StringUtil.nvl(inVO.getCateClass02()));
		}
		
		LOG.debug("┌-------------------------------------┐");
		LOG.debug("|  inVO = " + inVO);
		
		List<ProductVO> list = prodService.doRetrieve(inVO);
		
		jsonString = new Gson().toJson(list);
		LOG.debug("|  jsonString = " + jsonString);
		LOG.debug("└-------------------------------------┘");		
		
		return jsonString;
	}
	
	
	// 관리자 제품 관리 화면
	@RequestMapping(value = "/productView.do", method = RequestMethod.GET)
	public String productView(Model model, SearchVO inVO) throws SQLException { 
		String VIEW_NAME = "admin/admin_product_mng";
		
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
		
		//카테고리ID
		if(null !=inVO && null == inVO.getCateId()) {  
			inVO.setCateId(StringUtil.nvl(inVO.getCateId()));
		}
		
		//1차분류
		if(null !=inVO && null == inVO.getCateClass01()) {  
			inVO.setCateClass01(StringUtil.nvl(inVO.getCateClass01()));
		}
		
		//2차분류
		if(null !=inVO && null == inVO.getCateClass02()) {  
			inVO.setCateClass02(StringUtil.nvl(inVO.getCateClass02()));
		}
		
		LOG.debug("┌-------------------------------------┐");	
		LOG.debug("|  inVO = " + inVO);
		
		// 제품 목록 조회
		List<ProductVO> list = prodService.doRetrieve(inVO);
		
		
		// 카테고리 목록 조회 ---------------------------------------------------------
		List<CategoryVO> allCateList = cateService.getALL();
		
		List<CategoryVO> cate01List = new ArrayList<CategoryVO>();
		List<CategoryVO> cate02List = new ArrayList<CategoryVO>();
		
		for(CategoryVO vo : allCateList) {
			if(vo.getTopNo() == 0) {	// 1차 분류이면
				cate01List.add(vo);
			} else {	// 2차 분류이면
				cate02List.add(vo);
			}
		}
		
		// 2차 분류 json 전환
		String cate02ListJson = new Gson().toJson(cate02List);
		LOG.debug("|  cate02ListJson = " + cate02ListJson);
		
		String allCateJson = new Gson().toJson(allCateList);
		LOG.debug("|  allCateJson = " + allCateJson);
		// 카테고리 목록 조회 ---------------------------------------------------------
		
		
		// code 목록 조회 ----------------------------------------------------------
		List<String> codeList = new ArrayList<String>();
		codeList.add("PAGE_SIZE");
		codeList.add("BOARD_SEARCH");
		
		List<CodeVO> outCodeList = codeService.doRetrieve(codeList);
		LOG.debug("|  outCodeList = " + outCodeList);
		
		// 검색 조건
		List<CodeVO> searchList = new ArrayList<CodeVO>();
		
		// 페이지 사이즈
		List<CodeVO> pageSizeList = new ArrayList<CodeVO>();
		
		for(CodeVO vo : outCodeList) {
			if(vo.getMstCode().equals("BOARD_SEARCH")) {
				searchList.add(vo);
			}
			
			if (vo.getMstCode().equals("PAGE_SIZE")) {
				pageSizeList.add(vo);
			}
		}
		// code 목록 조회 END ------------------------------------------------------
		
		
		int totalCnt = 0;	// 총 제품 수
		double totalPage = 0;	// 총 페이지 수
		
		
		if(null != list && list.size() > 0) {
			totalCnt = list.get(0).getTotalCnt();
			totalPage = Math.ceil((totalCnt / (inVO.getPageSize() * 1.0)));
			
			LOG.debug("|  totalCnt = " + totalCnt);
			LOG.debug("|  pageTotal = " + totalPage);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("allCateJson", allCateJson);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("outCodeList", outCodeList);
		model.addAttribute("BOARD_SEARCH", searchList);
		model.addAttribute("PAGE_SIZE", pageSizeList);
		model.addAttribute("cate01List", cate01List);
		model.addAttribute("cate02List", cate02List);
		model.addAttribute("cate02ListJson", cate02ListJson);
		 
		return VIEW_NAME;
	}
	
	
	// 제품 수정 화면 이동
	@RequestMapping(value = "/moveToMod.do")
	public String moveToMod(ProductVO inVO, Model model) throws SQLException {
		
		// 카테고리 목록 조회 ---------------------------------------------------------
		List<CategoryVO> allCateList = cateService.getALL();
		
		List<CategoryVO> cate01List = new ArrayList<CategoryVO>();
		List<CategoryVO> cate02List = new ArrayList<CategoryVO>();
		
		for(CategoryVO vo : allCateList) {
			if(vo.getTopNo() == 0) {	// 1차 분류이면
				cate01List.add(vo);
			} else {	// 2차 분류이면
				cate02List.add(vo);
			}
		}
		
		// 2차 분류 json 전환
		String cate02ListJson = new Gson().toJson(cate02List);
		LOG.debug("|  cate02ListJson = " + cate02ListJson);
		
		String allCateJson = new Gson().toJson(allCateList);
		LOG.debug("|  allCateJson = " + allCateJson);
		// 카테고리 목록 조회 ---------------------------------------------------------
		
		// 제품 단건 조회
		ProductVO outVO = prodService.doSelectOne(inVO);
		LOG.debug("|  outVO = " + outVO);
		
		// 이미지 조회
		ImageVO imgVO = new ImageVO();
		imgVO.setImageNo(outVO.getImageNo());
		
		ImageVO outImgVO = imgService.doSelectOne(imgVO);
		LOG.debug("|  outImgVO = " + outImgVO);
		
		model.addAttribute("cate01List", cate01List);
		model.addAttribute("cate02List", cate02List);
		model.addAttribute("cate02ListJson", cate02ListJson);	
		model.addAttribute("vo", outVO);
		model.addAttribute("imgVO", outImgVO);
		
		return "admin/admin_product_mod";
	}
	
	
	// 제품 등록 화면 이동
	@RequestMapping(value = "/moveToReg.do", method = RequestMethod.GET)
	public String moveToReg(Model model) throws SQLException {
		
		// 카테고리 목록 조회 ---------------------------------------------------------
		List<CategoryVO> allCateList = cateService.getALL();
		
		List<CategoryVO> cate01List = new ArrayList<CategoryVO>();
		List<CategoryVO> cate02List = new ArrayList<CategoryVO>();
		
		for(CategoryVO vo : allCateList) {
			if(vo.getTopNo() == 0) {	// 1차 분류이면
				cate01List.add(vo);
			} else {	// 2차 분류이면
				cate02List.add(vo);
			}
		}
		
		// 2차 분류 json 전환
		String cate02ListJson = new Gson().toJson(cate02List);
		LOG.debug("|  cate02ListJson = " + cate02ListJson);
		
		String allCateJson = new Gson().toJson(allCateList);
		LOG.debug("|  allCateJson = " + allCateJson);
		// 카테고리 목록 조회 ---------------------------------------------------------

		model.addAttribute("cate01List", cate01List);
		model.addAttribute("cate02List", cate02List);
		model.addAttribute("cate02ListJson", cate02ListJson);		
				
		return "admin/admin_product_reg";
	}
	
}
